package com.example.ticketoria.services;

import com.example.ticketoria.models.Order;
import com.example.ticketoria.models.Session;
import com.example.ticketoria.repo.SessionRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;


import javax.persistence.EntityNotFoundException;
import java.io.IOException;
import java.util.List;
import com.example.ticketoria.repo.OrderRepository;

@Service
@Slf4j
@RequiredArgsConstructor
public class SessionService {

    private final SessionRepository sessionRepository;
    private final OrderRepository orderRepository;

    public List<Session> listSessions(String title) {
        if (title != null) return sessionRepository.findByTitle(title);
        return sessionRepository.findAll();
    }

    public void saveSession(Session session) throws IOException {


        log.info("Saving new Session. Title: {}; ", session.getTitle());
        Session sessionFromDb = sessionRepository.save(session);
    }

    public void delete(Long id) {
        Session session = sessionRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Session not found"));

        List<Order> orders = orderRepository.findBySession(session);
        for (Order order : orders) {
            orderRepository.delete(order);
        }

        // Тепер видаляємо сесію
        sessionRepository.deleteById(id);
    }

    public Session getSessionById(Long id) {
        return sessionRepository.findById(id).orElse(null);
    }
}