package com.mobile_project.social_media_with_chatgpt.services.user_service.models;

import java.util.UUID;

import com.mobile_project.social_media_with_chatgpt.dao.user.UserEntity;
import com.mobile_project.social_media_with_chatgpt.shared.enums.UserRole;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserResponse {
    private UUID id;
    private String email;
    private UserRole role;
    private int createAt;

    public UserResponse(UserEntity userEntity) {
        this.id = userEntity.getId();
        this.email = userEntity.getEmail();
        this.role = userEntity.getRole();
        this.createAt = userEntity.getCreateAt();
    }
}
