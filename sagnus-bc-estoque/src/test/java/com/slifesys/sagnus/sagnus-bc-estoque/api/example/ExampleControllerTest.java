package com.slifesys.sagnus.sagnus-bc-estoque.api.sagnus-bc-estoque;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.beans.factory.annotation.Autowired;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
class ExampleControllerTest {

    @Autowired
    MockMvc mvc;

    @Test
    void pingShouldReturn200() throws Exception {
        mvc.perform(get("/v1/sagnus-bc-estoque/ping"))
                .andExpect(status().isOk());
    }
}
