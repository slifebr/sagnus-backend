package com.slifesys.sagnus.corp.domain.model.produto;

import java.time.Instant;
import java.util.List;


import com.slifesys.sagnus.shared.error.BusinessException;
import com.slifesys.sagnus.corp.domain.model.produto.ProdutoId;
import com.slifesys.sagnus.corp.domain.model.produto.Nome;

import lombok.Getter;

@Getter
public class Produto {

    private ProdutoId id;
    private Nome nome;
    private boolean ativa;
    private Instant criadaEm;
    private Instant atualizadaEm;

   private Produto(ProdutoId id) {
        this.id = id;
    }
public static Produto criarNova(String nome) {
        if (nome == null) {
            throw new BusinessException("CORP-000", "Descrição do produto é obrigatório.");
        }

        Produto p = new Produto(null);
        p.nome = Nome.of(nome);
        p.ativa = true;
        p.criadaEm = Instant.now();
        p.atualizadaEm = p.criadaEm;
        return p;
    }

    public static Produto reconstruir(ProdutoId id,
                                    Nome nome,
                                    boolean ativa,
                                    Instant criadaEm,
                                    Instant atualizadaEm,
                                    List<Produto> produtos
                                   ) {
        if (id == null) throw new BusinessException("CORP-900", "Id obrigatório na reconstrução.");
        if (nome == null) throw new BusinessException("CORP-901", "Nome obrigatório na reconstrução.");

        Produto p = new Produto(id);
        p.nome = nome;
        p.ativa = ativa;
        p.criadaEm = criadaEm;
        p.atualizadaEm = atualizadaEm;
        return p;
    }

    public void alterarDados(String nome, String email, String site) {
        this.nome = Nome.of(nome);
        this.atualizadaEm = Instant.now();
    }
}
