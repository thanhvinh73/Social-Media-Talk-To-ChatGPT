package com.mobile_project.social_media_with_chatgpt.dao.file;

import java.io.Serializable;
import java.util.UUID;

import com.mobile_project.social_media_with_chatgpt.shared.public_data.AppEntity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity(name = "file")
public class FileEntity implements Serializable, AppEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Setter(AccessLevel.PRIVATE)
    private UUID fileId;

    private String name;
    private String url;
    private Long size;
    @Column(name = "mime_type")
    private String mimeType;
    @Column(name = "create_at")
    private Long createAt;
}
