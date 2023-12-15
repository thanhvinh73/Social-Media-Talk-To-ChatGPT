package com.mobile_project.social_media_with_chatgpt.shared.public_data;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@Builder
public class ApiResponse<T> {
    private T data;
    private Integer status;

    public static <T> ApiResponse<T> success(T data) {
        return new ApiResponse<T>(data, 200);
    }

    public static <T> ApiResponse<T> fail(T data) {
        return new ApiResponse<T>(data, 400);
    }
}
