package com.example.ticketoria.services;

import com.example.ticketoria.models.User;
import com.example.ticketoria.models.enums.Role;
import com.example.ticketoria.repo.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public boolean createUser(User user){
        String email = user.getEmail();
        if (userRepository.findByEmail(email) != null) return false;
        user.setActive(true);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.getRoles().add(Role.ROLE_ADMIN);
        log.info("Saving new user with email: {}", email);
        userRepository.save(user);
        return true;
    }

    public void logout() {
        SecurityContextHolder.clearContext();
    }



    public User getUserById(Long id) {
        return userRepository.findById(id).orElse(null);
    }


}
