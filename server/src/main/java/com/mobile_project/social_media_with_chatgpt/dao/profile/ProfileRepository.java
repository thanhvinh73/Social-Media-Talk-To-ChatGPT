package com.mobile_project.social_media_with_chatgpt.dao.profile;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ProfileRepository extends JpaRepository<ProfileEntity, UUID> {

    Optional<ProfileEntity> findByUserId(UUID userId);
}
