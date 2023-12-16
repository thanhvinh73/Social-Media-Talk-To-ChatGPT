package com.mobile_project.social_media_with_chatgpt.services.user_service.service;

import java.io.IOException;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mobile_project.social_media_with_chatgpt.dao.file.FileEntity;
import com.mobile_project.social_media_with_chatgpt.dao.profile.ProfileEntity;
import com.mobile_project.social_media_with_chatgpt.dao.profile.ProfileRepository;
import com.mobile_project.social_media_with_chatgpt.dao.user.UserEntity;
import com.mobile_project.social_media_with_chatgpt.dao.user.UserRepository;
import com.mobile_project.social_media_with_chatgpt.services.authentication_service.service.JwtService;
import com.mobile_project.social_media_with_chatgpt.services.file_service.models.FileResponse;
import com.mobile_project.social_media_with_chatgpt.services.file_service.service.IFileService;
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
    @Autowired
    private IFileService fileService;

    @Override
    public List<UserResponse> getAll() {
        List<UserEntity> listData = userRepository.findAll();
        return listData.stream().map(userEntity -> UserResponse.emptyInstance().fromEntity(userEntity)).toList();
    }

    @Override
    public Optional<UserResponse> getDataById(UUID id) throws NoSuchElementException {
        UserEntity userEntity = userRepository.findById(id).orElseThrow();
        return Optional.of(UserResponse.emptyInstance().fromEntity(userEntity));
    }

    @Override
    public Optional<UserResponse> getUserByToken(String token) throws NoSuchElementException {
        if (token != null && !token.trim().isEmpty()) {
            String subToken = new StringBuffer(token).substring(7);
            UserEntity userEntity = userRepository.findById(UUID.fromString(jwtService.extractUserId(subToken)))
                    .orElseThrow();
            return Optional.of(UserResponse.emptyInstance().fromEntity(userEntity));
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
        return Optional.of(ProfileResponse.emptyInstance().fromEntity(profileEntity));
    }

    @Override
    public Optional<ProfileResponse> updateProfile(String token, ProfileResponse profileResponse)
            throws NoSuchElementException {
        String subToken = StringUtil.getToken(token);
        if (StringUtil.checkNullOrEmpty(subToken))
            return null;
        ProfileEntity profileEntity = profileRepository
                .findByUserId(UUID.fromString(jwtService.extractUserId(subToken))).orElseThrow();
        profileEntity = profileResponse.toUpdatedEntity(profileEntity);
        profileRepository.save(profileEntity);

        UserEntity userEntity = profileEntity.getUser();
        userEntity.setFirstname(profileEntity.getFirstname());
        userEntity.setLastname(profileEntity.getLastname());
        userRepository.save(userEntity);

        profileEntity.setUser(userEntity);
        return Optional.of(ProfileResponse.emptyInstance().fromEntity(profileEntity));
    }

    @Override
    public Optional<ProfileResponse> updateProfileImage(String token, MultipartFile avatar,
            MultipartFile coverPhoto)
            throws NoSuchElementException {
        String subToken = StringUtil.getToken(token);
        if (StringUtil.checkNullOrEmpty(subToken))
            return null;
        ProfileEntity profileEntity = profileRepository
                .findByUserId(UUID.fromString(jwtService.extractUserId(subToken))).orElseThrow();

        if (avatar != null) {
            try {
                FileResponse avatarResponse = fileService.uploadFile(avatar).orElse(null);
                FileEntity file = profileEntity.getAvatar();
                if (avatarResponse != null) {
                    profileEntity.setAvatar(avatarResponse.toEntity());
                    profileEntity = profileRepository.save(profileEntity);
                    UserEntity userEntity = profileEntity.getUser();
                    userEntity.setAvatar(profileEntity.getAvatar());
                    userRepository.save(userEntity);
                }
                if (file != null)
                    fileService.deleteData(file.getFileId());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if (coverPhoto != null) {
            try {
                FileResponse coverResponse = fileService.uploadFile(coverPhoto).orElse(null);
                FileEntity file = profileEntity.getCoverPhoto();
                if (coverResponse != null) {
                    profileEntity.setCoverPhoto(coverResponse.toEntity());
                    profileEntity = profileRepository.save(profileEntity);
                }
                if (file != null)
                    fileService.deleteData(file.getFileId());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return Optional.of(ProfileResponse.emptyInstance().fromEntity(profileEntity));
    }

    @Override
    public Optional<UserResponse> insertData(UserResponse data) {
        throw new UnsupportedOperationException("Unimplemented method 'insertData'");
    }

    @Override
    public Optional<UserResponse> updateData(UUID id, UserResponse data)
            throws NoSuchElementException, IllegalArgumentException {
        UserEntity userEntity = userRepository.findById(id).orElseThrow();
        userEntity = data.toUpdatedEntity(userEntity);

        return Optional.of(UserResponse.emptyInstance().fromEntity(userEntity));
    }

    @Override
    public void deleteData(UUID id) throws IllegalArgumentException {
        userRepository.deleteById(id);
    }

}
