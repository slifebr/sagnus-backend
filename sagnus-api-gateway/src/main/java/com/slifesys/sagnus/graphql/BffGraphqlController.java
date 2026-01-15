package com.slifesys.sagnus.graphql;

import com.slifesys.sagnus.corp.application.dto.MarcaResult;
import com.slifesys.sagnus.corp.application.dto.PessoaResult;
import com.slifesys.sagnus.corp.application.dto.SindicatoResult;
import com.slifesys.sagnus.corp.application.dto.TransportadoraResult;
import com.slifesys.sagnus.corp.application.dto.VendedorResult;
import com.slifesys.sagnus.corp.application.dto.AlterarPessoaCommand;
import com.slifesys.sagnus.corp.application.dto.CadastrarPessoaCommand;
import com.slifesys.sagnus.corp.application.usecase.AlterarPessoaUseCase;
import com.slifesys.sagnus.corp.application.usecase.CadastrarPessoaUseCase;
import com.slifesys.sagnus.corp.application.usecase.ListarPessoasUseCase;
import com.slifesys.sagnus.corp.application.usecase.ListarSindicatosUseCase;
import com.slifesys.sagnus.corp.application.usecase.ListarTransportadorasUseCase;
import com.slifesys.sagnus.corp.application.usecase.ListarVendedoresUseCase;
import com.slifesys.sagnus.corp.application.usecase.ObterMarcaUseCase;
import com.slifesys.sagnus.corp.application.usecase.ObterPessoaUseCase;
import com.slifesys.sagnus.corp.application.usecase.ObterSindicatoUseCase;
import com.slifesys.sagnus.corp.application.usecase.ObterTransportadoraUseCase;
import com.slifesys.sagnus.corp.application.usecase.ObterVendedorUseCase;
import com.slifesys.sagnus.nfe.application.command.EmitirNfeCommand;
import com.slifesys.sagnus.nfe.application.command.EmitirNfeItemCommand;
import com.slifesys.sagnus.nfe.application.result.EmitirNfeResult;
import com.slifesys.sagnus.nfe.application.usecase.EmitirNfeUseCase;
import com.slifesys.sagnus.shared.paging.PageDirection;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;
import lombok.RequiredArgsConstructor;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;

import java.math.BigDecimal;
import java.util.List;

/**
 * BFF GraphQL fino.
 * Regra: apenas delegação para UseCases dos BCs (CORP, NFE).
 * Não conter regras de negócio nem persistência.
 */
@Controller
@RequiredArgsConstructor
public class BffGraphqlController {

    private final ObterPessoaUseCase obterPessoaUseCase;
    private final ListarPessoasUseCase listarPessoasUseCase;
    private final CadastrarPessoaUseCase cadastrarPessoaUseCase;
    private final AlterarPessoaUseCase alterarPessoaUseCase;
    private final ObterMarcaUseCase obterMarcaUseCase;

    private final ObterTransportadoraUseCase obterTransportadoraUseCase;
    private final ObterVendedorUseCase obterVendedorUseCase;
    private final ObterSindicatoUseCase obterSindicatoUseCase;

    private final ListarTransportadorasUseCase listarTransportadorasUseCase;
    private final ListarVendedoresUseCase listarVendedoresUseCase;
    private final ListarSindicatosUseCase listarSindicatosUseCase;

    private final EmitirNfeUseCase emitirNfeUseCase;

    // --------------------
    // Queries (CORP)
    // --------------------

    @QueryMapping
    public CorpPessoa corpPessoa(@Argument Long id) {
        PessoaResult r = obterPessoaUseCase.execute(id);
        return CorpPessoa.from(r);
    }

    @QueryMapping
    public TelaCadastroPessoa telaCadastroPessoa(@Argument Long id) {
        // DTO read-only para UI. Por enquanto: apenas Pessoa.
        PessoaResult r = obterPessoaUseCase.execute(id);
        return new TelaCadastroPessoa(CorpPessoa.from(r));
    }

    @QueryMapping
    public CorpPessoaPage corpPessoas(@Argument CorpPessoaFilterInput filter, @Argument PageInput page) {
        PageRequest req = toPageRequest(page, "id");
        String nome = filter != null ? filter.nome : null;
        String documento = filter != null ? filter.documento : null;
        PageResult<PessoaResult> result = listarPessoasUseCase.execute(nome, documento, req);
        return CorpPessoaPage.from(result);
    }

    @QueryMapping
    public CorpMarca corpMarca(@Argument Long id) {
        MarcaResult r = obterMarcaUseCase.execute(id);
        return CorpMarca.from(r);
    }

    @QueryMapping
    public CorpTransportadora corpTransportadora(@Argument Long id) {
        TransportadoraResult r = obterTransportadoraUseCase.execute(id);
        return CorpTransportadora.from(r);
    }

    @QueryMapping
    public CorpTransportadoraPage corpTransportadoras(@Argument PageInput page) {
        PageRequest req = toPageRequest(page, "id");
        PageResult<TransportadoraResult> r = listarTransportadorasUseCase.execute(req);
        return CorpTransportadoraPage.from(r);
    }

    @QueryMapping
    public CorpVendedor corpVendedor(@Argument Long id) {
        VendedorResult r = obterVendedorUseCase.execute(id);
        return CorpVendedor.from(r);
    }

    @QueryMapping
    public CorpVendedorPage corpVendedores(@Argument PageInput page) {
        PageRequest req = toPageRequest(page, "id");
        PageResult<VendedorResult> r = listarVendedoresUseCase.execute(req);
        return CorpVendedorPage.from(r);
    }

    @QueryMapping
    public CorpSindicato corpSindicato(@Argument Long id) {
        SindicatoResult r = obterSindicatoUseCase.execute(id);
        return CorpSindicato.from(r);
    }

    @QueryMapping
    public CorpSindicatoPage corpSindicatos(@Argument PageInput page) {
        PageRequest req = toPageRequest(page, "id");
        PageResult<SindicatoResult> r = listarSindicatosUseCase.execute(req);
        return CorpSindicatoPage.from(r);
    }

    // --------------------
    // Mutations (CORP)
    // --------------------

    @MutationMapping
    public CorpPessoa corpCriarPessoa(@Argument CorpPessoaCreateInput input) {
        CadastrarPessoaCommand cmd = CadastrarPessoaCommand.builder()
                .nome(input.nome)
                .tipo(input.parseTipo())
                .documento(input.documento)
                .site(input.site)
                .email(input.email)
                .usuCriacao("SYSTEM")
                .build();

        PessoaResult saved = cadastrarPessoaUseCase.execute(cmd);
        return CorpPessoa.from(saved);
    }

    @MutationMapping
    public CorpPessoa corpAlterarPessoa(@Argument Long id, @Argument CorpPessoaUpdateInput input) {
        AlterarPessoaCommand cmd = AlterarPessoaCommand.builder()
                .id(id)
                .nome(input.nome)
                .site(input.site)
                .email(input.email)
                .build();

        PessoaResult saved = alterarPessoaUseCase.execute(cmd);
        return CorpPessoa.from(saved);
    }

    // --------------------
    // Mutations (NFE)
    // --------------------

    @MutationMapping
    public NfeEmitirPayload nfeEmitir(@Argument NfeEmitirInput input) {
        EmitirNfeCommand cmd = EmitirNfeCommand.builder()
                .emitentePessoaId(input.emitentePessoaId)
                .destinatarioPessoaId(input.destinatarioPessoaId)
                .itens(input.itens.stream().map(NfeEmitirItemInput::toItemCmd).toList())
                .build();

        EmitirNfeResult r = emitirNfeUseCase.execute(cmd);
        return new NfeEmitirPayload(r.getNfeId(), r.getStatus(), r.getMensagem());
    }

    // --------------------
    // Helpers
    // --------------------

    private static PageRequest toPageRequest(PageInput page, String defaultSortBy) {
        PageInput p = page != null ? page : new PageInput(0, 20, defaultSortBy, "ASC");
        PageDirection dir = "DESC".equalsIgnoreCase(p.sortDir) ? PageDirection.DESC : PageDirection.ASC;
        String sortBy = (p.sortBy == null || p.sortBy.isBlank()) ? defaultSortBy : p.sortBy;
        return PageRequest.of(p.page, p.size, sortBy, dir);
    }

    private static BigDecimal parseDecimal(String value) {
        if (value == null || value.isBlank()) return null;
        String raw = value.trim();

        // Casos comuns:
        // - "1234.56" (ponto decimal)
        // - "1234,56" (vírgula decimal)
        // - "1.234,56" (milhar com ponto e decimal com vírgula)
        // - "1,234.56" (milhar com vírgula e decimal com ponto)

        boolean hasDot = raw.contains(".");
        boolean hasComma = raw.contains(",");

        String normalized;
        if (hasDot && hasComma) {
            // Decide o separador decimal pelo último caractere entre '.' e ','
            int lastDot = raw.lastIndexOf('.');
            int lastComma = raw.lastIndexOf(',');
            if (lastComma > lastDot) {
                // decimal = ',' => remove milhares '.'
                normalized = raw.replace(".", "").replace(",", ".");
            } else {
                // decimal = '.' => remove milhares ','
                normalized = raw.replace(",", "");
            }
        } else if (hasComma) {
            normalized = raw.replace(",", ".");
        } else {
            normalized = raw;
        }

        return new BigDecimal(normalized);
    }

    // --------------------
    // Types / Inputs (alinhados ao schema.graphqls)
    // --------------------

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
        static CorpPessoa from(PessoaResult r) {
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
        static CorpMarca from(MarcaResult r) {
            return new CorpMarca(r.getId(), r.getNome());
        }
    }

    public record CorpTransportadora(Long id, Long idPessoa, String placaVeiculo, String rntc) {
        static CorpTransportadora from(TransportadoraResult r) {
            return new CorpTransportadora(r.getId(), r.getIdPessoa(), r.getPlacaVeiculo(), r.getRntc());
        }
    }

    public record CorpVendedor(Long id, Long idPessoa, String comissao, String meta) {
        static CorpVendedor from(VendedorResult r) {
            return new CorpVendedor(
                    r.getId(),
                    r.getIdPessoa(),
                    r.getComissao() != null ? r.getComissao().toPlainString() : null,
                    r.getMeta() != null ? r.getMeta().toPlainString() : null
            );
        }
    }

    public record CorpSindicato(Long id, String nome, String cnpj, String uf, String email, String pisoSalarial) {
        static CorpSindicato from(SindicatoResult r) {
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

    public record PageInput(Integer page, Integer size, String sortBy, String sortDir) {
        public PageInput {
            if (page == null) page = 0;
            if (size == null) size = 20;
            if (sortDir == null) sortDir = "ASC";
        }
    }

    public record PageInfo(Integer page, Integer size, Double totalElements, Integer totalPages) {}

    public record CorpPessoaPage(List<CorpPessoa> items, PageInfo pageInfo) {
        static CorpPessoaPage from(PageResult<PessoaResult> page) {
            List<CorpPessoa> items = page.getItems().stream().map(CorpPessoa::from).toList();
            PageInfo info = new PageInfo(page.getPage(), page.getSize(), (double) page.getTotalElements(), page.getTotalPages());
            return new CorpPessoaPage(items, info);
        }
    }

    public record CorpTransportadoraPage(List<CorpTransportadora> items, PageInfo pageInfo) {
        static CorpTransportadoraPage from(PageResult<TransportadoraResult> page) {
            List<CorpTransportadora> items = page.getItems().stream().map(CorpTransportadora::from).toList();
            PageInfo info = new PageInfo(page.getPage(), page.getSize(), (double) page.getTotalElements(), page.getTotalPages());
            return new CorpTransportadoraPage(items, info);
        }
    }

    public record CorpVendedorPage(List<CorpVendedor> items, PageInfo pageInfo) {
        static CorpVendedorPage from(PageResult<VendedorResult> page) {
            List<CorpVendedor> items = page.getItems().stream().map(CorpVendedor::from).toList();
            PageInfo info = new PageInfo(page.getPage(), page.getSize(), (double) page.getTotalElements(), page.getTotalPages());
            return new CorpVendedorPage(items, info);
        }
    }

    public record CorpSindicatoPage(List<CorpSindicato> items, PageInfo pageInfo) {
        static CorpSindicatoPage from(PageResult<SindicatoResult> page) {
            List<CorpSindicato> items = page.getItems().stream().map(CorpSindicato::from).toList();
            PageInfo info = new PageInfo(page.getPage(), page.getSize(), (double) page.getTotalElements(), page.getTotalPages());
            return new CorpSindicatoPage(items, info);
        }
    }

    public record CorpPessoaCreateInput(String nome, String tipo, String documento, String site, String email) {
        com.slifesys.sagnus.corp.domain.model.pessoa.TipoPessoa parseTipo() {
            if (tipo == null || tipo.isBlank()) return null;
            String v = tipo.trim().toUpperCase();
            if (v.equals("F")) return com.slifesys.sagnus.corp.domain.model.pessoa.TipoPessoa.FISICA;
            if (v.equals("J")) return com.slifesys.sagnus.corp.domain.model.pessoa.TipoPessoa.JURIDICA;
            return com.slifesys.sagnus.corp.domain.model.pessoa.TipoPessoa.valueOf(v);
        }
    }

    public record CorpPessoaUpdateInput(String nome, String tipo, String documento, String site, String email, Boolean ativa) {
        com.slifesys.sagnus.corp.domain.model.pessoa.TipoPessoa parseTipo() {
            if (tipo == null || tipo.isBlank()) return null;
            String v = tipo.trim().toUpperCase();
            if (v.equals("F")) return com.slifesys.sagnus.corp.domain.model.pessoa.TipoPessoa.FISICA;
            if (v.equals("J")) return com.slifesys.sagnus.corp.domain.model.pessoa.TipoPessoa.JURIDICA;
            return com.slifesys.sagnus.corp.domain.model.pessoa.TipoPessoa.valueOf(v);
        }
    }

    public record NfeEmitirInput(Long emitentePessoaId, Long destinatarioPessoaId, List<NfeEmitirItemInput> itens) {}

    public record NfeEmitirItemInput(
            Integer nItem,
            Long produtoId,
            String descricao,
            String ncm,
            String cfop,
            String uCom,
            String quantidade,
            String valorUnitario,
            String desconto,
            String frete,
            String seguro,
            String outras,
            String cstIbsCbs,
            String cClassTrib,
            String ibsBase,
            String ibsAliquota,
            String ibsValor,
            String cbsBase,
            String cbsAliquota,
            String cbsValor,
            String regimeIbsCbs
    ) {
        EmitirNfeItemCommand toItemCmd() {
            return EmitirNfeItemCommand.builder()
                    .nItem(nItem)
                    .produtoId(produtoId)
                    .descricao(descricao)
                    .ncm(ncm)
                    .cfop(cfop)
                    .uCom(uCom)
                    .quantidade(parseDecimal(quantidade))
                    .valorUnitario(parseDecimal(valorUnitario))
                    .desconto(parseDecimal(desconto))
                    .frete(parseDecimal(frete))
                    .seguro(parseDecimal(seguro))
                    .outras(parseDecimal(outras))
                    .cstIbsCbs(cstIbsCbs)
                    .cClassTrib(cClassTrib)
                    .ibsBase(parseDecimal(ibsBase))
                    .ibsAliquota(parseDecimal(ibsAliquota))
                    .ibsValor(parseDecimal(ibsValor))
                    .cbsBase(parseDecimal(cbsBase))
                    .cbsAliquota(parseDecimal(cbsAliquota))
                    .cbsValor(parseDecimal(cbsValor))
                    .regimeIbsCbs(regimeIbsCbs)
                    .build();
        }
    }

    public record NfeEmitirPayload(Long nfeId, String status, String mensagem) {}
}
