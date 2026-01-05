package com.slifesys.sagnus.nfe.domain.model.nfe;

import java.util.Objects;

public final class DocumentoFiscal {

    private final String valor; // somente dígitos

    private DocumentoFiscal(String valor) {
        this.valor = valor;
    }

    public static DocumentoFiscal of(String valor) {
        if (valor == null || valor.isBlank()) {
            throw new IllegalArgumentException("Documento fiscal é obrigatório");
        }

        String digitos = valor.replaceAll("\\D", "");

        if (digitos.length() == 11) {
            validarCPF(digitos);
        } else if (digitos.length() == 14) {
            validarCNPJ(digitos);
        } else {
            throw new IllegalArgumentException("Documento fiscal inválido");
        }

        return new DocumentoFiscal(digitos);
    }

    public boolean isCPF() {
        return valor.length() == 11;
    }

    public boolean isCNPJ() {
        return valor.length() == 14;
    }

    public String getValor() {
        return valor;
    }

    private static void validarCPF(String cpf) {
        // algoritmo real (resumido aqui)
        if (cpf.chars().distinct().count() == 1) {
            throw new IllegalArgumentException("CPF inválido");
        }
    }

    private static void validarCNPJ(String cnpj) {
        if (cnpj.chars().distinct().count() == 1) {
            throw new IllegalArgumentException("CNPJ inválido");
        }
    }

    @Override
    public boolean equals(Object o) {
        return (o instanceof DocumentoFiscal d) && valor.equals(d.valor);
    }

    @Override
    public int hashCode() {
        return Objects.hash(valor);
    }
}
