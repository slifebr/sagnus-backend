package com.slifesys.sagnus.adm.infrastructure.database;

import com.slifesys.sagnus.adm.infrastructure.persistence.entity.UsuarioEntity;
import com.slifesys.sagnus.adm.infrastructure.persistence.repository.UsuarioJpaRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.annotation.Commit;
import org.springframework.test.context.ActiveProfiles;

import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;

@DataJpaTest
@ActiveProfiles("test")
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Commit
public class UsuarioRepositoryTest {

    @Autowired
    private UsuarioJpaRepository usuarioJpaRepository;

    @Test
    void shouldSaveAndFindUsuario() {
        // Arrange
        UsuarioEntity usuario = new UsuarioEntity();
        usuario.setNome("Test User");
        usuario.setUsername("testuser");
        usuario.setEmail("test@example.com");
        usuario.setAtivo(true);

        // Act
        UsuarioEntity saved = usuarioJpaRepository.save(usuario);
        
        // Assert
        assertThat(saved.getId()).isNotNull();
        
        Optional<UsuarioEntity> found = usuarioJpaRepository.findById(saved.getId());
        assertThat(found).isPresent();
        assertThat(found.get().getUsername()).isEqualTo("testuser");
        assertThat(found.get().getEmail()).isEqualTo("test@example.com");
    }
}
