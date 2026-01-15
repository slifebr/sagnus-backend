package com.slifesys.sagnus.adm.infrastructure.persistence.mapper;

import com.slifesys.sagnus.adm.domain.model.empresa.Empresa;
import com.slifesys.sagnus.adm.domain.model.parametro.ParametroSistema;
import com.slifesys.sagnus.adm.domain.model.usuario.Usuario;
import com.slifesys.sagnus.adm.domain.model.usuario.Perfil;
import com.slifesys.sagnus.adm.domain.model.usuario.Permissao;
import com.slifesys.sagnus.adm.infrastructure.persistence.entity.EmpresaEntity;
import com.slifesys.sagnus.adm.infrastructure.persistence.entity.ParametroSistemaEntity;
import com.slifesys.sagnus.adm.infrastructure.persistence.entity.UsuarioEntity;
import com.slifesys.sagnus.adm.infrastructure.persistence.entity.PerfilEntity;
import com.slifesys.sagnus.adm.infrastructure.persistence.entity.PermissaoEntity;

import java.util.stream.Collectors;
import java.util.Set;
import java.util.HashSet;

public class AdmPersistenceMapper {

    private AdmPersistenceMapper() {
    }

    public static EmpresaEntity toJpa(Empresa d) {
        if (d == null)
            return null;
        EmpresaEntity e = new EmpresaEntity();
        e.setId(d.getId());
        e.setNome(d.getNome());
        e.setNif(d.getNif());
        e.setAtivo(d.isAtivo());
        return e;
    }

    public static Empresa toDomain(EmpresaEntity e) {
        if (e == null)
            return null;
        return Empresa.builder()
                .id(e.getId())
                .nome(e.getNome())
                .nif(e.getNif())
                .ativo(e.getAtivo())
                .build();
    }

    public static UsuarioEntity toJpa(Usuario d) {
        if (d == null)
            return null;
        UsuarioEntity e = new UsuarioEntity();
        e.setId(d.getId());
        e.setUsername(d.getUsername());
        e.setNome(d.getNome());
        e.setEmail(d.getEmail());
        e.setAtivo(d.isAtivo());
        if (d.getPerfis() != null) {
            e.setPerfis(d.getPerfis().stream().map(AdmPersistenceMapper::toJpa).collect(Collectors.toSet()));
        }
        return e;
    }

    public static Usuario toDomain(UsuarioEntity e) {
        if (e == null)
            return null;
        Set<Perfil> perfis = e.getPerfis() == null ? new HashSet<>()
                : e.getPerfis().stream().map(AdmPersistenceMapper::toDomain).collect(Collectors.toSet());
        return Usuario.builder()
                .id(e.getId())
                .username(e.getUsername())
                .nome(e.getNome())
                .email(e.getEmail())
                .ativo(e.getAtivo())
                .perfis(perfis)
                .build();
    }

    public static PerfilEntity toJpa(Perfil d) {
        if (d == null)
            return null;
        PerfilEntity e = new PerfilEntity();
        e.setId(d.getId());
        e.setNome(d.getNome());
        e.setAtivo(d.isAtivo());
        // Simple mapping, deep graph might need careful handling to avoid recursion or
        // duplication
        return e;
    }

    public static Perfil toDomain(PerfilEntity e) {
        if (e == null)
            return null;
        Set<Permissao> perms = e.getPermissoes() == null ? new HashSet<>()
                : e.getPermissoes().stream().map(AdmPersistenceMapper::toDomain).collect(Collectors.toSet());
        return Perfil.builder()
                .id(e.getId())
                .nome(e.getNome())
                .ativo(e.getAtivo())
                .permissoes(perms)
                .build();
    }

    public static Permissao toDomain(PermissaoEntity e) {
        if (e == null)
            return null;
        return Permissao.builder()
                .id(e.getId())
                .codigo(e.getCodigo())
                .descricao(e.getDescricao())
                .build();
    }

    public static ParametroSistemaEntity toJpa(ParametroSistema d) {
        if (d == null)
            return null;
        ParametroSistemaEntity e = new ParametroSistemaEntity();
        e.setId(d.getId());
        e.setChave(d.getChave());
        e.setValor(d.getValor());
        e.setEscopo(d.getEscopo());
        e.setAtivo(d.isAtivo());
        return e;
    }

    public static ParametroSistema toDomain(ParametroSistemaEntity e) {
        if (e == null)
            return null;
        return ParametroSistema.builder()
                .id(e.getId())
                .chave(e.getChave())
                .valor(e.getValor())
                .escopo(e.getEscopo())
                .ativo(e.getAtivo())
                .build();
    }

    public static com.slifesys.sagnus.adm.infrastructure.persistence.entity.FilialEntity toJpa(
            com.slifesys.sagnus.adm.domain.model.empresa.Filial d,
            com.slifesys.sagnus.adm.infrastructure.persistence.entity.EmpresaEntity empresaEntity) {
        if (d == null)
            return null;
        com.slifesys.sagnus.adm.infrastructure.persistence.entity.FilialEntity e = new com.slifesys.sagnus.adm.infrastructure.persistence.entity.FilialEntity();
        e.setId(d.getId());
        e.setNome(d.getNome());
        e.setCodigo(d.getCodigo());
        e.setAtivo(d.isAtivo());
        e.setEmpresa(empresaEntity);
        return e;
    }

    public static com.slifesys.sagnus.adm.domain.model.empresa.Filial toDomain(
            com.slifesys.sagnus.adm.infrastructure.persistence.entity.FilialEntity e) {
        if (e == null)
            return null;
        return com.slifesys.sagnus.adm.domain.model.empresa.Filial.builder()
                .id(e.getId())
                .empresaId(e.getEmpresa() != null ? e.getEmpresa().getId() : null)
                .nome(e.getNome())
                .codigo(e.getCodigo())
                .ativo(e.getAtivo())
                .build();
    }
}
