package com.mobile_project.social_media_with_chatgpt.services.user_service.models;

import com.mobile_project.social_media_with_chatgpt.shared.enums.UserGender;

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
public class ProfileRequest {
    private String firstname;
    private String lastname;
    private String phone;
    private Long dateOfBirth;
    private UserGender gender;
    private String avatarUrl;
    private String coverPhotoUrl;
}
