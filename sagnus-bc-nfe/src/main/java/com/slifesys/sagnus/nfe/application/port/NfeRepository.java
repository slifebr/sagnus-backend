package com.slifesys.sagnus.nfe.application.port;

import com.slifesys.sagnus.nfe.domain.model.nfe.Nfe;

public interface NfeRepository {
    Nfe save(Nfe nfe);
}
