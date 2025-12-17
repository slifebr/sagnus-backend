package com.slifesys.sagnus.nfe.infrastructure.xml.store;

import com.slifesys.sagnus.nfe.application.port.NfeXmlStorePort;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;

@Component
@ConditionalOnProperty(name = "sagnus.nfe.xml.store", havingValue = "filesystem", matchIfMissing = true)
public class FileSystemNfeXmlStoreAdapter implements NfeXmlStorePort {

    private final Path baseDir;

    public FileSystemNfeXmlStoreAdapter(@Value("${sagnus.nfe.xml.dir:./var/nfe/xml}") String baseDir) {
        this.baseDir = Path.of(baseDir);
    }

    @Override
    public void store(String nfeId, String xml) {
        try {
            Files.createDirectories(baseDir);
            Path file = baseDir.resolve(nfeId + ".xml");
            Files.writeString(file, xml, StandardCharsets.UTF_8);
        } catch (IOException e) {
            throw new IllegalStateException("Falha ao gravar XML da NFe em disco. nfeId=" + nfeId, e);
        }
    }
}
