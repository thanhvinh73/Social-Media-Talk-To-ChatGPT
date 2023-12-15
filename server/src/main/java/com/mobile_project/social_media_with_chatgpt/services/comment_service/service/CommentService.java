package com.mobile_project.social_media_with_chatgpt.services.comment_service.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mobile_project.social_media_with_chatgpt.dao.comment.CommentEntity;
import com.mobile_project.social_media_with_chatgpt.dao.comment.CommentRepository;
import com.mobile_project.social_media_with_chatgpt.dao.post.PostEntity;
import com.mobile_project.social_media_with_chatgpt.dao.post.PostRepository;
import com.mobile_project.social_media_with_chatgpt.dao.user.UserEntity;
import com.mobile_project.social_media_with_chatgpt.dao.user.UserRepository;
import com.mobile_project.social_media_with_chatgpt.services.authentication_service.service.JwtService;
import com.mobile_project.social_media_with_chatgpt.services.comment_service.models.CommentResponse;
import com.mobile_project.social_media_with_chatgpt.services.file_service.models.FileResponse;
import com.mobile_project.social_media_with_chatgpt.services.file_service.service.IFileService;
import com.mobile_project.social_media_with_chatgpt.shared.enums.CommentStatus;
import com.mobile_project.social_media_with_chatgpt.shared.utils.StringUtil;

@Service
public class CommentService implements ICommentService {

    @Autowired
    private CommentRepository commentRepository;
    @Autowired
    private IFileService fileService;
    @Autowired
    private JwtService jwtService;
    @Autowired
    private PostRepository postRepository;
    @Autowired
    private UserRepository userRepository;

    @Override
    public Optional<CommentResponse> createComment(String token, String postId, CommentResponse commentResponse,
            List<MultipartFile> files) throws IOException, NoSuchElementException {
        String userId = jwtService.extractUserId(StringUtil.getToken(token));
        UserEntity userEntity = userRepository.findById(UUID.fromString(userId)).orElseThrow();
        PostEntity postEntity = postRepository.findById(UUID.fromString(postId)).orElseThrow();
        CommentEntity commentEntity = commentResponse.toEntity();
        if (files != null && !files.isEmpty()) {
            List<FileResponse> fileResponses = fileService.uploadMultiFile(files);
            if (fileResponses != null && !fileResponses.isEmpty()) {
                commentEntity.setImages(fileResponses.stream().map((file) -> file.toEntity()).toList());
            }
        }
        commentEntity.setPost(postEntity);
        commentEntity.setUser(userEntity);
        commentEntity.setCreateAt(System.currentTimeMillis());
        commentEntity.setStatus(CommentStatus.ACTIVE);
        commentEntity = commentRepository.save(commentEntity);

        List<CommentEntity> postComments = (postEntity.getComments() == null || postEntity.getComments().isEmpty())
                ? new ArrayList<>()
                : postEntity.getComments();
        postComments.add(commentEntity);
        postEntity.setComments(postComments);
        postRepository.save(postEntity);
        return Optional.of(CommentResponse.emptyInstance().fromEntity(commentEntity));
    }

    @Override
    public List<CommentResponse> getCommentsInPost(String postId)
            throws NoSuchElementException, IllegalArgumentException {
        List<CommentResponse> result = new ArrayList<>();
        PostEntity postEntity = postRepository.findById(UUID.fromString(postId)).orElseThrow();

        if (postEntity.getComments() != null && !postEntity.getComments().isEmpty()) {
            result = postEntity.getComments().stream()
                    .map((comment) -> CommentResponse.emptyInstance().fromEntity(comment)).toList();
        }
        return result;
    }

}
