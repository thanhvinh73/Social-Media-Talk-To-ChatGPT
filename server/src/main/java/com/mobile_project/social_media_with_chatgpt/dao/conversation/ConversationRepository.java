package com.mobile_project.social_media_with_chatgpt.dao.conversation;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ConversationRepository extends JpaRepository<ConversationEntity, UUID> {

}
