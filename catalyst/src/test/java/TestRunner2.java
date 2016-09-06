import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0372 on 23-08-2016.
 */
    @RunWith(Cucumber.class)
    @CucumberOptions(
            features = {

//                    "src/test/resources/catalyst/settings/orgsetup/CreateEnvUsingEnvFromChefServer.feature",
                    "src/test/resources/catalyst/settings/orgsetup/CreateEditDelEnvByCreatingNewEnv.feature",
//                    "src/test/resources/catalyst/settings/devopssetup/ConfigureNexusServer.feature",
//                    "src/test/resources/catalyst/settings/devopssetup/ConfigAWSProviderWithInvalidKey.feature",
            },
            glue={"com.rl.qa"},
            format = {"json:target/reports/json/CreateEditDelOrg.json"})
    public class TestRunner2 {


}
