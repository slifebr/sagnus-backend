package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.CadastrarVendedorCommand;
import com.slifesys.sagnus.corp.application.dto.VendedorResult;
import com.slifesys.sagnus.corp.application.port.VendedorRepository;
import com.slifesys.sagnus.corp.domain.model.vendedor.Vendedor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CadastrarVendedorUseCase {

    private final VendedorRepository vendedorRepository;

    @Transactional
    public VendedorResult execute(CadastrarVendedorCommand command) {
        Vendedor novo = new Vendedor(
                command.getIdPessoa(),
                command.getComissao(),
                command.getMeta(),
                command.getUsuCriacao());
        Vendedor salvo = vendedorRepository.save(novo);
        return VendedorResult.from(salvo);
    }
}
