package com.slifesys.sagnus.nfe.api.dto;

import jakarta.validation.Valid;
import jakarta.validation.constraints.*;
import lombok.*;

import java.math.BigDecimal;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EmitirNfeRequest {

    @NotNull(message = "emitentePessoaId é obrigatório")
    private Long emitentePessoaId;

    @NotNull(message = "destinatarioPessoaId é obrigatório")
    private Long destinatarioPessoaId;

    @NotEmpty(message = "A NFe deve conter ao menos 1 item")
    @Valid
    private List<Item> itens;

    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class Item {

        @Min(value = 1, message = "nItem deve ser >= 1")
        @Max(value = 990, message = "nItem deve ser <= 990")
        private int nItem;

        @NotNull(message = "produtoId é obrigatório")
        private Long produtoId;

        @NotBlank(message = "descricao é obrigatória")
        private String descricao;

        @NotBlank(message = "ncm é obrigatório")
        @Pattern(regexp = "\\d{8}", message = "ncm inválido (8 dígitos)")
        private String ncm;

        @NotBlank(message = "cfop é obrigatório")
        @Pattern(regexp = "\\d{4}", message = "cfop inválido (4 dígitos)")
        private String cfop;

        @NotBlank(message = "uCom é obrigatório")
        private String uCom;

        @NotNull(message = "quantidade é obrigatória")
        @DecimalMin(value = "0.0001", inclusive = true, message = "quantidade deve ser > 0")
        private BigDecimal quantidade;

        @NotNull(message = "valorUnitario é obrigatório")
        @DecimalMin(value = "0.01", inclusive = true, message = "valorUnitario deve ser > 0")
        private BigDecimal valorUnitario;

        // opcionais
        @DecimalMin(value = "0.00", inclusive = true, message = "desconto não pode ser negativo")
        private BigDecimal desconto;

        @DecimalMin(value = "0.00", inclusive = true, message = "frete não pode ser negativo")
        private BigDecimal frete;

        @DecimalMin(value = "0.00", inclusive = true, message = "seguro não pode ser negativo")
        private BigDecimal seguro;

        @DecimalMin(value = "0.00", inclusive = true, message = "outras não pode ser negativo")
        private BigDecimal outras;

        // ===== RTC (IBS/CBS) - MVP =====
        // Obs: validações cruzadas (ex.: base/aliquota/valor juntos) são feitas no UseCase.

        @Pattern(regexp = "^$|\\d{3}", message = "cstIbsCbs inválido (3 dígitos)")
        private String cstIbsCbs;

        @Pattern(regexp = "^$|\\d{6}", message = "cClassTrib inválido (6 dígitos)")
        private String cClassTrib;

        @DecimalMin(value = "0.00", inclusive = true, message = "ibsBase não pode ser negativa")
        private BigDecimal ibsBase;

        @DecimalMin(value = "0.0000", inclusive = true, message = "ibsAliquota não pode ser negativa")
        private BigDecimal ibsAliquota;

        @DecimalMin(value = "0.00", inclusive = true, message = "ibsValor não pode ser negativo")
        private BigDecimal ibsValor;

        @DecimalMin(value = "0.00", inclusive = true, message = "cbsBase não pode ser negativa")
        private BigDecimal cbsBase;

        @DecimalMin(value = "0.0000", inclusive = true, message = "cbsAliquota não pode ser negativa")
        private BigDecimal cbsAliquota;

        @DecimalMin(value = "0.00", inclusive = true, message = "cbsValor não pode ser negativo")
        private BigDecimal cbsValor;

        // Ex.: REGULAR, ISENCAO, DIFERIMENTO...
        private String regimeIbsCbs;
    }
}
