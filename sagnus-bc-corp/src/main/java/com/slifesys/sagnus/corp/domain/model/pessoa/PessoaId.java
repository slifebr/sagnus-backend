package com.slifesys.sagnus.corp.domain.model.pessoa;

import lombok.Value;

@Value(staticConstructor = "of")
public class PessoaId {
    Long value;
}
