package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.AlterarVendedorCommand;
import com.slifesys.sagnus.corp.application.dto.VendedorResult;
import com.slifesys.sagnus.corp.application.port.VendedorRepository;
import com.slifesys.sagnus.corp.domain.model.vendedor.Vendedor;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AlterarVendedorUseCase {

    private final VendedorRepository vendedorRepository;

    @Transactional
    public VendedorResult execute(AlterarVendedorCommand command) {
        Vendedor vendedor = vendedorRepository.findById(command.getId())
                .orElseThrow(
                        () -> new NotFoundException("CORP-404", "Vendedor nao encontrado com id: " + command.getId()));

        Vendedor atualizado = new Vendedor(
                vendedor.getId(),
                command.getIdPessoa() != null ? command.getIdPessoa() : vendedor.getIdPessoa(),
                command.getComissao() != null ? command.getComissao() : vendedor.getComissao(),
                command.getMeta() != null ? command.getMeta() : vendedor.getMeta(),
                vendedor.getCriadoEm(),
                vendedor.getUsuCriacao(),
                java.time.Instant.now(),
                command.getUsuAlteracao());

        Vendedor salvo = vendedorRepository.save(atualizado);
        return VendedorResult.from(salvo);
    }
}
