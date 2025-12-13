package com.slifesys.sagnus.domain.seguranca;

import jakarta.persistence.*;

@Entity
@Table(name = "USUARIO_SISTEMA", schema = "FENIX")
// se não tiver schema, remova `schema = "FENIX"`
public class UsuarioSistema {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Integer id;

    @Column(name = "LOGIN", nullable = false, unique = true, length = 50)
    private String login;

    @Column(name = "SENHA", nullable = false, length = 200)
    private String senha;

    @Column(name = "ADMINISTRADOR", length = 1)
    private String administrador; // 'S' ou 'N'

    @Column(name = "TOKEN_VERSION")
    private Integer tokenVersion;

    // opcional: se existir na tabela
    // @Column(name = "EH_ATIVO", length = 1)
    // private String ehAtivo;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getAdministrador() {
        return administrador;
    }

    public void setAdministrador(String administrador) {
        this.administrador = administrador;
    }

    public Integer getTokenVersion() {
        return tokenVersion;
    }

    public void setTokenVersion(Integer tokenVersion) {
        this.tokenVersion = tokenVersion;
    }
}
