package com.slifesys.sagnus.nfe.infrastructure.event.spring;

import com.slifesys.sagnus.nfe.domain.event.RtcIbsCbsReconciledEvent;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

/**
 * Listener mínimo para observabilidade/auditoria: registra quando houve reconciliação IBS/CBS (LENIENT).
 * Em produção, o ideal é persistir via Outbox e correlacionar com NFe/Item.
 */
@Slf4j
@Component
public class RtcIbsCbsReconciledEventListener {

    @EventListener
    public void on(RtcIbsCbsReconciledEvent e) {
        log.warn("RTC IBS/CBS reconciliado: correlationId={}, label={}, configured={}, resolved={}, diff={}, tol={}, before=[base={},aliq={},val={}], after=[base={},aliq={},val={}]",
                e.getCorrelationId(),
                e.getLabel(),
                e.getConfiguredStrategy(),
                e.getResolvedStrategy(),
                e.getDiff(),
                e.getTolerance(),
                e.getBaseBefore(), e.getAliquotaBefore(), e.getValorBefore(),
                e.getBaseAfter(), e.getAliquotaAfter(), e.getValorAfter()
        );
    }
}
