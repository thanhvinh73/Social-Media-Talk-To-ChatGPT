package com.mobile_project.social_media_with_chatgpt.services.authentication_service.service;

import java.util.NoSuchElementException;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mobile_project.social_media_with_chatgpt.dao.profile.ProfileEntity;
import com.mobile_project.social_media_with_chatgpt.dao.profile.ProfileRepository;
import com.mobile_project.social_media_with_chatgpt.dao.user.UserEntity;
import com.mobile_project.social_media_with_chatgpt.dao.user.UserRepository;
import com.mobile_project.social_media_with_chatgpt.services.authentication_service.models.AuthenticationRequest;
import com.mobile_project.social_media_with_chatgpt.services.authentication_service.models.AuthenticationResponse;
import com.mobile_project.social_media_with_chatgpt.services.authentication_service.models.RegisterRequest;
import com.mobile_project.social_media_with_chatgpt.shared.enums.UserRole;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AuthenticationService implements IAuthenticationService {

        private final UserRepository repository;
        private final ProfileRepository profileRepository;
        private final PasswordEncoder passwordEncoder;
        private final JwtService jwtService;
        private final AuthenticationManager authenticationManager;

        @Override
        public AuthenticationResponse register(RegisterRequest request) {
                UserEntity user = UserEntity.builder()
                                .firstname(request.getFirstname())
                                .lastname(request.getLastname())
                                .email(request.getEmail())
                                .password(passwordEncoder.encode(request.getPassword()))
                                .role(UserRole.USER)
                                .createAt(System.currentTimeMillis())
                                .build();
                repository.save(user);
                profileRepository.save(new ProfileEntity(user));
                String jwtToken = jwtService.generateToken(user);
                return AuthenticationResponse.builder()
                                .token(jwtToken)
                                .build();
        }

        @Override
        public AuthenticationResponse login(AuthenticationRequest request)
                        throws NoSuchElementException, AuthenticationException {
                UserEntity user = repository.findByEmail(request.getEmail()).orElseThrow();
                authenticationManager
                                .authenticate(new UsernamePasswordAuthenticationToken(request.getEmail(),
                                                request.getPassword()));
                String jwtToken = jwtService.generateToken(user);
                return AuthenticationResponse.builder()
                                .token(jwtToken)
                                .build();

        }

}
