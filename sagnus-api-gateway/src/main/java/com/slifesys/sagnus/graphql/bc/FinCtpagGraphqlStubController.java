package com.slifesys.sagnus.graphql.bc;

import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;

/**
 * Stub inicial do BC fin-ctpag no Gateway GraphQL (BFF fino).
 * Substitua/adapte para chamar use cases/ports reais do BC.
 */
@Controller
public class FinCtpagGraphqlStubController {

    @QueryMapping(name = "fin-ctpagPing")
    public String ping() {
        return "OK";
    }

    @MutationMapping(name = "fin-ctpagPingMut")
    public String pingMut() {
        return "OK";
    }
}
