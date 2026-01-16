package com.slifesys.sagnus.adm.api.modulo;

import com.slifesys.sagnus.adm.application.command.CreateModuloCommand;
import com.slifesys.sagnus.adm.application.result.CreateModuloResult;
import com.slifesys.sagnus.adm.domain.model.modulo.Modulo;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class ModuloApiMapper {

    public CreateModuloCommand toCommand(CreateModuloRequest request) {
        return new CreateModuloCommand(
                request.codigo(),
                request.nome(),
                request.descricao(),
                request.usuCriacao()
        );
    }

    public CreateModuloResponse toResponse(CreateModuloResult result) {
        return new CreateModuloResponse(result.id());
    }

    public ModuloResponse toResponse(Modulo modulo) {
        return new ModuloResponse(
                modulo.getId().getValue(),
                modulo.getCodigo(),
                modulo.getNome(),
                modulo.getDescricao()
        );
    }

    public List<ModuloResponse> toResponseList(List<Modulo> modulos) {
        return modulos.stream().map(this::toResponse).collect(Collectors.toList());
    }
}
