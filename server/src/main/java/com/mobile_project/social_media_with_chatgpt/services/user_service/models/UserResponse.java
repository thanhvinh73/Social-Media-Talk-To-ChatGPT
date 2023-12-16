package com.mobile_project.social_media_with_chatgpt.services.user_service.models;

import java.util.UUID;

import com.mobile_project.social_media_with_chatgpt.dao.user.UserEntity;
import com.mobile_project.social_media_with_chatgpt.services.file_service.models.FileResponse;
import com.mobile_project.social_media_with_chatgpt.shared.enums.UserRole;
import com.mobile_project.social_media_with_chatgpt.shared.public_data.AppResponse;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@Builder
public class UserResponse extends AppResponse<UserResponse, UserEntity> {
    private UUID id;
    private String email;
    private String firstname;
    private String lastname;
    private FileResponse avatar;
    private UserRole role;
    private Long createAt;

    public static UserResponse emptyInstance() {
        return new UserResponse();
    }

    @Override
    public UserResponse fromEntity(UserEntity entity) {
        this.id = entity.getId();
        this.email = entity.getEmail();
        this.role = entity.getRole();
        this.createAt = entity.getCreateAt();
        this.firstname = entity.getFirstname();
        this.lastname = entity.getLastname();
        this.avatar = entity.getAvatar() != null ? FileResponse.emptyInstance().fromEntity(entity.getAvatar()) : null;
        return this;
    }

    @Override
    public UserEntity toUpdatedEntity(UserEntity entity) {
        entity.setFirstname(firstname);
        entity.setLastname(lastname);
        entity.setRole(role);
        entity.setCreateAt(createAt);
        return entity;
    }

    @Override
    public UserEntity toEntity() {
        return UserEntity.builder()
                .id(id)
                .email(email)
                .firstname(firstname)
                .lastname(lastname)
                .role(role)
                .createAt(createAt)
                .avatar(avatar == null ? null : avatar.toEntity())
                .build();
    }
}
