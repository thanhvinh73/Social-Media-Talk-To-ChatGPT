package com.mobile_project.social_media_with_chatgpt.services.user_service.service;

import java.util.Optional;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.mobile_project.social_media_with_chatgpt.services.ICrudService;
import com.mobile_project.social_media_with_chatgpt.services.user_service.models.ProfileResponse;
import com.mobile_project.social_media_with_chatgpt.services.user_service.models.UserResponse;

public interface IUserService extends ICrudService<UserResponse, UUID> {
    Optional<UserResponse> getUserByToken(String token);

    Optional<ProfileResponse> getProfileByUser(String token);

    Optional<ProfileResponse> updateProfile(String token, ProfileResponse profileResponse);

    Optional<ProfileResponse> updateProfileImage(String token, MultipartFile avatar, MultipartFile coverPhoto);
}
