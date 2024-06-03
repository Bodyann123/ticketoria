package com.example.ticketoria.repo;

import com.example.ticketoria.models.Session;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SessionRepository extends JpaRepository<Session, Long> {
    List<Session> findByTitle(String title);
}
