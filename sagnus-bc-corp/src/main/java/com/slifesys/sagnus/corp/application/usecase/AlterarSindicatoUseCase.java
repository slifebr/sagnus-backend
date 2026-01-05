package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.AlterarSindicatoCommand;
import com.slifesys.sagnus.corp.application.dto.SindicatoResult;
import com.slifesys.sagnus.corp.application.port.SindicatoRepository;
import com.slifesys.sagnus.corp.domain.model.sindicato.Sindicato;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AlterarSindicatoUseCase {

    private final SindicatoRepository sindicatoRepository;

    @Transactional
    public SindicatoResult execute(AlterarSindicatoCommand command) {
        Sindicato sindicato = sindicatoRepository.findById(command.getId())
                .orElseThrow(
                        () -> new NotFoundException("CORP-404", "Sindicato nao encontrado com id: " + command.getId()));

        Sindicato atualizado = new Sindicato(
                sindicato.getId(),
                command.getNome() != null ? command.getNome() : sindicato.getNome(),
                command.getCodigoBanco() != null ? command.getCodigoBanco() : sindicato.getCodigoBanco(),
                command.getCodigoAgencia() != null ? command.getCodigoAgencia() : sindicato.getCodigoAgencia(),
                command.getContaBanco() != null ? command.getContaBanco() : sindicato.getContaBanco(),
                command.getCodigoCedente() != null ? command.getCodigoCedente() : sindicato.getCodigoCedente(),
                command.getLogradouro() != null ? command.getLogradouro() : sindicato.getLogradouro(),
                command.getNumero() != null ? command.getNumero() : sindicato.getNumero(),
                command.getBairro() != null ? command.getBairro() : sindicato.getBairro(),
                command.getMunicipioIbge() != null ? command.getMunicipioIbge() : sindicato.getMunicipioIbge(),
                command.getUf() != null ? command.getUf() : sindicato.getUf(),
                command.getFone1() != null ? command.getFone1() : sindicato.getFone1(),
                command.getFone2() != null ? command.getFone2() : sindicato.getFone2(),
                command.getEmail() != null ? command.getEmail() : sindicato.getEmail(),
                command.getTipoSindicato() != null ? command.getTipoSindicato() : sindicato.getTipoSindicato(),
                command.getDataBase() != null ? command.getDataBase() : sindicato.getDataBase(),
                command.getPisoSalarial() != null ? command.getPisoSalarial() : sindicato.getPisoSalarial(),
                command.getCnpj() != null ? command.getCnpj() : sindicato.getCnpj(),
                command.getClassificacaoContabilConta() != null ? command.getClassificacaoContabilConta()
                        : sindicato.getClassificacaoContabilConta(),
                sindicato.getCriadoEm(),
                sindicato.getUsuCriacao(),
                java.time.Instant.now(),
                command.getUsuAlteracao());

        Sindicato salvo = sindicatoRepository.save(atualizado);
        return SindicatoResult.from(salvo);
    }
}
