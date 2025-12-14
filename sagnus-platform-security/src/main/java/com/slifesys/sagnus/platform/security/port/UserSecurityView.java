package com.slifesys.sagnus.platform.security.port;

import lombok.Builder;
import lombok.Value;

import java.util.List;

@Value
@Builder
public class UserSecurityView {
    Long userId;
    String login;
    String passwordHash;
    long tokenVersion;
    List<String> roles;
    boolean active;
}
