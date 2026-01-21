package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.contract.sindicato.SindicatoDTO;
import com.slifesys.sagnus.corp.domain.model.sindicato.Sindicato;
import com.slifesys.sagnus.corp.application.port.SindicatoRepository;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ObterSindicatoUseCase {

    private final SindicatoRepository sindicatoRepository;

    @Transactional(readOnly = true)
    public SindicatoDTO execute(Long id) {
        return sindicatoRepository.findById(id)
                .map(this::toDTO)
                .orElseThrow(() -> new NotFoundException("CORP-404", "Sindicato nao encontrado com id: " + id));
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
