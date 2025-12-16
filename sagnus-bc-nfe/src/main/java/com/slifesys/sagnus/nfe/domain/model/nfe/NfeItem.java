package com.slifesys.sagnus.nfe.domain.model.nfe;

import com.slifesys.sagnus.nfe.domain.model.fiscal.*;
import com.slifesys.sagnus.nfe.domain.model.imposto.TributosItem;

import java.math.BigDecimal;

public final class NfeItem {

    private final int nItem;                  // 1..990
    private final ProdutoFiscal produto;
    private final Quantidade quantidade;      // qCom
    private final Dinheiro valorUnitario;     // vUnCom
    private final Dinheiro valorBruto;        // vProd = q * vUn
    private final Dinheiro desconto;          // vDesc (opcional)
    private final Dinheiro frete;             // vFrete (opcional)
    private final Dinheiro seguro;            // vSeg (opcional)
    private final Dinheiro outras;            // vOutro (opcional)
    private final TributosItem tributos;

    public NfeItem(
            int nItem,
            ProdutoFiscal produto,
            Quantidade quantidade,
            Dinheiro valorUnitario,
            Dinheiro desconto,
            Dinheiro frete,
            Dinheiro seguro,
            Dinheiro outras,
            TributosItem tributos
    ) {
        if (nItem <= 0 || nItem > 990) throw new IllegalArgumentException("nItem inválido");
        if (produto == null) throw new IllegalArgumentException("produto é obrigatório");
        if (quantidade == null) throw new IllegalArgumentException("quantidade é obrigatória");
        if (valorUnitario == null) throw new IllegalArgumentException("valorUnitario é obrigatório");

        this.nItem = nItem;
        this.produto = produto;
        this.quantidade = quantidade;
        this.valorUnitario = valorUnitario;

        // vProd = qCom * vUnCom
        this.valorBruto = valorUnitario.mul(quantidade.getValue());

        this.desconto = desconto != null ? desconto : Dinheiro.zero();
        this.frete = frete != null ? frete : Dinheiro.zero();
        this.seguro = seguro != null ? seguro : Dinheiro.zero();
        this.outras = outras != null ? outras : Dinheiro.zero();

        this.tributos = tributos;
        validarConsistencia();
    }

    private void validarConsistencia() {
        // vProd não pode ser 0 para item normal (regra simples; podemos flexibilizar depois)
        if (valorBruto.getValue().compareTo(BigDecimal.ZERO) <= 0) {
            throw new IllegalArgumentException("Valor bruto do item deve ser > 0");
        }
        // desconto não pode exceder vProd (regra básica)
        if (desconto.getValue().compareTo(valorBruto.getValue()) > 0) {
            throw new IllegalArgumentException("Desconto não pode ser maior que o valor bruto do item");
        }
    }

    public int getNItem(){ return nItem; }
    public ProdutoFiscal getProduto(){ return produto; }
    public Quantidade getQuantidade(){ return quantidade; }
    public Dinheiro getValorUnitario(){ return valorUnitario; }
    public Dinheiro getValorBruto(){ return valorBruto; }
    public Dinheiro getDesconto(){ return desconto; }
    public Dinheiro getFrete(){ return frete; }
    public Dinheiro getSeguro(){ return seguro; }
    public Dinheiro getOutras(){ return outras; }
    public TributosItem getTributos(){ return tributos; }

    public Dinheiro getValorLiquido() {
        // vItem = vProd - vDesc + vFrete + vSeg + vOutro
        return valorBruto.sub(desconto).add(frete).add(seguro).add(outras);
    }
}
