package com.slifesys.sagnus.adm.application.usecase;

import com.slifesys.sagnus.adm.application.command.UpsertParametrosCommand;
import com.slifesys.sagnus.adm.application.port.ParametroRepositoryPort;
import com.slifesys.sagnus.adm.application.result.UpsertParametrosResult;
import com.slifesys.sagnus.adm.domain.model.Audit;
import com.slifesys.sagnus.adm.domain.model.Parametro;

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

        Parametro novo;
        if (currentOpt.isPresent()) {
            var atual = currentOpt.get();
            novo = new Parametro(
                    atual.id(),
                    cmd.finParcelaAberto(),
                    cmd.finParcelaQuitado(),
                    cmd.finParcelaQuitadoParcial(),
                    cmd.finTipoRecebimentoEdi(),
                    cmd.compraFinDocOrigem(),
                    cmd.compraContaCaixa(),
                    atual.audit().comAlteracao(cmd.usu(), now)
            );
        } else {
            novo = new Parametro(
                    null,
                    cmd.finParcelaAberto(),
                    cmd.finParcelaQuitado(),
                    cmd.finParcelaQuitadoParcial(),
                    cmd.finTipoRecebimentoEdi(),
                    cmd.compraFinDocOrigem(),
                    cmd.compraContaCaixa(),
                    Audit.novo(cmd.usu(), now)
            );
        }

        var saved = repo.save(novo);
        return new UpsertParametrosResult(saved.id().value());
    }
}
