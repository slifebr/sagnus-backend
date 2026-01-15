package com.slifesys.sagnus.adm.application.usecase;

import com.slifesys.sagnus.adm.application.command.UpsertParametrosCommand;
import com.slifesys.sagnus.adm.application.port.ParametroRepositoryPort;
import com.slifesys.sagnus.adm.application.result.UpsertParametrosResult;
import com.slifesys.sagnus.adm.domain.model.audit.Audit;
import com.slifesys.sagnus.adm.domain.model.parametro.ParametroConfig;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;

@Service
public class UpsertParametrosUseCase {

    private final ParametroRepositoryPort repo;

    public UpsertParametrosUseCase(ParametroRepositoryPort repo) {
        this.repo = repo;
    }

    @Transactional
    public UpsertParametrosResult execute(UpsertParametrosCommand cmd) {
        var now = Instant.now();
        var currentOpt = repo.findCurrent();

        ParametroConfig novo;
        if (currentOpt.isPresent()) {
            var atual = currentOpt.get();
            // Audit logic might be simplified here as ParametroConfig handles audit
            Audit updatedAudit = atual.getAudit() != null ? atual.getAudit() : new Audit();
            updatedAudit.setCreatedBy(cmd.usu()); // Simplified audit update
            
            novo = new ParametroConfig(
                    atual.getId(),
                    cmd.finParcelaAberto(),
                    cmd.finParcelaQuitado(),
                    cmd.finParcelaQuitadoParcial(),
                    cmd.finTipoRecebimentoEdi(),
                    cmd.compraFinDocOrigem(),
                    cmd.compraContaCaixa(),
                    updatedAudit
            );
        } else {
            Audit newAudit = new Audit();
            newAudit.setCreatedBy(cmd.usu());
            
            novo = new ParametroConfig(
                    null,
                    cmd.finParcelaAberto(),
                    cmd.finParcelaQuitado(),
                    cmd.finParcelaQuitadoParcial(),
                    cmd.finTipoRecebimentoEdi(),
                    cmd.compraFinDocOrigem(),
                    cmd.compraContaCaixa(),
                    newAudit
            );
        }

        var saved = repo.saveConfig(novo);
        // ID might be virtual or 0 if aggregated
        return new UpsertParametrosResult(saved.getId() != null ? saved.getId() : 1L);
    }
}
