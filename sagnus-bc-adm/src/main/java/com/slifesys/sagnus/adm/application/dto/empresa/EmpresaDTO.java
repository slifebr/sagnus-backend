package com.slifesys.sagnus.adm.application.dto.empresa;

import lombok.Data;

@Data
public class EmpresaDTO {
    private Long id;
    private String nome;
    private String cpfCnpj;
    private String inscricaoEstadual;
    private String inscricaoMunicipal;
    private Boolean ativo;
}
