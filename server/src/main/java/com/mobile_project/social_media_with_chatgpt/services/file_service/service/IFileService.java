package com.mobile_project.social_media_with_chatgpt.services.file_service.service;

import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.mobile_project.social_media_with_chatgpt.services.ICrudService;
import com.mobile_project.social_media_with_chatgpt.services.file_service.models.FileResponse;

public interface IFileService extends ICrudService<FileResponse, UUID> {
    Optional<FileResponse> uploadFile(MultipartFile multipartFile) throws IOException;

    List<FileResponse> uploadMultiFile(List<MultipartFile> multipartFiles) throws IOException;

}
