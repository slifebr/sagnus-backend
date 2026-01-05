package com.slifesys.sagnus.nfe.domain.service;

import com.slifesys.sagnus.nfe.domain.exception.NfeDomainException;

import java.math.BigDecimal;
import java.math.RoundingMode;

/**
 * Domain Service para centralizar toda lógica de cálculo de IVA Dual (IBS/CBS).
 * 
 * Regra de negócio: Toda lógica fiscal de IVA Dual deve ser centralizada aqui.
 * 
 * Responsabilidades:
 * - Calcular valor do imposto a partir de base e alíquota
 * - Calcular base a partir de valor e alíquota
 * - Calcular alíquota a partir de base e valor
 * - Normalizar escalas (base: 2 decimais, alíquota: 4 decimais, valor: 2 decimais)
 * 
 * Todas as operações usam RoundingMode.HALF_UP conforme padrão do projeto.
 */
public class CalculadoraIvaService {

    private static final int SCALE_BASE = 2;
    private static final int SCALE_ALIQUOTA = 4;
    private static final int SCALE_VALOR = 2;

    /**
     * Calcula o valor do imposto a partir da base e alíquota.
     * Fórmula: valor = base * alíquota / 100
     * 
     * @param base Base de cálculo do imposto
     * @param aliquota Alíquota do imposto (em percentual, ex: 1.5 para 1,5%)
     * @return Valor do imposto calculado (escala: 2 decimais)
     * @throws NfeDomainException se base ou alíquota forem nulos ou negativos
     */
    public BigDecimal calcularValor(BigDecimal base, BigDecimal aliquota) {
        validarParametrosNaoNulos("calcularValor", base, aliquota);
        validarNaoNegativo("base", base);
        validarNaoNegativo("aliquota", aliquota);
        
        return base.multiply(aliquota)
                .divide(new BigDecimal("100"), SCALE_VALOR, RoundingMode.HALF_UP);
    }

    /**
     * Calcula a base de cálculo a partir do valor e alíquota.
     * Fórmula: base = valor * 100 / alíquota
     * 
     * @param valor Valor do imposto
     * @param aliquota Alíquota do imposto (em percentual)
     * @return Base de cálculo (escala: 2 decimais)
     * @throws NfeDomainException se valor ou alíquota forem nulos, negativos, ou se alíquota for zero com valor > 0
     */
    public BigDecimal calcularBase(BigDecimal valor, BigDecimal aliquota) {
        validarParametrosNaoNulos("calcularBase", valor, aliquota);
        validarNaoNegativo("valor", valor);
        validarNaoNegativo("aliquota", aliquota);
        
        if (aliquota.signum() == 0) {
            if (valor.signum() != 0) {
                throw new NfeDomainException("Alíquota zero com valor > 0 é inconsistente");
            }
            return BigDecimal.ZERO.setScale(SCALE_BASE, RoundingMode.HALF_UP);
        }
        
        return valor.multiply(new BigDecimal("100"))
                .divide(aliquota, SCALE_BASE, RoundingMode.HALF_UP);
    }

    /**
     * Calcula a alíquota a partir da base e valor.
     * Fórmula: alíquota = valor * 100 / base
     * 
     * @param valor Valor do imposto
     * @param base Base de cálculo do imposto
     * @return Alíquota calculada (escala: 4 decimais)
     * @throws NfeDomainException se valor ou base forem nulos, negativos, ou se base for zero com valor > 0
     */
    public BigDecimal calcularAliquota(BigDecimal valor, BigDecimal base) {
        validarParametrosNaoNulos("calcularAliquota", valor, base);
        validarNaoNegativo("valor", valor);
        validarNaoNegativo("base", base);
        
        if (base.signum() == 0) {
            if (valor.signum() != 0) {
                throw new NfeDomainException("Base zero com valor > 0 é inconsistente");
            }
            return BigDecimal.ZERO.setScale(SCALE_ALIQUOTA, RoundingMode.HALF_UP);
        }
        
        return valor.multiply(new BigDecimal("100"))
                .divide(base, SCALE_ALIQUOTA, RoundingMode.HALF_UP);
    }

    /**
     * Normaliza a escala de um valor de base (2 decimais).
     * 
     * @param base Valor a normalizar
     * @return Base normalizada com 2 decimais
     */
    public BigDecimal normalizarBase(BigDecimal base) {
        if (base == null) {
            return BigDecimal.ZERO.setScale(SCALE_BASE, RoundingMode.HALF_UP);
        }
        return base.setScale(SCALE_BASE, RoundingMode.HALF_UP);
    }

    /**
     * Normaliza a escala de uma alíquota (4 decimais).
     * 
     * @param aliquota Valor a normalizar
     * @return Alíquota normalizada com 4 decimais
     */
    public BigDecimal normalizarAliquota(BigDecimal aliquota) {
        if (aliquota == null) {
            return BigDecimal.ZERO.setScale(SCALE_ALIQUOTA, RoundingMode.HALF_UP);
        }
        return aliquota.setScale(SCALE_ALIQUOTA, RoundingMode.HALF_UP);
    }

    /**
     * Normaliza a escala de um valor de imposto (2 decimais).
     * 
     * @param valor Valor a normalizar
     * @return Valor normalizado com 2 decimais
     */
    public BigDecimal normalizarValor(BigDecimal valor) {
        if (valor == null) {
            return BigDecimal.ZERO.setScale(SCALE_VALOR, RoundingMode.HALF_UP);
        }
        return valor.setScale(SCALE_VALOR, RoundingMode.HALF_UP);
    }

    /**
     * Normaliza todas as escalas de uma tripla (base, alíquota, valor).
     * 
     * @param base Base a normalizar
     * @param aliquota Alíquota a normalizar
     * @param valor Valor a normalizar
     * @return Tripla normalizada
     */
    public TriplaNormalizada normalizarTripla(BigDecimal base, BigDecimal aliquota, BigDecimal valor) {
        return new TriplaNormalizada(
                normalizarBase(base),
                normalizarAliquota(aliquota),
                normalizarValor(valor)
        );
    }

    /**
     * Record que representa uma tripla normalizada (base, alíquota, valor).
     */
    public record TriplaNormalizada(
            BigDecimal base,
            BigDecimal aliquota,
            BigDecimal valor
    ) {
        public TriplaNormalizada {
            // Validação de invariantes
            if (base == null || aliquota == null || valor == null) {
                throw new IllegalArgumentException("Tripla normalizada não pode ter valores nulos");
            }
        }
    }

    // Métodos auxiliares de validação

    private void validarParametrosNaoNulos(String metodo, BigDecimal... valores) {
        for (int i = 0; i < valores.length; i++) {
            if (valores[i] == null) {
                throw new NfeDomainException(
                        String.format("%s: parâmetro %d não pode ser nulo", metodo, i + 1)
                );
            }
        }
    }

    private void validarNaoNegativo(String nome, BigDecimal valor) {
        if (valor.signum() < 0) {
            throw new NfeDomainException(String.format("%s não pode ser negativo", nome));
        }
    }
}

