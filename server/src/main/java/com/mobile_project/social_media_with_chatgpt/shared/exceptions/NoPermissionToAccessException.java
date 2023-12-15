package com.mobile_project.social_media_with_chatgpt.shared.exceptions;

public class NoPermissionToAccessException extends RuntimeException {
    public NoPermissionToAccessException(String message) {
        super(message);
    }

    public NoPermissionToAccessException(String message, Throwable cause) {
        super(message, cause);
    }
}
