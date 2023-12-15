package com.mobile_project.social_media_with_chatgpt.services.comment_service.controller;

import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.mobile_project.social_media_with_chatgpt.services.comment_service.models.CommentResponse;
import com.mobile_project.social_media_with_chatgpt.services.comment_service.service.ICommentService;
import com.mobile_project.social_media_with_chatgpt.shared.public_data.ApiResponse;
import com.mobile_project.social_media_with_chatgpt.shared.public_data.ErrorResponse;

@RestController
@RequestMapping("/api/comments")
public class CommentController {

    @Autowired
    private ICommentService commentService;

    @PostMapping(value = "/{postId}", headers = "Content-Type=multipart/form-data")
    public ResponseEntity<ApiResponse<Object>> createComment(
            @RequestHeader("Authorization") String token,
            @PathVariable(name = "postId") String postId,
            @RequestParam(name = "content") String content,
            @RequestParam(name = "images", required = false) List<MultipartFile> files) {
        try {
            return ResponseEntity
                    .ok(ApiResponse.success(commentService.createComment(token, postId,
                            CommentResponse.builder().content(content).build(), files)));
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest()
                    .body(ApiResponse.fail(new ErrorResponse("ERR.CMT002", "Param must not be blank!")));
        } catch (NoSuchElementException e) {
            return ResponseEntity.badRequest()
                    .body(ApiResponse.fail(new ErrorResponse("ERR.CMT001", "Post or User is not found!")));
        } catch (Exception e) {
            return ResponseEntity.badRequest()
                    .body(ApiResponse.fail(new ErrorResponse("ERR.COM001", e.toString())));
        }
    }

    @GetMapping(value = "/{postId}/all")
    public ResponseEntity<ApiResponse<Object>> getCommentsByPost(@PathVariable(name = "postId") String postId) {
        try {
            return ResponseEntity
                    .ok(ApiResponse.success(commentService.getCommentsInPost(postId)));
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest()
                    .body(ApiResponse.fail(new ErrorResponse("ERR.CMT002", "Param must not be blank!")));
        } catch (NoSuchElementException e) {
            return ResponseEntity.badRequest()
                    .body(ApiResponse.fail(new ErrorResponse("ERR.CMT001", "Post or User is not found!")));
        } catch (Exception e) {
            return ResponseEntity.badRequest()
                    .body(ApiResponse.fail(new ErrorResponse("ERR.COM001", e.toString())));
        }
    }

}
