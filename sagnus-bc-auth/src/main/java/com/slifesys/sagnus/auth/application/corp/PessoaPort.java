package com.slifesys.sagnus.auth.application.corp;
import java.util.Optional;
public interface PessoaPort {
  Optional<Long> buscarPessoaId(Long pessoaId);
}
