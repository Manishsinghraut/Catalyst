package com.lucernex.qa.views.entity.contract.details;

import com.lucernex.qa.utils.CucumberContext;
import org.junit.Test;

import java.util.Set;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

public class ContractBindersViewTest {
    @Test
    public void test() throws Exception {
         ContractBindersView view = new ContractBindersView(
            CucumberContext.getURL(),
            CucumberContext.getCredentials()
        );

        Set<String> names = view.getFieldNames();

        assertNotNull(names);
        assertTrue(names.size() > 0);
    }
}
