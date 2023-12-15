package com.mobile_project.social_media_with_chatgpt.services.user_service.models;

import java.util.UUID;

import com.mobile_project.social_media_with_chatgpt.dao.profile.ProfileEntity;
import com.mobile_project.social_media_with_chatgpt.dao.user.UserEntity;
import com.mobile_project.social_media_with_chatgpt.services.file_service.models.FileResponse;
import com.mobile_project.social_media_with_chatgpt.shared.enums.ProfileStatus;
import com.mobile_project.social_media_with_chatgpt.shared.enums.UserGender;
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
public class ProfileResponse extends AppResponse<ProfileResponse, ProfileEntity> {
    private UUID id;
    private String firstname;
    private String lastname;
    private String phone;
    private String email;
    private Long dateOfBirth;
    private UserGender gender;
    private FileResponse avatar;
    private FileResponse coverPhoto;
    private ProfileStatus status;

    public static ProfileResponse emptyInstance() {
        return new ProfileResponse();
    };

    public ProfileResponse(UserEntity entity) {
        this.firstname = entity.getFirstname();
        this.lastname = entity.getLastname();
        this.email = entity.getEmail();
    }

    @Override
    public ProfileResponse fromEntity(ProfileEntity entity) {
        this.id = entity.getId();
        this.firstname = entity.getFirstname();
        this.lastname = entity.getLastname();
        this.phone = entity.getPhone();
        this.email = entity.getEmail();
        this.dateOfBirth = entity.getDateOfBirth();
        this.gender = entity.getGender();
        this.avatar = (entity.getAvatar() == null) ? null : FileResponse.emptyInstance().fromEntity(entity.getAvatar());
        this.coverPhoto = (entity.getCoverPhoto() == null) ? null
                : FileResponse.emptyInstance().fromEntity(entity.getCoverPhoto());
        this.status = entity.getStatus();
        return this;
    }

    @Override
    public ProfileEntity toUpdatedEntity(ProfileEntity entity) {
        entity.setFirstname(firstname);
        entity.setLastname(lastname);
        entity.setPhone(phone);
        entity.setDateOfBirth(dateOfBirth);
        entity.setGender(gender);
        entity.setStatus(status);
        return entity;
    }

    @Override
    public ProfileEntity toEntity() {
        return ProfileEntity.builder()
                .id(id)
                .firstname(firstname)
                .lastname(lastname)
                .phone(phone)
                .dateOfBirth(dateOfBirth)
                .gender(gender)
                .status(status)
                .build();
    }
}
