package com.slifesys.sagnus.infrastructure.persistence.seguranca;

import com.slifesys.sagnus.domain.seguranca.UsuarioSistema;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UsuarioSistemaRepository extends JpaRepository<UsuarioSistema, Integer> {

    Optional<UsuarioSistema> findByLogin(String login);

    // se tiver coluna EH_ATIVO e você quiser filtrar só ativos:
    // Optional<UsuarioSistema> findByLoginAndEhAtivo(String login, String ehAtivo);
}
