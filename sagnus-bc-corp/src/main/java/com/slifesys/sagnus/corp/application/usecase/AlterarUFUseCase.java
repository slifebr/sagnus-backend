package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.AlterarUFCommand;
import com.slifesys.sagnus.corp.application.dto.UFResult;
import com.slifesys.sagnus.corp.application.port.UFRepository;
import com.slifesys.sagnus.corp.domain.model.uf.UF;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AlterarUFUseCase {

    private final UFRepository ufRepository;

    @Transactional
    public UFResult execute(AlterarUFCommand command) {
        UF uf = ufRepository.findById(command.getId())
                .orElseThrow(() -> new NotFoundException("CORP-404", "UF nao encontrada com id: " + command.getId()));

        UF atualizada = new UF(
                uf.getId(),
                command.getSigla() != null ? command.getSigla() : uf.getSigla(),
                command.getNome() != null ? command.getNome() : uf.getNome(),
                command.getIcmsInterno() != null ? command.getIcmsInterno() : uf.getIcmsInterno(),
                command.getIcmsInterestadual() != null ? command.getIcmsInterestadual() : uf.getIcmsInterestadual(),
                uf.getCriadoEm(),
                uf.getUsuCriacao(),
                java.time.Instant.now(),
                command.getUsuAlteracao());

        UF salvo = ufRepository.save(atualizada);
        return UFResult.from(salvo);
    }
}
