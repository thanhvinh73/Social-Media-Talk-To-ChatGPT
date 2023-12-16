package com.mobile_project.social_media_with_chatgpt.services.comment_service.models;

import java.util.List;
import java.util.UUID;

import com.mobile_project.social_media_with_chatgpt.dao.comment.CommentEntity;
import com.mobile_project.social_media_with_chatgpt.services.file_service.models.FileResponse;
import com.mobile_project.social_media_with_chatgpt.services.post_service.models.PostResponse;
import com.mobile_project.social_media_with_chatgpt.services.user_service.models.UserResponse;
import com.mobile_project.social_media_with_chatgpt.shared.enums.CommentStatus;
import com.mobile_project.social_media_with_chatgpt.shared.public_data.AppResponse;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CommentResponse extends AppResponse<CommentResponse, CommentEntity> {
    private UUID commentId;
    private List<FileResponse> images;
    private PostResponse post;
    private CommentStatus status;
    private Long createAt;
    private Long updateAt;
    private String content;
    private UserResponse user;

    public static CommentResponse emptyInstance() {
        return new CommentResponse();
    }

    @Override
    public CommentResponse fromEntity(CommentEntity entity) {
        this.commentId = entity.getCommentId();
        this.images = (entity.getImages() == null || entity.getImages().isEmpty()) ? null
                : entity.getImages().stream().map((image) -> FileResponse.emptyInstance().fromEntity(image)).toList();
        this.post = PostResponse.emptyInstance().fromEntity(entity.getPost());
        this.status = entity.getStatus();
        this.updateAt = entity.getUpdateAt();
        this.createAt = entity.getCreateAt();
        this.content = entity.getContent();
        this.user = entity.getUser() == null ? null : UserResponse.emptyInstance().fromEntity(entity.getUser());
        return this;
    }

    @Override
    public CommentEntity toUpdatedEntity(CommentEntity entity) {
        entity.setImages((images == null || images.isEmpty()) ? null
                : images.stream().map((image) -> image.toEntity()).toList());
        entity.setStatus(status);
        entity.setUpdateAt(updateAt);
        entity.setContent(content);
        return entity;
    }

    @Override
    public CommentEntity toEntity() {
        return CommentEntity.builder()
                .images((images == null || images.isEmpty()) ? null
                        : images.stream().map((image) -> image.toEntity()).toList())
                .status(status)
                .createAt(createAt)
                .updateAt(updateAt)
                .content(content)
                .user(user != null ? user.toEntity() : null)
                .build();
    }
}
