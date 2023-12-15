package com.mobile_project.social_media_with_chatgpt.dao.profile;

import java.util.UUID;

import com.mobile_project.social_media_with_chatgpt.dao.file.FileEntity;
import com.mobile_project.social_media_with_chatgpt.dao.user.UserEntity;
import com.mobile_project.social_media_with_chatgpt.shared.enums.ProfileStatus;
import com.mobile_project.social_media_with_chatgpt.shared.enums.UserGender;
import com.mobile_project.social_media_with_chatgpt.shared.public_data.AppEntity;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Builder
@Table(name = "profile")
public class ProfileEntity implements AppEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Setter(AccessLevel.PRIVATE)
    protected UUID id;

    protected String firstname;
    protected String lastname;
    protected String phone;

    @Column(unique = true)
    @Setter(AccessLevel.PRIVATE)
    protected String email;
    protected Long dateOfBirth;

    @Enumerated(EnumType.STRING)
    protected UserGender gender;

    @OneToOne(cascade = CascadeType.REMOVE)
    protected FileEntity avatar;
    @OneToOne(cascade = CascadeType.REMOVE)
    protected FileEntity coverPhoto;

    @Enumerated(EnumType.STRING)
    @Builder.Default
    protected ProfileStatus status = ProfileStatus.ACTIVE;

    @OneToOne()
    protected UserEntity user;

    public ProfileEntity(UserEntity entity) {
        this.firstname = entity.getFirstname();
        this.lastname = entity.getLastname();
        this.email = entity.getEmail();
        this.user = entity;
        this.status = ProfileStatus.ACTIVE;
    }
}
