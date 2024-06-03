package com.example.ticketoria.services;
import com.example.ticketoria.models.User;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import com.example.ticketoria.models.Order;
import com.example.ticketoria.repo.OrderRepository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.persistence.EntityNotFoundException;


@Service
@AllArgsConstructor
@Slf4j
public class OrderService {
    private final OrderRepository orderRepository;
    private final SessionService sessionService;
    private final UserService userService;

    public Order saveOrder(Order order) {
        return orderRepository.save(order);
    }

    public Order getOrderById(Long id) {
        return orderRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("Order not found"));
    }


    @GetMapping("/user/{userId}/orders")
    public String getUserOrders(@PathVariable Long userId, Model model) {
        User user = userService.getUserById(userId);
        if (user != null) {
            model.addAttribute("user", user);
        }
        return "orders";
    }
}
