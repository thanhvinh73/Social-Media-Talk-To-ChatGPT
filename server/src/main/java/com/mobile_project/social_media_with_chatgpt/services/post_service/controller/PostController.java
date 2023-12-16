package com.mobile_project.social_media_with_chatgpt.services.post_service.controller;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.mobile_project.social_media_with_chatgpt.services.post_service.models.PostResponse;
import com.mobile_project.social_media_with_chatgpt.services.post_service.service.IPostService;
import com.mobile_project.social_media_with_chatgpt.shared.exceptions.NoPermissionToAccessException;
import com.mobile_project.social_media_with_chatgpt.shared.public_data.ApiResponse;
import com.mobile_project.social_media_with_chatgpt.shared.public_data.ErrorResponse;

@RestController
@RequestMapping("/api/posts")
public class PostController {

    @Autowired
    private IPostService postService;

    @PostMapping(value = "", headers = "Content-Type=multipart/form-data")
    public ResponseEntity<ApiResponse<Object>> createPost(
            @RequestHeader("Authorization") String token,
            @RequestParam(name = "title") String title,
            @RequestParam(name = "description") String description,
            @RequestParam(name = "images", required = false) List<MultipartFile> files) {
        try {
            return ResponseEntity
                    .ok(ApiResponse.success(postService.createPost(token,
                            PostResponse.builder().title(title).description(description).build(), files)));
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest()
                    .body(ApiResponse.fail(new ErrorResponse("ERR.POST002", "Param must not be blank!")));
        } catch (NoSuchElementException e) {
            return ResponseEntity.badRequest()
                    .body(ApiResponse.fail(new ErrorResponse("ERR.POST001", "User is not found!")));
        } catch (Exception e) {
            return ResponseEntity.badRequest()
                    .body(ApiResponse.fail(new ErrorResponse("ERR.COM001", e.toString())));
        }
    }

    @GetMapping("/{postId}")
    public ResponseEntity<ApiResponse<Object>> getPostById(
            @RequestHeader("Authorization") String token,
            @PathVariable(name = "postId") String postId) {
        try {
            return ResponseEntity.ok(ApiResponse.success(postService.getById(token, UUID.fromString(postId))));
        } catch (NoPermissionToAccessException e) {
            return ResponseEntity.badRequest()
                    .body(ApiResponse.fail(new ErrorResponse("ERR.AUTH003", "You don't have permission to access")));
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest()
                    .body(ApiResponse.fail(new ErrorResponse("ERR.POST002", "Param must not be blank!")));
        } catch (NoSuchElementException e) {
            return ResponseEntity.badRequest()
                    .body(ApiResponse.fail(new ErrorResponse("ERR.POST001", "User is not found!")));
        } catch (Exception e) {
            return ResponseEntity.badRequest()
                    .body(ApiResponse.fail(new ErrorResponse("ERR.COM001", e.toString())));
        }
    }

    @GetMapping("/my-post")
    public ResponseEntity<ApiResponse<Object>> getMyPost(
            @RequestHeader("Authorization") String token) {
        try {
            return ResponseEntity.ok(ApiResponse.success(postService.findByAuthorUserId(token)));
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest()
                    .body(ApiResponse.fail(new ErrorResponse("ERR.POST002", "Param must not be blank!")));
        } catch (Exception e) {
            return ResponseEntity.badRequest()
                    .body(ApiResponse.fail(new ErrorResponse("ERR.COM001", e.toString())));
        }
    }

    @GetMapping("/all")
    public ResponseEntity<ApiResponse<Object>> getAll() {
        try {
            return ResponseEntity.ok(ApiResponse.success(postService.getAll()));
        } catch (Exception e) {
            return ResponseEntity.badRequest()
                    .body(ApiResponse.fail(new ErrorResponse("ERR.COM001", e.toString())));
        }
    }

    @PatchMapping("/{postId}")
    public ResponseEntity<ApiResponse<Object>> updatePost(
            @RequestHeader("Authorization") String token, @PathVariable(name = "postId") String postId,
            @RequestBody PostResponse body) {
        try {
            return ResponseEntity
                    .ok(ApiResponse.success(postService.updateById(token, UUID.fromString(postId),
                            body)));
        } catch (NoPermissionToAccessException e) {
            return ResponseEntity.badRequest()
                    .body(ApiResponse.fail(new ErrorResponse("ERR.AUTH003", "You don't have permission to access")));
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest()
                    .body(ApiResponse.fail(new ErrorResponse("ERR.POST002", "Param must not be blank!")));
        } catch (NoSuchElementException e) {
            return ResponseEntity.badRequest()
                    .body(ApiResponse.fail(new ErrorResponse("ERR.POST001", "User is not found!")));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.badRequest()
                    .body(ApiResponse.fail(new ErrorResponse("ERR.COM001", e.toString())));
        }
    }

    @DeleteMapping("/{postId}")
    public ResponseEntity<ApiResponse<Object>> deletePost(
            @RequestHeader("Authorization") String token, @PathVariable(name = "postId") String postId) {
        try {
            postService.deleteById(token, UUID.fromString(postId));
            return ResponseEntity
                    .ok(ApiResponse.success("Successfully"));
        } catch (NoPermissionToAccessException e) {
            return ResponseEntity.badRequest()
                    .body(ApiResponse.fail(new ErrorResponse("ERR.AUTH003", "You don't have permission to access")));
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest()
                    .body(ApiResponse.fail(new ErrorResponse("ERR.POST002", "Param must not be blank!")));
        } catch (Exception e) {
            return ResponseEntity.badRequest()
                    .body(ApiResponse.fail(new ErrorResponse("ERR.COM001", e.toString())));
        }
    }

}
