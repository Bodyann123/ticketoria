package com.example.ticketoria.controllers;




import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;



@Controller
@RequiredArgsConstructor
public class OrderController {


    @GetMapping("/orders")
    public String getOrderDetails() {

        return "orders";
    }

}