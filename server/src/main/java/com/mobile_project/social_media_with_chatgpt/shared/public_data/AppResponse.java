package com.mobile_project.social_media_with_chatgpt.shared.public_data;

public abstract class AppResponse<T, U extends AppEntity> {
    public abstract T fromEntity(U entity);

    public abstract U toUpdatedEntity(U entity);

    public abstract U toEntity();
}
