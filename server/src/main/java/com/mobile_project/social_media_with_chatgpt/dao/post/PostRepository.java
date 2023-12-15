package com.mobile_project.social_media_with_chatgpt.dao.post;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PostRepository extends JpaRepository<PostEntity, UUID> {
    List<PostEntity> findByAuthorUserId(UUID authorUserId);
}
