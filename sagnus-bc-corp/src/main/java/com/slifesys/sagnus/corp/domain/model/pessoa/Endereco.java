package com.slifesys.sagnus.corp.domain.model.pessoa;

import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class Endereco {
    String logradouro;
    String numero;
    String complemento;
    String bairro;
    String cidade;
    String uf;
    String cep;
    String pais;
}
