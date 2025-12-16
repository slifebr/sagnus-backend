package com.slifesys.sagnus.nfe.domain.model.fiscal;

public final class ProdutoFiscal {

    private final Long produtoId;        // referência externa (estoque/produto)
    private final String descricao;
    private final String ncm;            // 8 dígitos
    private final String cfop;           // 4 dígitos
    private final String uCom;           // unidade comercial

    public ProdutoFiscal(Long produtoId, String descricao, String ncm, String cfop, String uCom) {
        if (produtoId == null) throw new IllegalArgumentException("produtoId é obrigatório");
        if (descricao == null || descricao.isBlank()) throw new IllegalArgumentException("descrição é obrigatória");
        if (ncm == null || !ncm.matches("\\d{8}")) throw new IllegalArgumentException("NCM inválido (8 dígitos)");
        if (cfop == null || !cfop.matches("\\d{4}")) throw new IllegalArgumentException("CFOP inválido (4 dígitos)");
        if (uCom == null || uCom.isBlank()) throw new IllegalArgumentException("Unidade (uCom) é obrigatória");

        this.produtoId = produtoId;
        this.descricao = descricao.trim();
        this.ncm = ncm;
        this.cfop = cfop;
        this.uCom = uCom.trim().toUpperCase();
    }

    public Long getProdutoId(){ return produtoId; }
    public String getDescricao(){ return descricao; }
    public String getNcm(){ return ncm; }
    public String getCfop(){ return cfop; }
    public String getUCom(){ return uCom; }
}
