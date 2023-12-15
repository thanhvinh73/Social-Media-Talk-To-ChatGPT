package com.mobile_project.social_media_with_chatgpt.services.post_service.service;

import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.mobile_project.social_media_with_chatgpt.services.ICrudService;
import com.mobile_project.social_media_with_chatgpt.services.post_service.models.PostResponse;

public interface IPostService extends ICrudService<PostResponse, UUID> {

    List<PostResponse> findByAuthorUserId(String token);

    Optional<PostResponse> createPost(String token, PostResponse post, List<MultipartFile> files) throws IOException;

    Optional<PostResponse> getById(String token, UUID id);

    void deleteById(String token, UUID id);

    Optional<PostResponse> updateById(String token, UUID id, PostResponse post) throws IOException;

}
