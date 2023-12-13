package com.mobile_project.social_media_with_chatgpt.dao.message;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MessageRepository extends JpaRepository<MessageEntity, UUID> {

}
