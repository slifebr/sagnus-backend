package com.slifesys.sagnus.adm.api.parametro;

import com.slifesys.sagnus.adm.application.command.UpsertParametrosCommand;

import com.slifesys.sagnus.adm.domain.model.parametro.ParametroConfig;
import org.springframework.stereotype.Component;

@Component
public class ParametroApiMapper {

    public UpsertParametrosCommand toCommand(UpsertParametrosRequest request) {
        return new UpsertParametrosCommand(
                request.finParcelaAberto(),
                request.finParcelaQuitado(),
                request.finParcelaQuitadoParcial(),
                request.finTipoRecebimentoEdi(),
                request.compraFinDocOrigem(),
                request.compraContaCaixa(),
                request.usu()
        );
    }

    public ParametroResponse toResponse(ParametroConfig parametros) {
        return new ParametroResponse(
                parametros.getId(),
                parametros.getFinParcelaAberto(),
                parametros.getFinParcelaQuitado(),
                parametros.getFinParcelaQuitadoParcial(),
                parametros.getFinTipoRecebimentoEdi(),
                parametros.getCompraFinDocOrigem(),
                parametros.getCompraContaCaixa()
        );
    }
}
