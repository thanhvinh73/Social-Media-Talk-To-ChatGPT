package com.mobile_project.social_media_with_chatgpt.dao.file;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

public interface FileRepository extends JpaRepository<FileEntity, UUID> {

}
