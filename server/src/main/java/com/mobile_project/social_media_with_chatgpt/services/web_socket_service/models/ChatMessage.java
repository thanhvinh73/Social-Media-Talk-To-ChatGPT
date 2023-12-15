package com.mobile_project.social_media_with_chatgpt.services.web_socket_service.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@Builder
@AllArgsConstructor
public class ChatMessage {
    private String conent;
    private String sender;
    private MessageType type;
}
