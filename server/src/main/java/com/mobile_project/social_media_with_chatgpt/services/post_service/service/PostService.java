package com.mobile_project.social_media_with_chatgpt.services.post_service.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mobile_project.social_media_with_chatgpt.dao.post.PostEntity;
import com.mobile_project.social_media_with_chatgpt.dao.post.PostRepository;
import com.mobile_project.social_media_with_chatgpt.dao.user.UserEntity;
import com.mobile_project.social_media_with_chatgpt.dao.user.UserRepository;
import com.mobile_project.social_media_with_chatgpt.services.authentication_service.service.JwtService;
import com.mobile_project.social_media_with_chatgpt.services.file_service.models.FileResponse;
import com.mobile_project.social_media_with_chatgpt.services.file_service.service.IFileService;
import com.mobile_project.social_media_with_chatgpt.services.post_service.models.PostResponse;
import com.mobile_project.social_media_with_chatgpt.shared.enums.PostStatus;
import com.mobile_project.social_media_with_chatgpt.shared.exceptions.NoPermissionToAccessException;
import com.mobile_project.social_media_with_chatgpt.shared.utils.StringUtil;

@Service
public class PostService implements IPostService {

    @Autowired
    private PostRepository postRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private IFileService fileService;
    @Autowired
    private JwtService jwtService;

    @Override
    public Optional<PostResponse> updateById(String token, UUID id, PostResponse post)
            throws IOException, NoPermissionToAccessException {
        String userId = jwtService.extractUserId(StringUtil.getToken(token));
        PostEntity postEntity = postRepository.findById(id).orElseThrow();
        if (userId.compareTo(postEntity.getAuthorUser().getId().toString()) != 0) {
            throw new NoPermissionToAccessException("You don't have permisstion to access");
        }

        postEntity = post.toUpdatedEntity(postEntity);
        postEntity = postRepository.save(postEntity);
        return Optional.of(PostResponse.emptyInstance().fromEntity(postEntity));
    }

    @Override
    public void deleteById(String token, UUID id) throws IllegalArgumentException, NoPermissionToAccessException {
        String userId = jwtService.extractUserId(StringUtil.getToken(token));
        PostResponse postResponse = getDataById(id).orElseThrow();
        if (userId.compareTo(postResponse.getAuthorUser().getId().toString()) != 0) {
            throw new NoPermissionToAccessException("You don't have permisstion to access");
        }
        deleteData(id);
    }

    @Override
    public Optional<PostResponse> getById(String token, UUID id)
            throws NoSuchElementException, NoPermissionToAccessException {
        String userId = jwtService.extractUserId(StringUtil.getToken(token));
        PostResponse postResponse = getDataById(id).orElseThrow();
        if (userId.compareTo(postResponse.getAuthorUser().getId().toString()) != 0) {
            throw new NoPermissionToAccessException("You don't have permisstion to access");
        }

        return Optional.of(postResponse);
    }

    @Override
    public Optional<PostResponse> createPost(String token, PostResponse post, List<MultipartFile> files)
            throws NoSuchElementException, IllegalArgumentException, IOException {
        String userId = jwtService.extractUserId(StringUtil.getToken(token));
        UserEntity userEntity = userRepository.findById(UUID.fromString(userId)).orElseThrow();
        PostEntity postEntity = post.toEntity();
        if (files != null && !files.isEmpty()) {
            List<FileResponse> fileResponses = fileService.uploadMultiFile(files);
            if (fileResponses != null && !fileResponses.isEmpty()) {
                postEntity.setImages(fileResponses.stream().map((file) -> file.toEntity()).toList());
            }
        }
        postEntity.setAuthorUser(userEntity);
        postEntity.setCreateAt(System.currentTimeMillis());
        postEntity.setUpdated(false);
        postEntity.setStatus(PostStatus.ACTIVE);
        postEntity = postRepository.save(postEntity);

        List<PostEntity> userPosts = (userEntity.getPosts() == null || userEntity.getPosts().isEmpty())
                ? new ArrayList<>()
                : userEntity.getPosts();
        userPosts.add(postEntity);
        userEntity.setPosts(userPosts);
        userRepository.save(userEntity);
        return Optional.of(PostResponse.emptyInstance().fromEntity(postEntity));
    }

    @Override
    public List<PostResponse> findByAuthorUserId(String token) throws IllegalArgumentException {
        String userId = jwtService.extractUserId(StringUtil.getToken(token));
        List<PostEntity> postEntities = postRepository.findByAuthorUserId(UUID.fromString(userId));

        return postEntities.stream().map((postEntity) -> PostResponse.emptyInstance().fromEntity(postEntity)).toList();
    }

    @Override
    public List<PostResponse> getAll() {
        List<PostEntity> postEntities = postRepository.findAll();
        if (postEntities == null || postEntities.isEmpty())
            return new ArrayList<>();
        return postEntities.stream().map((post) -> PostResponse.emptyInstance().fromEntity(post)).toList();
    }

    @Override
    public Optional<PostResponse> getDataById(UUID id) throws NoSuchElementException {
        PostEntity postEntity = postRepository.findById(id).orElseThrow();
        return Optional.of(PostResponse.emptyInstance().fromEntity(postEntity));
    }

    @Override
    public Optional<PostResponse> insertData(PostResponse data) {
        PostEntity postEntity = data.toEntity();
        postEntity.setCreateAt(System.currentTimeMillis());
        postEntity.setUpdated(false);

        return Optional.of(PostResponse.emptyInstance().fromEntity(postRepository.save(postEntity)));
    }

    @Override
    public Optional<PostResponse> updateData(UUID id, PostResponse data)
            throws NoSuchElementException, IllegalArgumentException {
        PostEntity postEntity = postRepository.findById(id).orElseThrow();
        return Optional
                .of(PostResponse.emptyInstance().fromEntity(postRepository.save(data.toUpdatedEntity(postEntity))));
    }

    @Override
    public void deleteData(UUID id) throws IllegalArgumentException {
        postRepository.deleteById(id);
    }

}
