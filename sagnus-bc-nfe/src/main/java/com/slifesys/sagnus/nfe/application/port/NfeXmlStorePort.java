package com.slifesys.sagnus.nfe.application.port;

/**
 * Porta de armazenamento do XML gerado.
 *
 * Implementações:
 * - filesystem (local)
 * - banco (clob)
 * - s3/minio (futuro)
 */
public interface NfeXmlStorePort {

    void store(String nfeId, String xml);
}
