package com.slifesys.sagnus.platform.security.port;

import java.util.Optional;

public interface UserSecurityPort {
    Optional<UserSecurityView> findByLogin(String login);
    Optional<UserSecurityView> findById(Long userId);
}
