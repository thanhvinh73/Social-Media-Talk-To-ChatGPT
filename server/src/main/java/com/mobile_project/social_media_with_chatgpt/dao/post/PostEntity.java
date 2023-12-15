package com.mobile_project.social_media_with_chatgpt.dao.post;

import java.util.List;
import java.util.UUID;

import com.mobile_project.social_media_with_chatgpt.dao.comment.CommentEntity;
import com.mobile_project.social_media_with_chatgpt.dao.file.FileEntity;
import com.mobile_project.social_media_with_chatgpt.dao.user.UserEntity;
import com.mobile_project.social_media_with_chatgpt.shared.enums.PostStatus;
import com.mobile_project.social_media_with_chatgpt.shared.public_data.AppEntity;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.AccessLevel;

@Data
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity(name = "post")
public class PostEntity implements AppEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Setter(AccessLevel.PRIVATE)
    private UUID postId;

    @ManyToOne()
    private UserEntity authorUser;

    @ManyToMany(cascade = CascadeType.REMOVE)
    private List<UserEntity> sharedUser;

    @OneToMany(cascade = CascadeType.REMOVE)
    private List<FileEntity> images;

    @Enumerated(EnumType.STRING)
    @Builder.Default
    private PostStatus status = PostStatus.ACTIVE;

    private String title;
    private String description;

    @Column(name = "create_at")
    private Long createAt;

    private Boolean updated;

    @OneToMany(cascade = CascadeType.REMOVE)
    private List<CommentEntity> comments;

}
