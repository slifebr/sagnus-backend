package com.slifesys.sagnus.corp.contract.marca;

import lombok.Builder;
import lombok.Value;
import lombok.extern.jackson.Jacksonized;

@Value
@Builder(toBuilder = true)
@Jacksonized
public class MarcaUpdateRequest {
    String nome;
    String descricao;
    String usuAlteracao;
}
