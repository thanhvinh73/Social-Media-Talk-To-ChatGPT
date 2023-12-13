package com.mobile_project.social_media_with_chatgpt.dao.comment;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CommentRepository extends JpaRepository<CommentEntity, UUID> {

}
