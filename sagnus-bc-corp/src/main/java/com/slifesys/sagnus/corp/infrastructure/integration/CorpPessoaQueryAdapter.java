package com.slifesys.sagnus.corp.infrastructure.integration;

import com.slifesys.sagnus.corp.api.contract.pessoa.CorpPessoaQueryPort;
import com.slifesys.sagnus.corp.api.contract.pessoa.PessoaResumoDTO;
import com.slifesys.sagnus.corp.domain.model.pessoa.Pessoa;
import com.slifesys.sagnus.corp.domain.model.pessoa.PessoaId;
import com.slifesys.sagnus.corp.domain.model.pessoa.TipoPessoa;
import com.slifesys.sagnus.corp.domain.port.PessoaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

/**
 * Implementação do contrato CORP para outros BCs.
 * Retorna DTO de contrato, não vaza domínio/JPA.
 */
@Component
@RequiredArgsConstructor
public class CorpPessoaQueryAdapter implements CorpPessoaQueryPort {

    private final PessoaRepository repo;

    @Override
    @Transactional(readOnly = true)
    public Optional<PessoaResumoDTO> obterResumoPorId(Long pessoaId) {
        if (pessoaId == null) return Optional.empty();
        return repo.findById(PessoaId.of(pessoaId))
                .map(this::toResumo);
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<PessoaResumoDTO> obterResumoPorDocumento(String tipo, String documento) {
        TipoPessoa t = parseTipo(tipo);
        String doc = documento == null ? null : documento.replaceAll("\\D", "");
        if (t == null || doc == null || doc.isBlank()) return Optional.empty();
        return repo.findByDocumento(doc, t).map(this::toResumo);
    }

    private PessoaResumoDTO toResumo(Pessoa p) {
        return PessoaResumoDTO.builder()
                .pessoaId(p.getId() != null ? p.getId().getValue() : null)
                .tipo(p.getTipo() == TipoPessoa.FISICA ? "F" : "J")
                .documento(p.getDocumento() != null ? p.getDocumento().getValue() : null)
                .nome(p.getNome() != null ? p.getNome().getValue() : null)
                .build();
    }

    private TipoPessoa parseTipo(String raw) {
        if (raw == null || raw.isBlank()) return null;
        String v = raw.trim().toUpperCase();
        if (v.equals("F") || v.equals("FISICA")) return TipoPessoa.FISICA;
        if (v.equals("J") || v.equals("JURIDICA")) return TipoPessoa.JURIDICA;
        return null;
    }
}
