import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0372 on 06-09-2016.
 */

@RunWith(Cucumber.class)
@CucumberOptions(
        features = {
                        "src/test/resources/catalyst/settings/devopssetup/CreateEditDelDocker.feature",
                        "src/test/resources/catalyst/settings/devopssetup/CreateEditDelJenkins.feature",
                        "src/test/resources/catalyst/settings/userssetup/CreateEditDeleteTeams.feature",
                        "src/test/resources/catalyst/settings/userssetup/CreateOrgAndVerifyFourAutoCreatedTeams.feature"
        },
        glue={"com.rl.qa"},
        format = {"json:target/reports/json/CreateEditDelOrg.json"})
public class TestRunner7 {

}