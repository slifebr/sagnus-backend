package com.slifesys.sagnus.graphql.dto;

import com.slifesys.sagnus.corp.contract.marca.MarcaDTO;
import com.slifesys.sagnus.corp.contract.pessoa.PessoaDTO;
import com.slifesys.sagnus.corp.contract.sindicato.SindicatoDTO;
import com.slifesys.sagnus.corp.contract.transportadora.TransportadoraDTO;
import com.slifesys.sagnus.corp.contract.vendedor.VendedorDTO;
import com.slifesys.sagnus.shared.paging.PageResult;
import java.util.List;

public class CorpTypes {

    public record TelaCadastroPessoa(CorpPessoa pessoa) {}

    public record CorpPessoa(
            Long id,
            String nome,
            String tipo,
            String documento,
            String site,
            String email,
            Boolean ativa
    ) {
        public static CorpPessoa from(PessoaDTO r) {
            String tipo = null;
            if (r.getTipo() != null) {
                tipo = r.getTipo().name().equals("FISICA") ? "F" : "J";
            }
            return new CorpPessoa(
                    r.getId(),
                    r.getNome(),
                    tipo,
                    r.getDocumento(),
                    r.getSite(),
                    r.getEmail(),
                    r.isAtiva()
            );
        }
    }

    public record CorpMarca(Long id, String nome) {
        public static CorpMarca from(MarcaDTO r) {
            return new CorpMarca(r.getId(), r.getNome());
        }
    }

    public record CorpTransportadora(Long id, Long idPessoa, String placaVeiculo, String rntc) {
        public static CorpTransportadora from(TransportadoraDTO r) {
            return new CorpTransportadora(r.getId(), r.getIdPessoa(), r.getPlacaVeiculo(), r.getRntc());
        }
    }

    public record CorpVendedor(Long id, Long idPessoa, String comissao, String meta) {
        public static CorpVendedor from(VendedorDTO r) {
            return new CorpVendedor(
                    r.getId(),
                    r.getIdPessoa(),
                    r.getComissao() != null ? r.getComissao().toPlainString() : null,
                    r.getMeta() != null ? r.getMeta().toPlainString() : null
            );
        }
    }

    public record CorpSindicato(Long id, String nome, String cnpj, String uf, String email, String pisoSalarial) {
        public static CorpSindicato from(SindicatoDTO r) {
            return new CorpSindicato(
                    r.getId(),
                    r.getNome(),
                    r.getCnpj(),
                    r.getUf(),
                    r.getEmail(),
                    r.getPisoSalarial() != null ? r.getPisoSalarial().toPlainString() : null
            );
        }
    }

    public record CorpPessoaFilterInput(String nome, String documento) {}

    public record CorpPessoaPage(List<CorpPessoa> items, PageInfo pageInfo) {
        public static CorpPessoaPage from(PageResult<PessoaDTO> page) {
            List<CorpPessoa> items = page.getItems().stream().map(CorpPessoa::from).toList();
            PageInfo info = new PageInfo(page.getPage(), page.getSize(), (double) page.getTotalElements(), page.getTotalPages());
            return new CorpPessoaPage(items, info);
        }
    }

    public record CorpTransportadoraPage(List<CorpTransportadora> items, PageInfo pageInfo) {
        public static CorpTransportadoraPage from(PageResult<TransportadoraDTO> page) {
            List<CorpTransportadora> items = page.getItems().stream().map(CorpTransportadora::from).toList();
            PageInfo info = new PageInfo(page.getPage(), page.getSize(), (double) page.getTotalElements(), page.getTotalPages());
            return new CorpTransportadoraPage(items, info);
        }
    }

    public record CorpVendedorPage(List<CorpVendedor> items, PageInfo pageInfo) {
        public static CorpVendedorPage from(PageResult<VendedorDTO> page) {
            List<CorpVendedor> items = page.getItems().stream().map(CorpVendedor::from).toList();
            PageInfo info = new PageInfo(page.getPage(), page.getSize(), (double) page.getTotalElements(), page.getTotalPages());
            return new CorpVendedorPage(items, info);
        }
    }

    public record CorpSindicatoPage(List<CorpSindicato> items, PageInfo pageInfo) {
        public static CorpSindicatoPage from(PageResult<SindicatoDTO> page) {
            List<CorpSindicato> items = page.getItems().stream().map(CorpSindicato::from).toList();
            PageInfo info = new PageInfo(page.getPage(), page.getSize(), (double) page.getTotalElements(), page.getTotalPages());
            return new CorpSindicatoPage(items, info);
        }
    }

    public record CorpPessoaCreateInput(String nome, String tipo, String documento, String site, String email) {
        public com.slifesys.sagnus.corp.contract.pessoa.TipoPessoa parseTipo() {
            if (tipo == null || tipo.isBlank()) return null;
            String v = tipo.trim().toUpperCase();
            if (v.equals("F")) return com.slifesys.sagnus.corp.contract.pessoa.TipoPessoa.FISICA;
            if (v.equals("J")) return com.slifesys.sagnus.corp.contract.pessoa.TipoPessoa.JURIDICA;
            return com.slifesys.sagnus.corp.contract.pessoa.TipoPessoa.valueOf(v);
        }
    }

    public record CorpPessoaUpdateInput(String nome, String tipo, String documento, String site, String email, Boolean ativa) {
        // Method not used in update, but good to have signature correct if needed
    }
}
