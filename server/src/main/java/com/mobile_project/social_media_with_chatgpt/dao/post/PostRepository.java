package com.mobile_project.social_media_with_chatgpt.dao.post;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface PostRepository extends JpaRepository<PostEntity, UUID> {

    @Query(value = "select * from post p where p.author_user_id :authorUserId", nativeQuery = true)
    List<PostEntity> findByAuthorUserId(UUID authorUserId);
}
