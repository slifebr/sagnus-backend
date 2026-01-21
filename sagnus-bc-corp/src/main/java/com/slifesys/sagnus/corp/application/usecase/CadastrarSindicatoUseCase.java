package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.command.CadastrarSindicatoCommand;
import com.slifesys.sagnus.corp.contract.sindicato.SindicatoDTO;
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
    public SindicatoDTO execute(CadastrarSindicatoCommand command) {
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
        return toDTO(salvo);
    }

    private SindicatoDTO toDTO(Sindicato s) {
        return SindicatoDTO.builder()
                .id(s.getId())
                .nome(s.getNome())
                .codigoBanco(s.getCodigoBanco())
                .codigoAgencia(s.getCodigoAgencia())
                .contaBanco(s.getContaBanco())
                .codigoCedente(s.getCodigoCedente())
                .logradouro(s.getLogradouro())
                .numero(s.getNumero())
                .bairro(s.getBairro())
                .municipioIbge(s.getMunicipioIbge())
                .uf(s.getUf())
                .fone1(s.getFone1())
                .fone2(s.getFone2())
                .email(s.getEmail())
                .tipoSindicato(s.getTipoSindicato())
                .dataBase(s.getDataBase())
                .pisoSalarial(s.getPisoSalarial())
                .cnpj(s.getCnpj())
                .classificacaoContabilConta(s.getClassificacaoContabilConta())
                .criadoEm(s.getCriadoEm())
                .usuCriacao(s.getUsuCriacao())
                .atualizadoEm(s.getAtualizadoEm())
                .usuAlteracao(s.getUsuAlteracao())
                .build();
    }
}
