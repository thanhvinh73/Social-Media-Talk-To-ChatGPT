package com.mobile_project.social_media_with_chatgpt.dao.comment;

import java.util.List;
import java.util.UUID;

import com.mobile_project.social_media_with_chatgpt.dao.file.FileEntity;
import com.mobile_project.social_media_with_chatgpt.dao.post.PostEntity;
import com.mobile_project.social_media_with_chatgpt.dao.user.UserEntity;
import com.mobile_project.social_media_with_chatgpt.shared.enums.CommentStatus;
import com.mobile_project.social_media_with_chatgpt.shared.public_data.AppEntity;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
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
@Entity(name = "comment")
public class CommentEntity implements AppEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Setter(AccessLevel.PRIVATE)
    private UUID commentId;

    @OneToMany(cascade = CascadeType.REMOVE)
    private List<FileEntity> images;

    @ManyToOne()
    private PostEntity post;

    @Enumerated(EnumType.STRING)
    @Builder.Default
    private CommentStatus status = CommentStatus.ACTIVE;

    @Column(name = "create_at")
    private Long createAt;

    @Column(name = "update_at")
    private Long updateAt;
    private String content;

    @ManyToOne()
    private UserEntity user;

}
