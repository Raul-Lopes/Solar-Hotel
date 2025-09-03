package com.example.HotelBooking.payments.stripe;

import com.example.HotelBooking.dtos.NotificationDTO;
import com.example.HotelBooking.dtos.Response;
import com.example.HotelBooking.entities.Booking;
import com.example.HotelBooking.entities.PaymentEntity;
import com.example.HotelBooking.enums.NotificationType;
import com.example.HotelBooking.enums.PaymentGateway;
import com.example.HotelBooking.enums.PaymentStatus;
import com.example.HotelBooking.exceptions.NotFoundException;
import com.example.HotelBooking.notification.NotificationService;
import com.example.HotelBooking.respositories.BookingRepository;
import com.example.HotelBooking.respositories.PaymentRepository;
import com.stripe.Stripe;
import com.stripe.model.PaymentIntent;
import com.stripe.param.PaymentIntentCreateParams;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Service
@Slf4j
@RequiredArgsConstructor
public class PaymentService {

    public static final String USD = "usd";
    private final BookingRepository bookingRepository;
    private final PaymentRepository paymentRepository;
    private final NotificationService emailService;

    @Value("${stripe.api.secret.key}")
    private String secreteKey;

    //We are initializing a payment, this will return a unique transactionIS called secrete which
    //will be used to process, complete the payment in the frontend
    public Response initializePayment(PaymentRequest paymentRequest){

        log.info("Inside createPaymentIntent()");
        Stripe.apiKey = secreteKey;

        String bookingReference = paymentRequest.getBookingReference();

        Booking booking = bookingRepository.findByBookingReference(bookingReference)
                .orElseThrow(() -> new NotFoundException("Booking not found"));

        if (booking.getPaymentStatus() == PaymentStatus.COMPLETED){
            throw new NotFoundException("Payment already made for this booking");
        }

        if (booking.getTotalPrice().compareTo(paymentRequest.getAmount()) != 0){
            throw new NotFoundException("The payment amount doesn't match. Please contact our customer support agent.");
        }

        try {
            /*
            https://docs.stripe.com/testing?testing-method=payment-methods#visa
            Visa	                    pm_card_visa
            Visa (debit)	            pm_card_visa_debit
            Mastercard	                pm_card_mastercard
            Mastercard (debit)	        pm_card_mastercard_debit
            Mastercard (prepaid)	    pm_card_mastercard_prepaid
            American Express	        pm_card_amex
            Discover	                pm_card_discover
            Diners Club	                pm_card_diners
            JCB	pm_card_jcb UnionPay    pm_card_unionpay
            */
            PaymentIntentCreateParams params = PaymentIntentCreateParams.builder()
                    .setAmount(paymentRequest.getAmount().multiply(BigDecimal.valueOf(100)).longValue()) // converting to cent
                    .setCurrency(USD)
                    .setPaymentMethod("pm_card_mastercard")
                    .setReceiptEmail("xxxx@yahoo.com.br")
                    .putMetadata("bookingReference", bookingReference)
                    .addPaymentMethodType("card")
                    .build();

            PaymentIntent intent = PaymentIntent.create(params);
            String  uniqueTransactionId = intent.getClientSecret();

            return Response.builder()
                    .status(200)
                    .message("success")
                    .transactionId(uniqueTransactionId)
                    .build();

        }catch (Exception e){
            throw new RuntimeException("Error creating payment unique transaction id.");
        }
    }

    public void updatePaymentBooking(PaymentRequest paymentRequest){

        log.info("inside updatePaymentBooking()");

        String bookingReference = paymentRequest.getBookingReference();

        Booking booking = bookingRepository.findByBookingReference(bookingReference)
                .orElseThrow(() -> new NotFoundException("Booking Not Found"));

        PaymentEntity payment = new PaymentEntity();
        payment.setPaymentGateway(PaymentGateway.STRIPE);
        payment.setAmount(paymentRequest.getAmount());
        payment.setTransactionId(paymentRequest.getTransactionId());
        payment.setPaymentStatus(paymentRequest.isSuccess() ? PaymentStatus.COMPLETED : PaymentStatus.FAILED);
        payment.setPaymentDate(LocalDateTime.now());
        payment.setBookingReference(bookingReference);
        payment.setUser(booking.getUser());

        if (!paymentRequest.isSuccess()){
            payment.setFailureReason(paymentRequest.getFailureReason());
        }

        paymentRepository.save(payment); //save to payment table

        //create and send notification via email
        NotificationDTO notificationDTO = NotificationDTO.builder()
                .recipient(booking.getUser().getEmail())
                .type(NotificationType.EMAIL)
                .bookingReference(bookingReference)
                .build();

        if (paymentRequest.isSuccess()) {

            booking.setPaymentStatus(PaymentStatus.COMPLETED);
            bookingRepository.save(booking); //Update Booking Status To SUCCESFUL

            notificationDTO.setSubject("BOOKING PAYMENT SUCCESSFUL");
            notificationDTO.setBody("Congratulations!!" +
                    "\nYour payment for booking with reference: " + bookingReference + " is successful");
            emailService.sendEmail(notificationDTO);

        }else{

            booking.setPaymentStatus(PaymentStatus.FAILED);
            bookingRepository.save(booking); //UPDATE THE BOOKING

            notificationDTO.setSubject("BOOKING PAYMENT FAILED");
            notificationDTO.setBody("Your Payment for booking with reference: " + bookingReference + " failed. \nReason: " + paymentRequest.getFailureReason());
            emailService.sendEmail(notificationDTO);

        }
    }
}
