package com.mobile_project.social_media_with_chatgpt.dao.message;

import java.util.List;
import java.util.UUID;

import com.mobile_project.social_media_with_chatgpt.dao.conversation.ConversationEntity;
import com.mobile_project.social_media_with_chatgpt.dao.file.FileEntity;
import com.mobile_project.social_media_with_chatgpt.dao.user.UserEntity;
import com.mobile_project.social_media_with_chatgpt.shared.public_data.AppEntity;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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
@Entity(name = "message")
public class MessageEntity implements AppEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Setter(AccessLevel.PRIVATE)
    private UUID messageId;

    @OneToOne()
    private UserEntity sender;

    @OneToMany(cascade = CascadeType.REMOVE)
    private List<FileEntity> files;

    @OneToOne()
    private ConversationEntity conversation;

    @Builder.Default
    private Boolean read = false;
}
