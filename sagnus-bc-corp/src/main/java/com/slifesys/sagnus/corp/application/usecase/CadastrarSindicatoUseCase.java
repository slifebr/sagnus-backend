package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.command.CadastrarSindicatoCommand;
import com.slifesys.sagnus.corp.application.dto.SindicatoResult;
import com.slifesys.sagnus.corp.application.port.SindicatoRepository;
import com.slifesys.sagnus.corp.domain.model.sindicato.Sindicato;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CadastrarSindicatoUseCase {

    private final SindicatoRepository sindicatoRepository;

    @Transactional
    public SindicatoResult execute(CadastrarSindicatoCommand command) {
        Sindicato novo = new Sindicato(
                command.getNome(),
                command.getCodigoBanco(),
                command.getCodigoAgencia(),
                command.getContaBanco(),
                command.getCodigoCedente(),
                command.getLogradouro(),
                command.getNumero(),
                command.getBairro(),
                command.getMunicipioIbge(),
                command.getUf(),
                command.getFone1(),
                command.getFone2(),
                command.getEmail(),
                command.getTipoSindicato(),
                command.getDataBase(),
                command.getPisoSalarial(),
                command.getCnpj(),
                command.getClassificacaoContabilConta(),
                command.getUsuCriacao());
        Sindicato salvo = sindicatoRepository.save(novo);
        return SindicatoResult.from(salvo);
    }
}
