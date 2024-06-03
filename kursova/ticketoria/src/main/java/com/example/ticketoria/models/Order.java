package com.example.ticketoria.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.math.BigDecimal;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
@Entity
@Table(name = "orders")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Order {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;

        @ManyToOne
        @JoinColumn(name = "session_id", nullable = false)
        private Session session;

        @Column(name = "quantity")
        private int quantity = 1;

        @Column(name = "customer_email")
        private String customerEmail;

        @Column(name = "total_price")
        private BigDecimal totalPrice;

        @Column(name = "seat_row_number")
        @Min(value = 1, message = "Row number must be at least 1")
        @Max(value = 20, message = "Row number cannot exceed 20")
        private int seatRowNumber;

        @Column(name = "seat_number")
        @Min(value = 1, message = "Seat number must be at least 1")
        @Max(value = 20, message = "Seat number cannot exceed 20")
        private int seatNumber;

        public Order(String customerEmail, int seatRowNumber, int seatNumber) {
                this.customerEmail = customerEmail;
                this.seatNumber = seatNumber;
                this.seatRowNumber = seatRowNumber;
        }

        @PrePersist
        public void calculateTotalPrice() {
                this.totalPrice = BigDecimal.valueOf(this.session.getPrice()).multiply(BigDecimal.valueOf(this.quantity));
        }
}