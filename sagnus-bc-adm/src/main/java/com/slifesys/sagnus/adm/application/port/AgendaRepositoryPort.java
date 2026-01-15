package com.slifesys.sagnus.adm.application.port;

import com.slifesys.sagnus.adm.domain.model.agenda.CategoriaCompromisso;
import com.slifesys.sagnus.adm.domain.model.agenda.Compromisso;

import java.util.List;

public interface AgendaRepositoryPort {

    CategoriaCompromisso saveCategoria(CategoriaCompromisso categoria);
    List<CategoriaCompromisso> findAllCategorias();

    Compromisso saveCompromisso(Compromisso compromisso);
    List<Compromisso> findCompromissosByColaborador(Long colaboradorId);
}
