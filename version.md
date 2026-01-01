# Sagnus ERP — VERSION BASELINE v260101 (2026-01-01)

## v260101 — Consolidação do padrão DDD + cross-cutting

- CorrelationId unificado via `sagnus-shared-kernel` (`CorrelationIdContext`) + `sagnus-platform-web` (`CorrelationIdFilter`).
- Removida duplicação de `GlobalExceptionHandler` do `sagnus-shared-api-error` (ficou centralizado no `sagnus-platform-web`).
- `sagnus-shared-api-error` passou a depender apenas de `spring-web` (evita puxar stack web completa).
- POM raiz com versões centralizadas (jjwt/mapstruct/lombok) + pluginManagement para annotation processors.
- Limpeza de artefatos locais (targets/logs/poms duplicados).
- Adicionado `sagnus-bc-template` como template oficial (api/application/domain/infrastructure) para acelerar criação de novos BCs.

---

# Histórico

# Sagnus ERP — VERSION BASELINE 2025-12-18-20:30h (VERSION.md)

Baseline: 2025-12-18-20h 

#Próximo passo (na linha da Opção 1 — fila de trabalho com RabbitMQ) 

é criar o Worker consumidor + retry/DLQ do jeito certo, sem misturar com o retry do Outbox.
O que eu recomendo implementar agora
## 1.	Queue principal + DLQ + Retry queue (TTL)
	sagnus.nfe.events.q (principal)
	sagnus.nfe.events.retry.q (TTL → volta para principal)
	sagnus.nfe.events.dlq (dead-letter final)
## 2.	Consumer (Worker)
	@RabbitListener(queues = "...")
	desserializa OutboxEnvelope
	faz um “dispatch” por eventType:
	NfeEmitidaEvent → gerar/armazenar XML, chamar assinador etc
	RtcIbsCbsReconciledEvent → auditoria/telemetria
## 3.	Idempotência
	guardar eventId processado (tabela simples nfe_inbox_processed)
	evita duplicidade quando Rabbit reentrega ou quando você reprocessar.

# Saída do mvn clean install

[INFO] Results:
[INFO] 
[INFO] Tests run: 16, Failures: 0, Errors: 0, Skipped: 0
[INFO] 
[INFO] 
[INFO] --- jar:3.4.2:jar (default-jar) @ sagnus-bc-nfe ---
[INFO] Building jar: D:\Projetos\2025\Sagnus\ddd\sagnus\sagnus-bc-nfe\target\sagnus-bc-nfe-1.0.0-SNAPSHOT.jar
[INFO] 
[INFO] --- install:3.1.3:install (default-install) @ sagnus-bc-nfe ---
[INFO] Installing D:\Projetos\2025\Sagnus\ddd\sagnus\sagnus-bc-nfe\pom.xml to C:\Users\User\.m2\repository\com\slifesys\sagnus\sagnus-bc-nfe\1.0.0-SNAPSHOT\sagnus-bc-nfe-1.0.0-SNAPSHOT.pom
[INFO] Installing D:\Projetos\2025\Sagnus\ddd\sagnus\sagnus-bc-nfe\target\sagnus-bc-nfe-1.0.0-SNAPSHOT.jar to C:\Users\User\.m2\repository\com\slifesys\sagnus\sagnus-bc-nfe\1.0.0-SNAPSHOT\sagnus-bc-nfe-1.0.0-SNAPSHOT.jar
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary for Sagnus ERP 1.0.0-SNAPSHOT:
[INFO] 
[INFO] Sagnus ERP ......................................... SUCCESS [  0.411 s]
[INFO] sagnus-shared-kernel ............................... SUCCESS [  2.415 s]
[INFO] Sagnus Shared API Error ............................ SUCCESS [  2.469 s]
[INFO] Sagnus Platform Security ........................... SUCCESS [  2.470 s]
[INFO] Sagnus Platform Web ................................ SUCCESS [  1.455 s]
[INFO] Sagnus BC CORP API (Contract) ...................... SUCCESS [  1.298 s]
[INFO] Sagnus BC AUTH ..................................... SUCCESS [  3.710 s]
[INFO] Sagnus BC CORP ..................................... SUCCESS [  2.499 s]
[INFO] sagnus-bc-nfe ...................................... SUCCESS [ 11.775 s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  29.146 s
[INFO] Finished at: 2025-12-18T20:44:51-03:00
[INFO] ------------------------------------------------------------------------    
