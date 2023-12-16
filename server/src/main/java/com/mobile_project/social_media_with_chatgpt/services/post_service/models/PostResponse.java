package com.mobile_project.social_media_with_chatgpt.services.post_service.models;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.mobile_project.social_media_with_chatgpt.dao.post.PostEntity;
import com.mobile_project.social_media_with_chatgpt.services.file_service.models.FileResponse;
import com.mobile_project.social_media_with_chatgpt.services.user_service.models.UserResponse;
import com.mobile_project.social_media_with_chatgpt.shared.enums.PostStatus;
import com.mobile_project.social_media_with_chatgpt.shared.public_data.AppResponse;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PostResponse extends AppResponse<PostResponse, PostEntity> {
        private UUID postId;
        private UserResponse authorUser;
        private List<UserResponse> sharedUser;
        private List<FileResponse> images;
        private PostStatus status;
        private String title;
        private String description;
        private Long createAt;
        private Boolean updated;
        private Integer commentsLength;

        public static PostResponse emptyInstance() {
                return new PostResponse();
        }

        @Override
        public PostResponse fromEntity(PostEntity entity) {
                this.postId = entity.getPostId();
                this.authorUser = (entity.getAuthorUser() == null) ? null
                                : UserResponse.emptyInstance().fromEntity(entity.getAuthorUser());
                this.sharedUser = (entity.getSharedUser() == null || entity.getSharedUser().isEmpty())
                                ? new ArrayList<>()
                                : entity.getSharedUser().stream()
                                                .map((user) -> UserResponse.emptyInstance().fromEntity(user)).toList();
                this.images = (entity.getImages() == null || entity.getImages().isEmpty()) ? new ArrayList<>()
                                : entity.getImages().stream()
                                                .map((file) -> FileResponse.emptyInstance().fromEntity(file)).toList();
                this.status = entity.getStatus();
                this.title = entity.getTitle();
                this.description = entity.getDescription();
                this.createAt = entity.getCreateAt();
                this.updated = entity.getUpdated();
                this.commentsLength = (entity.getComments() == null || entity.getComments().isEmpty()) ? 0
                                : entity.getComments().size();
                return this;
        }

        @Override
        public PostEntity toUpdatedEntity(PostEntity entity) {
                entity.setImages(
                                (images == null || images.isEmpty()) ? null
                                                : images.stream().map((file) -> file.toEntity()).toList());
                entity.setSharedUser((sharedUser == null || sharedUser.isEmpty()) ? null
                                : sharedUser.stream().map((user) -> user.toEntity()).toList());
                entity.setStatus(status);
                entity.setTitle(title);
                entity.setDescription(description);
                entity.setUpdated(true);
                return entity;
        }

        @Override
        public PostEntity toEntity() {
                return PostEntity.builder()
                                .postId(postId)
                                .authorUser(authorUser == null ? null : authorUser.toEntity())
                                .sharedUser((sharedUser == null || sharedUser.isEmpty()) ? null
                                                : sharedUser.stream().map((user) -> user.toEntity()).toList())
                                .images((images == null || images.isEmpty()) ? null
                                                : images.stream().map((file) -> file.toEntity()).toList())
                                .title(title)
                                .description(description)
                                .createAt(createAt)
                                .updated(updated)
                                .status(status)
                                .build();
        }
}
