package com.mobile_project.social_media_with_chatgpt.shared.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code = HttpStatus.NOT_FOUND, reason = "404 NOT FOUND")
public class NotFoundException extends RuntimeException {

}
