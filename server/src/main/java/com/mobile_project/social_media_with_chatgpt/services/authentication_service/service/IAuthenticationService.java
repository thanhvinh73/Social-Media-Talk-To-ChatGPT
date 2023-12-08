package com.mobile_project.social_media_with_chatgpt.services.authentication_service.service;

import com.mobile_project.social_media_with_chatgpt.services.authentication_service.models.AuthenticationRequest;
import com.mobile_project.social_media_with_chatgpt.services.authentication_service.models.AuthenticationResponse;
import com.mobile_project.social_media_with_chatgpt.services.authentication_service.models.RegisterRequest;

public interface IAuthenticationService {

    AuthenticationResponse register(RegisterRequest request);

    AuthenticationResponse login(AuthenticationRequest request);
}
