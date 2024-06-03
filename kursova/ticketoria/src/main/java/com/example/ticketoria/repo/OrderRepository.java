package com.example.ticketoria.repo;

import com.example.ticketoria.models.Session;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.example.ticketoria.models.Order;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

    List<Order> findBySession(Session session);
    List<Order> findBySessionAndSeatRowNumberAndSeatNumber(Session session, int seatRowNumber, int seatNumber);
}