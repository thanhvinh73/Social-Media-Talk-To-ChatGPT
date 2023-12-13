package com.mobile_project.social_media_with_chatgpt.services.user_service.service;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mobile_project.social_media_with_chatgpt.dao.profile.ProfileEntity;
import com.mobile_project.social_media_with_chatgpt.dao.profile.ProfileRepository;
import com.mobile_project.social_media_with_chatgpt.dao.user.UserEntity;
import com.mobile_project.social_media_with_chatgpt.dao.user.UserRepository;
import com.mobile_project.social_media_with_chatgpt.services.authentication_service.service.JwtService;
import com.mobile_project.social_media_with_chatgpt.services.user_service.models.ProfileRequest;
import com.mobile_project.social_media_with_chatgpt.services.user_service.models.ProfileResponse;
import com.mobile_project.social_media_with_chatgpt.services.user_service.models.UserResponse;
import com.mobile_project.social_media_with_chatgpt.shared.utils.StringUtil;

@Service
public class UserService implements IUserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private JwtService jwtService;
    @Autowired
    private ProfileRepository profileRepository;

    @Override
    public List<UserResponse> getAll() {
        List<UserEntity> listData = userRepository.findAll();
        return listData.stream().map(userEntity -> UserResponse.emptyInstance.fromEntity(userEntity)).toList();
    }

    @Override
    public Optional<UserResponse> getDataById(UUID id) throws NoSuchElementException {
        UserEntity userEntity = userRepository.findById(id).orElseThrow();
        return Optional.of(UserResponse.emptyInstance.fromEntity(userEntity));
    }

    @Override
    public Optional<UserResponse> getUserByToken(String token) throws NoSuchElementException {
        if (token != null && !token.trim().isEmpty()) {
            String subToken = new StringBuffer(token).substring(7);
            UserEntity userEntity = userRepository.findById(UUID.fromString(jwtService.extractUserId(subToken)))
                    .orElseThrow();
            return Optional.of(UserResponse.emptyInstance.fromEntity(userEntity));
        }
        return null;
    }

    @Override
    public Optional<ProfileResponse> getProfileByUser(String token) {
        String subToken = StringUtil.getToken(token);
        if (StringUtil.checkNullOrEmpty(subToken))
            return null;
        ProfileEntity profileEntity = profileRepository
                .findByUserId(UUID.fromString(jwtService.extractUserId(subToken))).orElseThrow();
        return Optional.of(ProfileResponse.emptyInstance.fromEntity(profileEntity));
    }

    @Override
    public Optional<ProfileResponse> updateProfile(String token, ProfileRequest profileRequest)
            throws NoSuchElementException {
        String subToken = StringUtil.getToken(token);
        if (StringUtil.checkNullOrEmpty(subToken))
            return null;
        ProfileEntity profileEntity = profileRepository
                .findByUserId(UUID.fromString(jwtService.extractUserId(subToken))).orElseThrow();
        profileEntity.setFirstname(profileRequest.getFirstname());
        profileEntity.setLastname(profileRequest.getFirstname());
        profileEntity.setDateOfBirth(profileRequest.getDateOfBirth());
        profileEntity.setAvatarUrl(profileRequest.getAvatarUrl());
        profileEntity.setCoverPhotoUrl(profileRequest.getCoverPhotoUrl());
        profileEntity.setPhone(profileRequest.getPhone());
        profileEntity.setGender(profileRequest.getGender());

        profileRepository.save(profileEntity);
        return Optional.of(ProfileResponse.emptyInstance.fromEntity(profileEntity));
    }

    @Override
    public Optional<UserResponse> insertData(UserResponse data) {
        throw new UnsupportedOperationException("Unimplemented method 'insertData'");
    }

    @Override
    public Optional<UserResponse> updateData(UserResponse data) {
        throw new UnsupportedOperationException("Unimplemented method 'updateData'");
    }

    @Override
    public void deleteData(UUID id) {
        throw new UnsupportedOperationException("Unimplemented method 'deleteData'");
    }

}
