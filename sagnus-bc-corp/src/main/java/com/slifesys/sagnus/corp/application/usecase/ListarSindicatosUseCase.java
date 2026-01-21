package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.contract.sindicato.SindicatoDTO;
import com.slifesys.sagnus.corp.application.port.SindicatoRepository;
import com.slifesys.sagnus.corp.domain.model.sindicato.Sindicato;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * Listagem paginada (read-only) de Sindicatos para telas/BFF.
 */
@Service
@RequiredArgsConstructor
public class ListarSindicatosUseCase {

    private final SindicatoRepository sindicatoRepository;

    public PageResult<SindicatoDTO> execute(PageRequest pageRequest) {
        PageResult<Sindicato> page = sindicatoRepository.list(pageRequest);
        return PageResult.<SindicatoDTO>builder()
                .items(page.getItems().stream().map(this::toDTO).toList())
                .totalElements(page.getTotalElements())
                .totalPages(page.getTotalPages())
                .page(page.getPage())
                .size(page.getSize())
                .build();
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
