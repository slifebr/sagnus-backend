package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.command.CadastrarVendedorCommand;
import com.slifesys.sagnus.corp.contract.vendedor.VendedorDTO;
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
    public VendedorDTO execute(CadastrarVendedorCommand command) {
        Vendedor novo = new Vendedor(
                command.getIdPessoa(),
                command.getComissao(),
                command.getMeta(),
                command.getUsuCriacao());
        Vendedor salvo = vendedorRepository.save(novo);
        return VendedorDTO.builder()
                .id(salvo.getId())
                .idPessoa(salvo.getIdPessoa())
                .comissao(salvo.getComissao())
                .meta(salvo.getMeta())
                .build();
    }
}
