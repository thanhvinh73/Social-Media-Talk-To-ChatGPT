package com.mobile_project.social_media_with_chatgpt.services.user_service.service;

import java.util.UUID;

import com.mobile_project.social_media_with_chatgpt.services.CrudService;
import com.mobile_project.social_media_with_chatgpt.services.user_service.models.UserResponse;

public interface IUserService extends CrudService<UserResponse, UUID> {

}
