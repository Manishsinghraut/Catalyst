import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by RLE0372 on 04-01-2017.
 */

@RunWith(Cucumber.class)
@CucumberOptions(
        features = {
                "src/test/resources/settings/userssetup/CreateEditDelDesigner.feature",
        },
        glue={"com.rl.qa"},
        format = {"json:target/reports/json/CreateDesignerUser.json"})

public class CreateDesignerUserRunner {
}