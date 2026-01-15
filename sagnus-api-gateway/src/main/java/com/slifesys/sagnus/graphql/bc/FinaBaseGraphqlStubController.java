package com.slifesys.sagnus.graphql.bc;

import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;

/**
 * Stub inicial do BC fina-base no Gateway GraphQL (BFF fino).
 * Substitua/adapte para chamar use cases/ports reais do BC.
 */
@Controller
public class FinaBaseGraphqlStubController {

    @QueryMapping(name = "fina-basePing")
    public String ping() {
        return "OK";
    }

    @MutationMapping(name = "fina-basePingMut")
    public String pingMut() {
        return "OK";
    }
}
