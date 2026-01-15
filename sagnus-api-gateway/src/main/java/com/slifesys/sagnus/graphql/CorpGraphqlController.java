package com.slifesys.sagnus.graphql;

import com.slifesys.sagnus.corp.application.dto.AlterarPessoaCommand;
import com.slifesys.sagnus.corp.application.dto.CadastrarPessoaCommand;
import com.slifesys.sagnus.corp.application.dto.MarcaResult;
import com.slifesys.sagnus.corp.application.dto.PessoaResult;
import com.slifesys.sagnus.corp.application.dto.SindicatoResult;
import com.slifesys.sagnus.corp.application.dto.TransportadoraResult;
import com.slifesys.sagnus.corp.application.dto.VendedorResult;
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
import com.slifesys.sagnus.graphql.dto.CorpTypes.CorpMarca;
import com.slifesys.sagnus.graphql.dto.CorpTypes.CorpPessoa;
import com.slifesys.sagnus.graphql.dto.CorpTypes.CorpPessoaCreateInput;
import com.slifesys.sagnus.graphql.dto.CorpTypes.CorpPessoaFilterInput;
import com.slifesys.sagnus.graphql.dto.CorpTypes.CorpPessoaPage;
import com.slifesys.sagnus.graphql.dto.CorpTypes.CorpPessoaUpdateInput;
import com.slifesys.sagnus.graphql.dto.CorpTypes.CorpSindicato;
import com.slifesys.sagnus.graphql.dto.CorpTypes.CorpSindicatoPage;
import com.slifesys.sagnus.graphql.dto.CorpTypes.CorpTransportadora;
import com.slifesys.sagnus.graphql.dto.CorpTypes.CorpTransportadoraPage;
import com.slifesys.sagnus.graphql.dto.CorpTypes.CorpVendedor;
import com.slifesys.sagnus.graphql.dto.CorpTypes.CorpVendedorPage;
import com.slifesys.sagnus.graphql.dto.CorpTypes.TelaCadastroPessoa;
import com.slifesys.sagnus.graphql.dto.PageInput;
import com.slifesys.sagnus.graphql.util.GraphqlUtils;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;
import lombok.RequiredArgsConstructor;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;

@Controller
@RequiredArgsConstructor
public class CorpGraphqlController {

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
        PessoaResult r = obterPessoaUseCase.execute(id);
        return new TelaCadastroPessoa(CorpPessoa.from(r));
    }

    @QueryMapping
    public CorpPessoaPage corpPessoas(@Argument CorpPessoaFilterInput filter, @Argument PageInput page) {
        PageRequest req = GraphqlUtils.toPageRequest(page, "id");
        String nome = filter != null ? filter.nome() : null;
        String documento = filter != null ? filter.documento() : null;
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
        PageRequest req = GraphqlUtils.toPageRequest(page, "id");
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
        PageRequest req = GraphqlUtils.toPageRequest(page, "id");
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
        PageRequest req = GraphqlUtils.toPageRequest(page, "id");
        PageResult<SindicatoResult> r = listarSindicatosUseCase.execute(req);
        return CorpSindicatoPage.from(r);
    }

    // --------------------
    // Mutations (CORP)
    // --------------------

    @MutationMapping
    public CorpPessoa corpCriarPessoa(@Argument CorpPessoaCreateInput input) {
        CadastrarPessoaCommand cmd = CadastrarPessoaCommand.builder()
                .nome(input.nome())
                .tipo(input.parseTipo())
                .documento(input.documento())
                .site(input.site())
                .email(input.email())
                .usuCriacao("SYSTEM")
                .build();

        PessoaResult saved = cadastrarPessoaUseCase.execute(cmd);
        return CorpPessoa.from(saved);
    }

    @MutationMapping
    public CorpPessoa corpAlterarPessoa(@Argument Long id, @Argument CorpPessoaUpdateInput input) {
        AlterarPessoaCommand cmd = AlterarPessoaCommand.builder()
                .id(id)
                .nome(input.nome())
                .site(input.site())
                .email(input.email())
                .build();

        PessoaResult saved = alterarPessoaUseCase.execute(cmd);
        return CorpPessoa.from(saved);
    }
}
