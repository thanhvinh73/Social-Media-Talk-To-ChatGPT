package com.mobile_project.social_media_with_chatgpt.services.authentication_service.controller;

import org.springframework.web.bind.annotation.RestController;

import com.mobile_project.social_media_with_chatgpt.services.authentication_service.models.AuthenticationRequest;
import com.mobile_project.social_media_with_chatgpt.services.authentication_service.models.AuthenticationResponse;
import com.mobile_project.social_media_with_chatgpt.services.authentication_service.models.RegisterRequest;
import com.mobile_project.social_media_with_chatgpt.services.authentication_service.service.IAuthenticationService;

import lombok.RequiredArgsConstructor;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthenticationController {

    private final IAuthenticationService service;

    @PostMapping("/register")
    public ResponseEntity<AuthenticationResponse> register(@RequestBody RegisterRequest request) {
        return ResponseEntity.ok(service.register(request));
    }

    @PostMapping("/login")
    public ResponseEntity<AuthenticationResponse> login(@RequestBody AuthenticationRequest request) {
        return ResponseEntity.ok(service.login(request));
    }

}
