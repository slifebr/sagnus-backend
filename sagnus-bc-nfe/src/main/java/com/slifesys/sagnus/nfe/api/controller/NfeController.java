package com.slifesys.sagnus.nfe.api.controller;

import com.slifesys.sagnus.nfe.application.command.EmitirNfeCommand;
import com.slifesys.sagnus.nfe.application.command.EmitirNfeItemCommand;
import com.slifesys.sagnus.nfe.application.result.EmitirNfeResult;
import com.slifesys.sagnus.nfe.application.usecase.EmitirNfeUseCase;
import com.slifesys.sagnus.nfe.api.dto.EmitirNfeRequest;
import com.slifesys.sagnus.nfe.api.dto.EmitirNfeResponse;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/nfe")
@RequiredArgsConstructor
public class NfeController {

    private final EmitirNfeUseCase emitirNfeUseCase;

    /**
     * Endpoint mínimo para rodar end-to-end.
     * - Cria NFe com itens
     * - Valida e muda estado: RASCUNHO -> VALIDADA -> EMITIDA
     * - Persiste via NfeRepository (InMemory por padrão, até entrar JPA)
     */
    @PostMapping("/emitir")
    public ResponseEntity<EmitirNfeResponse> emitir(@Valid @RequestBody EmitirNfeRequest req) {

        EmitirNfeCommand cmd = EmitirNfeCommand.builder()
                .emitentePessoaId(req.getEmitentePessoaId())
                .destinatarioPessoaId(req.getDestinatarioPessoaId())
                .itens(req.getItens().stream().map(this::toItemCmd).collect(Collectors.toList()))
                .build();

        EmitirNfeResult result = emitirNfeUseCase.execute(cmd);

        EmitirNfeResponse resp = EmitirNfeResponse.builder()
                .nfeId(result.getNfeId())
                .status(result.getStatus())
                .mensagem(result.getMensagem())
                .build();

        return ResponseEntity.created(URI.create("/nfe/" + resp.getNfeId())).body(resp);
    }

    private EmitirNfeItemCommand toItemCmd(EmitirNfeRequest.Item it) {
        return EmitirNfeItemCommand.builder()
                .nItem(it.getNItem())
                .produtoId(it.getProdutoId())
                .descricao(it.getDescricao())
                .ncm(it.getNcm())
                .cfop(it.getCfop())
                .uCom(it.getUCom())
                .quantidade(it.getQuantidade())
                .valorUnitario(it.getValorUnitario())
                .desconto(it.getDesconto())
                .frete(it.getFrete())
                .seguro(it.getSeguro())
                .outras(it.getOutras())
                .cstIbsCbs(it.getCstIbsCbs())
                .cClassTrib(it.getCClassTrib())
                .ibsBase(it.getIbsBase())
                .ibsAliquota(it.getIbsAliquota())
                .ibsValor(it.getIbsValor())
                .cbsBase(it.getCbsBase())
                .cbsAliquota(it.getCbsAliquota())
                .cbsValor(it.getCbsValor())
                .regimeIbsCbs(it.getRegimeIbsCbs())
                .build();
    }
}
