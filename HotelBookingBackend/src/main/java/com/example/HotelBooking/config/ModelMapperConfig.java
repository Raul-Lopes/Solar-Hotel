package com.example.HotelBooking.config;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ModelMapperConfig {

    // Defines a bean that will be managed by the Spring container
    // The bean name will be 'modelMapper' (same as the method name)
    @Bean
    public ModelMapper modelMapper(){
        ModelMapper modelMapper = new ModelMapper();

        // Configure the ModelMapper instance with custom settings
        modelMapper.getConfiguration()
                // Enable field matching between source and destination objects
                // (allows mapping fields with the same name automatically)
                .setFieldMatchingEnabled(true)

                // Allow ModelMapper to access private fields (not just public/protected)
                // This enables mapping of private fields without getters/setters
                .setFieldAccessLevel(org.modelmapper.config.Configuration.AccessLevel.PRIVATE)

                // Set the matching strategy to STANDARD:
                // - Matches property names
                // - Case-insensitive
                // - Allows some flexibility in name matching
                // (other options: LOOSE for very flexible matching or STRICT for exact matching)
                .setMatchingStrategy(MatchingStrategies.STANDARD);

        // Return the configured ModelMapper instance
        // Spring will manage this instance and make it available for dependency injection
        return modelMapper;
    }
}
