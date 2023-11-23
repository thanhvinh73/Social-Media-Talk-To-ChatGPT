package com.mobile_project.social_media_with_chatgpt.services.user_service.service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mobile_project.social_media_with_chatgpt.dao.user.UserEntity;
import com.mobile_project.social_media_with_chatgpt.dao.user.UserRepository;
import com.mobile_project.social_media_with_chatgpt.services.user_service.models.UserResponse;

@Service
public class UserService implements IUserService {
    @Autowired
    private UserRepository userRepository;

    @Override
    public List<UserResponse> getAll() {
        throw new UnsupportedOperationException("Unimplemented method 'getAll'");
    }

    @Override
    public UserResponse getDataById(UUID id) {
        Optional<UserEntity> userEntity = userRepository.findById(id);
        if (userEntity.isPresent()) {
            return new UserResponse(userEntity.get());
        }
        return null;
    }

    @Override
    public UserResponse insertData(UserResponse data) {
        throw new UnsupportedOperationException("Unimplemented method 'insertData'");
    }

    @Override
    public UserResponse updateData(UserResponse data) {
        throw new UnsupportedOperationException("Unimplemented method 'updateData'");
    }

    @Override
    public void deleteData(UUID id) {
        throw new UnsupportedOperationException("Unimplemented method 'deleteData'");
    }

}
