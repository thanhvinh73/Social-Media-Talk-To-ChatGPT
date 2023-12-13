package com.mobile_project.social_media_with_chatgpt.services.authentication_service.controller;

import org.springframework.web.bind.annotation.RestController;

import com.mobile_project.social_media_with_chatgpt.services.authentication_service.models.AuthenticationRequest;
import com.mobile_project.social_media_with_chatgpt.services.authentication_service.models.AuthenticationResponse;
import com.mobile_project.social_media_with_chatgpt.services.authentication_service.models.RegisterRequest;
import com.mobile_project.social_media_with_chatgpt.services.authentication_service.service.IAuthenticationService;
import com.mobile_project.social_media_with_chatgpt.shared.public_data.ApiResponse;
import com.mobile_project.social_media_with_chatgpt.shared.public_data.ErrorResponse;

import lombok.RequiredArgsConstructor;

import org.springframework.web.bind.annotation.RequestMapping;

import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.AuthenticationException;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthenticationController {

    @Autowired
    private final IAuthenticationService service;

    @PostMapping("/register")
    public ResponseEntity<AuthenticationResponse> register(@RequestBody RegisterRequest request) {
        return ResponseEntity.ok(service.register(request));
    }

    @PostMapping("/login")
    public ResponseEntity<ApiResponse<Object>> login(@RequestBody AuthenticationRequest request) {
        try {
            return ResponseEntity.ok(new ApiResponse<>(service.login(request), "200"));
        } catch (NoSuchElementException e) {
            return ResponseEntity.badRequest().body(
                    new ApiResponse<>(new ErrorResponse("ERR.AUTH005", "User is not found!"), "400"));
        } catch (AuthenticationException e) {
            return ResponseEntity.badRequest().body(
                    new ApiResponse<>(new ErrorResponse("ERR.AUTH004", "Email or password is not correct!"), "400"));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(new ApiResponse<>(e.toString(), "400"));
        }
    }

    @GetMapping("/check-connection")
    public ResponseEntity<ApiResponse<String>> checkConnection() {
        return ResponseEntity.ok(new ApiResponse<String>("Connect to server successfully!", "200"));
    }

}
