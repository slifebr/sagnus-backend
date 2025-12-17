package com.slifesys.sagnus.nfe.api.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EmitirNfeResponse {
    private String nfeId;
    private String status;
    private String mensagem;
}
