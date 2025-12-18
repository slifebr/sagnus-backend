package com.slifesys.sagnus.nfe.application.service;

import com.slifesys.sagnus.nfe.application.config.RtcIbsCbsProperties;
import com.slifesys.sagnus.nfe.domain.exception.NfeDomainException;
import com.slifesys.sagnus.nfe.domain.model.imposto.TributosItem;
import com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs.CClassTrib;
import com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs.CstIbsCbs;
import org.springframework.stereotype.Service;

import java.util.Optional;

/**
 * Normaliza/valida os campos RTC (IBS/CBS) de um item.
 *
 * Regras MVP:
 * - Se IBS ou CBS estiver presente:
 *   - cstIbsCbs e cClassTrib devem existir (STRICT) ou serão defaultados (LENIENT).
 */
@Service
public class RtcIbsCbsNormalizer {

    private final RtcIbsCbsProperties props;

    public RtcIbsCbsNormalizer(RtcIbsCbsProperties props) {
        this.props = props;
    }

    public TributosItem normalize(TributosItem tributos) {
        if (tributos == null) return null;

        boolean hasIbs = tributos.getIbs() != null && tributos.getIbs().isPresent();
        boolean hasCbs = tributos.getCbs() != null && tributos.getCbs().isPresent();

        if (!hasIbs && !hasCbs) {
            return tributos;
        }

        Optional<CstIbsCbs> cst = tributos.getCstIbsCbs();
        Optional<CClassTrib> cClassTrib = tributos.getCClassTrib();

        if (cst.isPresent() && cClassTrib.isPresent()) {
            return tributos;
        }

        if (props.getValidation() == RtcIbsCbsProperties.ValidationMode.STRICT) {
            String msg = "RTC IBS/CBS: quando IBS/CBS está presente, CST e cClassTrib são obrigatórios";
            throw new NfeDomainException(msg);
        }

        // LENIENT: aplica defaults
        CstIbsCbs cstDefault = cst.orElseGet(() -> new CstIbsCbs(props.getDefaultCst()));
        CClassTrib cClassDefault = cClassTrib.orElseGet(() -> new CClassTrib(props.getDefaultCClassTrib()));

        return new TributosItem(
                tributos.getIcms(),
                tributos.getPis(),
                tributos.getCofins(),
                tributos.getIpi(),
                tributos.getIbs(),
                tributos.getCbs(),
                Optional.of(cstDefault),
                Optional.of(cClassDefault)
        );
    }
}
