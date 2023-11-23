package com.mobile_project.social_media_with_chatgpt.services;

import java.util.List;

public interface CrudService<T, U> {
    List<T> getAll();

    T getDataById(U id);

    T insertData(T data);

    T updateData(T data);

    void deleteData(U id);
}
