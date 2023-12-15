package com.mobile_project.social_media_with_chatgpt.services.comment_service.service;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.web.multipart.MultipartFile;

import com.mobile_project.social_media_with_chatgpt.services.comment_service.models.CommentResponse;

public interface ICommentService {
    Optional<CommentResponse> createComment(String token, String postId, CommentResponse commentResponse,
            List<MultipartFile> files) throws IOException;

    List<CommentResponse> getCommentsInPost(String postId);
}
