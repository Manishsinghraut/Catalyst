import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0372 on 06-01-2017.
 */

@RunWith(Cucumber.class)
@CucumberOptions(
        features = {
                "src/test/resources/settings/userssetup/DeleteOrganization.feature",
        },
        glue={"com.rl.qa"},
        format = {"json:target/reports/json/DeleteOrganization.json"})

public class DeleteOrgRunner {
}
