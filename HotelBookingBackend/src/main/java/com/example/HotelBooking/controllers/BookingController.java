package com.example.HotelBooking.controllers;

import com.example.HotelBooking.dtos.BookingDTO;
import com.example.HotelBooking.dtos.Response;
import com.example.HotelBooking.services.BookingService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/bookings")
public class BookingController {

    private final BookingService bookingService;

    @GetMapping("/all")
    @PreAuthorize("hasAuthority('ADMIN')") // ADMIN ALONE HAVE ACCESS TO THIS API
    public ResponseEntity<Response> getAllBookings() {
        return ResponseEntity.ok(bookingService.getAllBookings());
    }

    @PostMapping
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('CUSTOMER') ") // ADMIN and customer HAVE ACCESS TO THIS API
    public ResponseEntity<Response> createBooking(@RequestBody BookingDTO bookingDTO) {
        return ResponseEntity.ok(bookingService.createBooking(bookingDTO));
    }

    @GetMapping("/{reference}")
    public ResponseEntity<Response> findBookingBookingByReferenceNo(@PathVariable String reference) {
        return ResponseEntity.ok(bookingService.findBookingBookingByReferenceNo(reference));
    }

    @PutMapping("/update")
    @PreAuthorize("hasAuthority('ADMIN')") // ADMIN ALONE HAVE ACCESS TO THIS API
    public ResponseEntity<Response> updateBooking(@RequestBody BookingDTO bookingDTO) {
        return ResponseEntity.ok(bookingService.updateBooking(bookingDTO));
    }

    @DeleteMapping("/delete/{bookReference}")
    public ResponseEntity<Response> deleteBookings(@PathVariable String bookReference) {
        return ResponseEntity.ok(bookingService.deleteBooking(bookReference));
    }
}
