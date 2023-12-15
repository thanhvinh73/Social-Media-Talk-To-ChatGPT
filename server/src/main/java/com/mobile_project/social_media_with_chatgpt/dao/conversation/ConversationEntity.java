package com.mobile_project.social_media_with_chatgpt.dao.conversation;

import java.util.List;
import java.util.UUID;

import com.mobile_project.social_media_with_chatgpt.dao.message.MessageEntity;
import com.mobile_project.social_media_with_chatgpt.dao.user.UserEntity;
import com.mobile_project.social_media_with_chatgpt.shared.enums.ConversationStatus;
import com.mobile_project.social_media_with_chatgpt.shared.public_data.AppEntity;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity(name = "conversation")
public class ConversationEntity implements AppEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Setter(AccessLevel.PRIVATE)
    private UUID conversationId;

    @Enumerated(EnumType.STRING)
    @Builder.Default
    private ConversationStatus status = ConversationStatus.ACTIVE;

    @OneToOne()
    private MessageEntity lastMessage;

    @ManyToMany()
    private List<UserEntity> users;

    @OneToMany(cascade = CascadeType.REMOVE)
    private List<MessageEntity> messages;

    private String receiverName;
    private String receiverAvatarUrl;
}
