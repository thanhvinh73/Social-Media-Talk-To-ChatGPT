package com.mobile_project.social_media_with_chatgpt.services.file_service.controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.mobile_project.social_media_with_chatgpt.services.file_service.service.IFileService;
import com.mobile_project.social_media_with_chatgpt.shared.exceptions.FileStorageException;
import com.mobile_project.social_media_with_chatgpt.shared.public_data.ApiResponse;
import com.mobile_project.social_media_with_chatgpt.shared.public_data.ErrorResponse;
import com.mobile_project.social_media_with_chatgpt.shared.utils.FileUtil;

import jakarta.websocket.server.PathParam;

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

    // @GetMapping("/{fileId}")
    // public ResponseEntity<Resource> getFile(
    // @PathParam("fileId") String fileId) {
    // try {
    // // Resource resource = FileUtil.loadFile(url);

    // // HttpHeaders httpHeaders = new HttpHeaders();
    // //
    // httpHeaders.setContentType(MediaType.parseMediaType(myFile.getFileType()));
    // // httpHeaders.setContentDisposition(ContentDisposition.builder("attachment")
    // // .filename(myFile.getFileName(), StandardCharsets.UTF_8).build());

    // // return ResponseEntity.ok().headers(httpHeaders).body(resource);
    // } catch (FileStorageException e) {
    // e.printStackTrace();
    // } catch (IOException e) {
    // e.printStackTrace();
    // // return ResponseEntity.ok();
    // }

    // }

}
