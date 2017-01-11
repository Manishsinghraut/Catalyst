package com.lucernex.qa;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(
    features = "target/test-classes/CreateEnterpriseCompany.feature",
    format = {"html:target/cucumber", "json:target/cucumber.json" },
    strict = true)
public class CreateEnterpriseCompanyTest {
}
