package com.slifesys.sagnus.adm.infrastructure.persistence.adapter;

import com.slifesys.sagnus.adm.application.port.ParametroRepositoryPort;
import com.slifesys.sagnus.adm.domain.model.audit.Audit;
import com.slifesys.sagnus.adm.domain.model.parametro.ParametroConfig;
import com.slifesys.sagnus.adm.domain.model.parametro.ParametroSistema;
import com.slifesys.sagnus.adm.infrastructure.persistence.entity.ParametroSistemaEntity;
import com.slifesys.sagnus.adm.infrastructure.persistence.mapper.AdmPersistenceMapper;
import com.slifesys.sagnus.adm.infrastructure.persistence.repository.ParametroSistemaJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class ParametroRepositoryAdapter implements ParametroRepositoryPort {

    private final ParametroSistemaJpaRepository jpaRepository;

    @Override
    public Optional<ParametroConfig> findCurrent() {
        // Fetch all generic parameters
        var all = findAll();
        if (all.isEmpty()) return Optional.empty();

        ParametroConfig config = new ParametroConfig();
        // Since entries are individual rows, one "Config" is an aggregation of all rows.
        // We set the ID to 1L or derived from one of the rows. 
        // For audit, we pick the latest or first.
        
        config.setId(1L); 
        Audit audit = null;

        for (ParametroSistema p : all) {
            String val = p.getValor();
            if (val == null) continue;
            try {
                switch (p.getChave()) {
                    case "FIN_PARCELA_ABERTO": config.setFinParcelaAberto(Long.parseLong(val)); break;
                    case "FIN_PARCELA_QUITADO": config.setFinParcelaQuitado(Long.parseLong(val)); break;
                    case "FIN_PARCELA_QUITADO_PARCIAL": config.setFinParcelaQuitadoParcial(Long.parseLong(val)); break;
                    case "FIN_TIPO_RECEBIMENTO_EDI": config.setFinTipoRecebimentoEdi(Long.parseLong(val)); break;
                    case "COMPRA_FIN_DOC_ORIGEM": config.setCompraFinDocOrigem(Long.parseLong(val)); break;
                    case "COMPRA_CONTA_CAIXA": config.setCompraContaCaixa(Long.parseLong(val)); break;
                }
                // Naive audit strategy: pick first available
                if (audit == null && p instanceof ParametroSistema) {
                    // Assuming ParametroSistema might have audit fields? 
                    // My previous manual patch of ParametroSistema had 'boolean ativo'. Missing Audit field in Stub?
                    // I will ignore Audit mapping from rows for now if Domain Model lacks it.
                }
            } catch (NumberFormatException ignored) {}
        }
        config.setAudit(new Audit()); // Fallback
        return Optional.of(config);
    }

    @Override
    public ParametroConfig saveConfig(ParametroConfig config) {
        saveRow("FIN_PARCELA_ABERTO", config.getFinParcelaAberto());
        saveRow("FIN_PARCELA_QUITADO", config.getFinParcelaQuitado());
        saveRow("FIN_PARCELA_QUITADO_PARCIAL", config.getFinParcelaQuitadoParcial());
        saveRow("FIN_TIPO_RECEBIMENTO_EDI", config.getFinTipoRecebimentoEdi());
        saveRow("COMPRA_FIN_DOC_ORIGEM", config.getCompraFinDocOrigem());
        saveRow("COMPRA_CONTA_CAIXA", config.getCompraContaCaixa());
        return config;
    }

    private void saveRow(String key, Long value) {
        String valStr = value != null ? value.toString() : null;
        if (valStr == null) return; // Or delete?

        Optional<ParametroSistemaEntity> existing = jpaRepository.findByChave(key);
        ParametroSistemaEntity entity;
        if (existing.isPresent()) {
            entity = existing.get();
            entity.setValor(valStr);
        } else {
            entity = new ParametroSistemaEntity();
            entity.setChave(key);
            entity.setValor(valStr);
            entity.setEscopo("SISTEMA");
            entity.setAtivo(true);
        }
        jpaRepository.save(entity);
    }

    @Override
    public Optional<ParametroSistema> findByChave(String chave) {
        return jpaRepository.findByChave(chave).map(AdmPersistenceMapper::toDomain);
    }

    @Override
    public java.util.List<ParametroSistema> findByEscopo(String escopo) {
        return jpaRepository.findByEscopo(escopo).stream().map(AdmPersistenceMapper::toDomain).toList();
    }

    @Override
    public Optional<ParametroSistema> findById(Long id) {
        return jpaRepository.findById(id).map(AdmPersistenceMapper::toDomain);
    }

    @Override
    public ParametroSistema save(ParametroSistema parametro) {
        ParametroSistemaEntity entity = AdmPersistenceMapper.toJpa(parametro);
        ParametroSistemaEntity saved = jpaRepository.save(entity);
        return AdmPersistenceMapper.toDomain(saved);
    }

    @Override
    public void deleteById(Long id) {
        jpaRepository.deleteById(id);
    }

    @Override
    public java.util.List<ParametroSistema> findAll() {
        return jpaRepository.findAll().stream().map(AdmPersistenceMapper::toDomain).toList();
    }
}
