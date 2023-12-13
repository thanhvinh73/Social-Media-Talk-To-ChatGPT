package com.mobile_project.social_media_with_chatgpt.services.file_service.controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.mobile_project.social_media_with_chatgpt.services.file_service.models.FileResponse;
import com.mobile_project.social_media_with_chatgpt.services.file_service.service.IFileService;
import com.mobile_project.social_media_with_chatgpt.shared.exceptions.FileStorageException;
import com.mobile_project.social_media_with_chatgpt.shared.public_data.ApiResponse;
import com.mobile_project.social_media_with_chatgpt.shared.public_data.ErrorResponse;
import com.mobile_project.social_media_with_chatgpt.shared.utils.FileUtil;

@RestController
@RequestMapping("/api/files")
public class FileController {

    @Autowired
    private IFileService fileService;

    @PostMapping("/upload")
    public ResponseEntity<ApiResponse<Object>> uploadFile(@RequestParam("file") MultipartFile multipartFile) {
        try {
            return ResponseEntity.ok(ApiResponse.success(fileService.uploadFile(multipartFile).get()));
        } catch (FileStorageException e) {
            return ResponseEntity.ok(ApiResponse.fail(new ErrorResponse("ERR.FILE001", "Store file failed!")));
        } catch (IOException e) {
            return ResponseEntity.ok(ApiResponse.fail(new ErrorResponse("ERR.FILE001", "Store file failed!")));
        }
    }

    @PostMapping("/multi-upload")
    public ResponseEntity<ApiResponse<Object>> uploadMultiFile(
            @RequestParam("files") List<MultipartFile> multipartFiles) {
        try {
            return ResponseEntity.ok(ApiResponse.success(fileService.uploadMultiFile(multipartFiles)));
        } catch (FileStorageException e) {
            return ResponseEntity.ok(ApiResponse.fail(new ErrorResponse("ERR.FILE001", "Store file failed!")));
        } catch (IOException e) {
            return ResponseEntity.ok(ApiResponse.fail(new ErrorResponse("ERR.FILE001", "Store file failed!")));
        }
    }

    @GetMapping("/{fileId}")
    public ResponseEntity<?> getFile(@PathVariable(name = "fileId") String fileId) {
        try {
            FileResponse fileResponse = fileService.getDataById(UUID.fromString(fileId)).get();
            Resource resource = FileUtil.loadFile(fileResponse.getUrl());

            HttpHeaders httpHeaders = new HttpHeaders();
            httpHeaders.setContentType(MediaType.parseMediaType(fileResponse.getMimeType()));
            httpHeaders.setContentDisposition(ContentDisposition.builder("attachment")
                    .filename(fileResponse.getName(), StandardCharsets.UTF_8).build());

            return ResponseEntity.ok().headers(httpHeaders).body(resource);
        } catch (NoSuchElementException e) {
            return ResponseEntity.ok(ApiResponse.fail(new ErrorResponse("ERR.FILE002", "File is not found!")));
        } catch (IOException e) {
            return ResponseEntity.ok(ApiResponse.fail(new ErrorResponse("ERR.COM001", e.toString())));
        }

    }

    @GetMapping("/{fileId}/detail")
    public ResponseEntity<ApiResponse<Object>> getDetailFile(@PathVariable(name = "fileId") String fileId) {
        try {
            return ResponseEntity.ok(ApiResponse.success(fileService.getDataById(UUID.fromString(fileId)).get()));
        } catch (NoSuchElementException e) {
            return ResponseEntity.ok(ApiResponse.fail(new ErrorResponse("ERR.FILE002", "File is not found!")));
        } catch (Exception e) {
            return ResponseEntity.ok(ApiResponse.fail(new ErrorResponse("ERR.COM001", e.toString())));
        }

    }

    @GetMapping("")
    public ResponseEntity<ApiResponse<Object>> getAll() {
        try {
            return ResponseEntity.ok(ApiResponse.success(fileService.getAll()));
        } catch (NoSuchElementException e) {
            return ResponseEntity.ok(ApiResponse.fail(new ErrorResponse("ERR.FILE002", "File is not found!")));
        } catch (Exception e) {
            return ResponseEntity.ok(ApiResponse.fail(new ErrorResponse("ERR.COM001", e.toString())));
        }

    }

}
