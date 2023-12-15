package com.mobile_project.social_media_with_chatgpt.services.file_service.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.mobile_project.social_media_with_chatgpt.dao.file.FileEntity;
import com.mobile_project.social_media_with_chatgpt.dao.file.FileRepository;
import com.mobile_project.social_media_with_chatgpt.services.file_service.models.FileResponse;
import com.mobile_project.social_media_with_chatgpt.shared.exceptions.FileStorageException;
import com.mobile_project.social_media_with_chatgpt.shared.utils.FileUtil;

@Service
public class FileService implements IFileService {

    @Autowired
    private FileRepository fileRepository;

    @Override
    public Optional<FileResponse> uploadFile(MultipartFile multipartFile) throws FileStorageException, IOException {
        String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());

        if (fileName.contains("..")) {
            throw new FileStorageException("Sorry! Filename contains invalid path sequence " + fileName);
        }
        String savePath = FileUtil.saveFile(multipartFile);

        FileEntity fileEntity = FileEntity.builder()
                .name(fileName)
                .createAt(System.currentTimeMillis())
                .size(multipartFile.getSize())
                .url(savePath)
                .mimeType(multipartFile.getContentType())
                .build();
        fileEntity = fileRepository.save(fileEntity);
        return Optional.of(FileResponse.emptyInstance().fromEntity(fileEntity));
    }

    @Override
    public List<FileResponse> uploadMultiFile(List<MultipartFile> multipartFiles)
            throws FileStorageException, IOException {
        List<String> savePaths = FileUtil.saveMultipleFile(multipartFiles);
        List<FileResponse> results = new ArrayList<>();
        for (int i = 0; i < multipartFiles.size(); i++) {
            MultipartFile multipartFile = multipartFiles.get(i);

            FileEntity fileEntity = FileEntity.builder()
                    .name(StringUtils.cleanPath(multipartFile.getOriginalFilename()))
                    .createAt(System.currentTimeMillis())
                    .size(multipartFile.getSize())
                    .url(savePaths.get(i))
                    .mimeType(multipartFile.getContentType())
                    .build();
            fileEntity = fileRepository.save(fileEntity);
            results.add(FileResponse.emptyInstance().fromEntity(fileEntity));
        }
        return results;
    }

    @Override
    public List<FileResponse> getAll() {
        return fileRepository.findAll().stream().map((entity) -> FileResponse.emptyInstance().fromEntity(entity))
                .toList();
    }

    @Override
    public Optional<FileResponse> getDataById(UUID id) throws NoSuchElementException {
        FileEntity fileEntity = fileRepository.findById(id).orElseThrow();
        return Optional.of(FileResponse.emptyInstance().fromEntity(fileEntity));
    }

    @Override
    public Optional<FileResponse> insertData(FileResponse data) throws IllegalArgumentException {
        FileEntity fileEntity = fileRepository.save(data.toEntity());
        return Optional.of(FileResponse.emptyInstance().fromEntity(fileEntity));
    }

    @Override
    public Optional<FileResponse> updateData(UUID id, FileResponse data) {
        throw new UnsupportedOperationException("Unimplemented method 'updateData'");
    }

    @Override
    public void deleteData(UUID id) throws IllegalArgumentException, NoSuchElementException {
        FileEntity entity = fileRepository.findById(id).orElseThrow();
        try {
            FileUtil.deleteFile(entity.getUrl());
        } catch (IOException e) {
            e.printStackTrace();
        }
        fileRepository.deleteById(id);
    }

}
