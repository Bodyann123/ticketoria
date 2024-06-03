package com.example.ticketoria.controllers;

import com.example.ticketoria.models.Order;
import com.example.ticketoria.models.Session;
import com.example.ticketoria.services.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import com.example.ticketoria.services.SessionService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@Controller
@RequiredArgsConstructor
public class SessionController {
    private final SessionService sessionService;
    @Autowired
    private final OrderService orderService;

    @GetMapping("/")
    public String sessions(@RequestParam(name = "title", required = false) String title, Model model) {
        model.addAttribute("sessions", sessionService.listSessions(title));
        return "sessions" ;
    }

    @GetMapping("/session/{id}")
    public String sessionInfo(@PathVariable Long id, Model model){
        Session session = sessionService.getSessionById(id);
        model.addAttribute("session", session);
        return "session-info";

    }



    @PostMapping("/session/create")
    public String createSession( Session session) throws IOException {
        sessionService.saveSession(session);
        return "redirect:/";
    }

    @PostMapping("/session/delete/{id}")
    public String deleteSession(@PathVariable Long id){
        sessionService.delete(id);
        return "redirect:/";

    }

    @GetMapping("/session/{id}/book")
    public String bookSession(@PathVariable Long id, Model model) {
        Session session = sessionService.getSessionById(id);
        Order order = new Order();
        order.setSession(session);
        order.setQuantity(1);
        order.calculateTotalPrice();
        model.addAttribute("order", order);
        model.addAttribute("session", session);
        return "book-session";
    }



    @PostMapping("/session/{id}/order")
    public String createOrder(@PathVariable Long id,
                              @RequestParam("customerEmail") String customerEmail,
                              @RequestParam("seatRowNumber") int seatRowNumber,
                              @RequestParam("seatNumber") int seatNumber,
                              Model model) {
        Order order = new Order(customerEmail, seatRowNumber, seatNumber);
        model.addAttribute("order", order);


        Order savedOrder = orderService.saveOrder(order);

        return "redirect:/orders/" + savedOrder.getId();
    }

}
