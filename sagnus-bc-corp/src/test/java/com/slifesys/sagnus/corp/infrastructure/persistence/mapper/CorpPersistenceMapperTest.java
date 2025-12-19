package com.slifesys.sagnus.corp.infrastructure.persistence.mapper;

import com.slifesys.sagnus.corp.domain.model.tabelapreco.TabelaPreco;
import com.slifesys.sagnus.corp.domain.model.transportadora.Transportadora;
import com.slifesys.sagnus.corp.domain.model.uf.UF;
import com.slifesys.sagnus.corp.infrastructure.persistence.entity.TabelaPrecoEntity;
import com.slifesys.sagnus.corp.infrastructure.persistence.entity.TransportadoraEntity;
import com.slifesys.sagnus.corp.infrastructure.persistence.entity.UFEntity;
import org.junit.jupiter.api.Test;

import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

class CorpPersistenceMapperTest {

    @Test
    void shouldMapTabelaPreco() {
        LocalDate now = LocalDate.now();
        TabelaPreco domain = new TabelaPreco(1L, "Tabela 1", now, now.plusDays(10), BigDecimal.TEN, Instant.now(),
                "user", Instant.now(), "user");

        TabelaPrecoEntity entity = CorpPersistenceMapper.toJpa(domain);

        assertEquals(domain.getDataInicio(), entity.getDataInicio());
        assertEquals(domain.getDataFim(), entity.getDataFim());

        TabelaPreco mappedBack = CorpPersistenceMapper.toDomain(entity);
        assertEquals(domain.getDataInicio(), mappedBack.getDataInicio());
        assertEquals(domain.getDataFim(), mappedBack.getDataFim());
    }

    @Test
    void shouldMapTransportadora() {
        Transportadora domain = new Transportadora(1L, 100L, "ABC-1234", "123456789", Instant.now(), "user",
                Instant.now(), "user");

        TransportadoraEntity entity = CorpPersistenceMapper.toJpa(domain);

        assertEquals(domain.getPlacaVeiculo(), entity.getPlacaVeiculo());
        assertEquals(domain.getRntc(), entity.getRntc());

        Transportadora mappedBack = CorpPersistenceMapper.toDomain(entity);
        assertEquals(domain.getPlacaVeiculo(), mappedBack.getPlacaVeiculo());
        assertEquals(domain.getRntc(), mappedBack.getRntc());
    }

    @Test
    void shouldMapUF() {
        UF domain = new UF(1L, "SP", "Sao Paulo", new BigDecimal("18.00"), new BigDecimal("12.00"), Instant.now(),
                "user", Instant.now(), "user");

        UFEntity entity = CorpPersistenceMapper.toJpa(domain);

        assertEquals(domain.getIcmsInterno(), entity.getIcmsInterno());
        assertEquals(domain.getIcmsInterestadual(), entity.getIcmsInterestadual());

        UF mappedBack = CorpPersistenceMapper.toDomain(entity);
        assertEquals(domain.getIcmsInterno(), mappedBack.getIcmsInterno());
        assertEquals(domain.getIcmsInterestadual(), mappedBack.getIcmsInterestadual());
    }
}
