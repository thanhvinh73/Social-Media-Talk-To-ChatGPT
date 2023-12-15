package com.mobile_project.social_media_with_chatgpt.services.file_service.models;

import java.util.UUID;

import com.mobile_project.social_media_with_chatgpt.dao.file.FileEntity;
import com.mobile_project.social_media_with_chatgpt.shared.public_data.AppResponse;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class FileResponse extends AppResponse<FileResponse, FileEntity> {
    private UUID fileId;
    private String name;
    private String url;
    private Long size;
    private String mimeType;
    private Long createAt;

    public static FileResponse emptyInstance() {
        return new FileResponse();
    };

    @Override
    public FileResponse fromEntity(FileEntity entity) {
        this.fileId = entity.getFileId();
        this.name = entity.getName();
        this.url = entity.getUrl();
        this.size = entity.getSize();
        this.mimeType = entity.getMimeType();
        this.createAt = entity.getCreateAt();
        return this;
    }

    @Override
    public FileEntity toUpdatedEntity(FileEntity entity) {
        entity.setName(name);
        entity.setUrl(url);
        entity.setSize(size);
        entity.setMimeType(mimeType);
        entity.setCreateAt(createAt);
        return entity;
    }

    @Override
    public FileEntity toEntity() {
        return FileEntity.builder()
                .fileId(fileId)
                .name(name)
                .url(url)
                .size(size)
                .mimeType(mimeType)
                .createAt(createAt)
                .build();
    }
}
