package com.slifesys.sagnus.corp.domain.model.pessoa;

import com.slifesys.sagnus.shared.error.BusinessException;
import lombok.Value;

@Value
public class Documento {

    String value;      // somente dígitos
    TipoPessoa tipo;   // FISICA ou JURIDICA

    public static Documento of(String raw, TipoPessoa tipo) {
        if (tipo == null) {
            throw new BusinessException("CORP-000", "Tipo de pessoa é obrigatório.");
        }

        String digits = onlyDigits(raw);
        if (digits == null || digits.isBlank()) {
            throw new BusinessException("CORP-001", "Documento é obrigatório.");
        }

        if (tipo == TipoPessoa.FISICA) {
            if (!isValidCpf(digits)) {
                throw new BusinessException("CORP-002", "CPF inválido.");
            }
            return new Documento(digits, tipo);
        }

        if (!isValidCnpj(digits)) {
            throw new BusinessException("CORP-003", "CNPJ inválido.");
        }
        return new Documento(digits, tipo);
    }

    private static String onlyDigits(String raw) {
        if (raw == null) return null;
        return raw.replaceAll("\\D", "");
    }

    // ===== CPF =====
    public static boolean isValidCpf(String cpfDigits) {
        if (cpfDigits == null) return false;

        String cpf = cpfDigits.replaceAll("\\D", "");
        if (cpf.length() != 11) return false;
        if (allEqual(cpf)) return false;

        int d1 = calcCpfDigit(cpf, 9);
        int d2 = calcCpfDigit(cpf, 10);

        return cpf.charAt(9) == (char) ('0' + d1)
            && cpf.charAt(10) == (char) ('0' + d2);
    }

    private static int calcCpfDigit(String cpf, int length) {
        int sum = 0;
        int weight = length + 1; // 10 ou 11
        for (int i = 0; i < length; i++) {
            int num = cpf.charAt(i) - '0';
            sum += num * (weight - i);
        }
        int mod = sum % 11;
        return (mod < 2) ? 0 : 11 - mod;
    }

    // ===== CNPJ =====
    public static boolean isValidCnpj(String cnpjDigits) {
        if (cnpjDigits == null) return false;

        String cnpj = cnpjDigits.replaceAll("\\D", "");
        if (cnpj.length() != 14) return false;
        if (allEqual(cnpj)) return false;

        int d1 = calcCnpjDigit(cnpj, 12);
        int d2 = calcCnpjDigit(cnpj, 13);

        return cnpj.charAt(12) == (char) ('0' + d1)
            && cnpj.charAt(13) == (char) ('0' + d2);
    }

    private static int calcCnpjDigit(String cnpj, int length) {
        int[] w = (length == 12)
                ? new int[]{5,4,3,2,9,8,7,6,5,4,3,2}
                : new int[]{6,5,4,3,2,9,8,7,6,5,4,3,2};

        int sum = 0;
        for (int i = 0; i < length; i++) {
            int num = cnpj.charAt(i) - '0';
            sum += num * w[i];
        }
        int mod = sum % 11;
        return (mod < 2) ? 0 : 11 - mod;
    }

    private static boolean allEqual(String digits) {
        char first = digits.charAt(0);
        for (int i = 1; i < digits.length(); i++) {
            if (digits.charAt(i) != first) return false;
        }
        return true;
    }
}
