package com.mobile_project.social_media_with_chatgpt.dao.profile;

import java.time.LocalDateTime;

import com.mobile_project.social_media_with_chatgpt.shared.enums.ProfileStatus;
import com.mobile_project.social_media_with_chatgpt.shared.enums.UserGender;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "profile")
public class ProfileEntity {
    @Id
    @Setter(AccessLevel.PRIVATE)
    private String id;
    private String firstname;
    private String lastname;
    private String phone;
    private String email;
    private LocalDateTime dateOfBirth;

    @Enumerated(EnumType.STRING)
    private UserGender gender;

    private String avatarUrl;
    private String coverPhotoUrl;

    @Enumerated(EnumType.STRING)
    private ProfileStatus status;

    @Column(unique = true)
    private String userId;
}
