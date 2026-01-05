package com.slifesys.sagnus.corp.infrastructure.integration;

import com.slifesys.sagnus.corp.contract.pessoa.CorpPessoaQueryPort;
import com.slifesys.sagnus.corp.contract.pessoa.PessoaResumoDTO;
import com.slifesys.sagnus.corp.domain.model.pessoa.Pessoa;
import com.slifesys.sagnus.corp.domain.model.pessoa.PessoaId;
import com.slifesys.sagnus.corp.domain.model.pessoa.TipoPessoa;
import com.slifesys.sagnus.corp.infrastructure.persistence.jpa.repo.PessoaSpringDataRepository;
import com.slifesys.sagnus.corp.application.port.PessoaRepository;
//import com.slifesys.sagnus.corp.infrastructure.persistence.jpa.repository.PessoaJpaRepository; // nao existe package

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
        if (pessoaId == null)
            return Optional.empty();
        return repo.findById(PessoaId.of(pessoaId))
                .map(this::toResumo);
    }

    /**
     * Assinatura alinhada com o contrato (BC CORP API).
     *
     * Regras práticas:
     * - documento com 11 dígitos -> CPF (FISICA)
     * - documento com 14 dígitos -> CNPJ (JURIDICA)
     * - caso não dê para inferir, tenta FISICA e depois JURIDICA
     */
    @Override
    @Transactional(readOnly = true)
    public Optional<PessoaResumoDTO> obterResumoPorDocumento(String tipo, String documento) {
        TipoPessoa t = parseTipo(tipo);
        String doc = documento == null ? null : documento.replaceAll("\\D", "");
        if (t == null || doc == null || doc.isBlank())
            return Optional.empty();
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

    /*
     * //- verificar se relamente teria que ja mapear para um entity jpa
     * private PessoaResumoDTO toResumoJpa(PessoaEntity p) {
     * return PessoaResumoDTO.builder()
     * .pessoaId(p.getId())
     * .tipo(p.getTipo().name())
     * .documento(p.getDocumento())
     * .nomeRazao(p.getNomeRazao())
     * .ie(p.getIe())
     * .uf(p.getUf())
     * .municipioCodIbge(p.getMunicipioCodIbge())
     * .endereco(p.getEndereco())
     * .numero(p.getNumero())
     * .bairro(p.getBairro())
     * .cep(p.getCep())
     * .build();
     * }
     */
    private TipoPessoa parseTipo(String raw) {
        if (raw == null || raw.isBlank())
            return null;
        String v = raw.trim().toUpperCase();
        if (v.equals("F") || v.equals("FISICA"))
            return TipoPessoa.FISICA;
        if (v.equals("J") || v.equals("JURIDICA"))
            return TipoPessoa.JURIDICA;
        return null;
    }
}
