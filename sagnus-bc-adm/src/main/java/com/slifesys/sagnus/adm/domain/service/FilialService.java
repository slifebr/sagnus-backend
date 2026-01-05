
package com.slifesys.sagnus.adm.domain.service;

import org.springframework.stereotype.Service;
import com.slifesys.sagnus.adm.domain.model.Filial;
import com.slifesys.sagnus.adm.infrastructure.repository.FilialRepository;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;

@Service
public class FilialService {

    @Autowired
    private FilialRepository filialRepository;

    public List<Filial> findAll() {
        return filialRepository.findAll();
    }
}
