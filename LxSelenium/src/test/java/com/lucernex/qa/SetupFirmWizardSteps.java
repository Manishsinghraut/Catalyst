package com.lucernex.qa;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.utils.CucumberContext;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.HomeView;
import com.lucernex.qa.views.admin.lxadmin.SetupFirmWizardView;
import com.lucernex.qa.views.components.EditableFormOrPageView;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

import java.net.URL;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

//import static com.lucernex.qa.utils.ForceWaitForItem.delay;
import static com.lucernex.qa.views.iwms.CommonMethods.setFields;
import static junit.framework.TestCase.fail;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

public class SetupFirmWizardSteps {
    private static final Logger          logger = Logger.getLogger(SetupFirmWizardSteps.class.getName());
    private static final String   FIRM_SEQUENCE = "FIRM_SEQUENCE";
    private static final String       FIRM_NAME = "Firm Name";
    private static final String LOGIN_FIRM_NAME = "Login Firm Name";

    @And("^I enter the Create Enterprise Company URL$")
    public void I_enter_the_Create_Enterprise_Company_URL() throws Throwable {
        String createEnterpriseCompanyURL = "/en/admin/FirmEdit.jsp?formSubmit=editBO&update=false";
        URL                       baseURL = CucumberContext.getURL();

        assertNotNull(baseURL);

        String lxAdminURL = baseURL.toString() + createEnterpriseCompanyURL;

        BrowserDriver.loadPage(lxAdminURL);
    }

    private EditableFormOrPageView formOrPageView = new EditableFormOrPageView();

    @And("^I see it has these required fields in the Create Enterprise Company form:$")
    public void I_see_it_has_these_required_fields_in_the_Create_Enterprise_Company_form(List<String> expected) {
        formOrPageView.verifyExpectedFields(expected);
    }

    private String getFirmSequence() {
        String firmSequence = System.getProperty(FIRM_SEQUENCE);

        if (firmSequence == null) {
            firmSequence = System.getenv(FIRM_SEQUENCE);
        }

        // If we still don't know the firm sequence then dump all environment variables.
        if (firmSequence == null) {
            Map<String, String> env = System.getenv();

            logger.info("---Start Environment variables---");

            for (String n : env.keySet()) {
                String v = env.get(n);

                if (v != null) {
                    logger.info(String.format("%s: %s", n, v));
                }
            }

            logger.info("---End Environment variables---");
        }

        return firmSequence;
    }

    /**
     * We need to create a firm using a firm name that does not already exist and
     * since we have no way to query the set of known firm names we must be given
     * a sequence number for sake of uniqueness. Cucumber has a means of generating
     * such a sequence number (e.g. the build number) and we will leverage that
     * feature here. So the expectation is when the CreateEnterpriseCompany test
     * case is executed, then we need this JVM parameter to be defined by bamboo
     * in the Maven bamboo task (specifically the Goal field of the Maven 3.x
     * configuration):
     *
     *    -DbuildNumber=${bamboo.buildNumber}
     *
     * The bamboo.buildNumber is a monotonically increasing integer with each build.
     */
    @When("^I enter these field values into the Create Enterprise Company form$")
    public void I_enter_these_field_values_into_the_Create_Enterprise_Company_form(List<Field> fields) {
        String firmSequence = getFirmSequence();

        assertNotNull(
            String.format("Required JVM parameter '%s' not specified", FIRM_SEQUENCE),
            firmSequence
        );

        String      firmName = "Selenium-" + firmSequence;
        String loginFirmName = "selenium-" + firmSequence;

        logger.info(String.format("Using login firm name'%s'", loginFirmName));

//        int count = 0;
//
//        for (Field f : fields) {
//            if (f.getName().equals(FIRM_NAME)) {
//                f.setValue(firmName);
//                ++count;
//            } else if (f.getName().equals(LOGIN_FIRM_NAME)) {
//                f.setValue(loginFirmName);
//                ++count;
//            }
//        }
//
//        assertEquals(2, count);
//        formOrPageView.enterFieldValues(fields);

        for (Field f : fields) {
            try {

                if (f.getName().equals("FirmName")) {
                    setFields(f.getName(), firmName);
                } else if (f.getName().equals("LoginFirmName")) {
                    setFields(f.getName(), loginFirmName);
                }
                else{
                    setFields(f.getName(), f.getValue());
                }
            } catch (Exception Ex) {
                BaseView.takeScreenshot(f.getName() + ".png");
                logger.info("Error :" + Ex.getMessage());
            }
        }
    }

    @And("^I click the \"([^\"]*)\" button in the setup firm wizard$")
    public void I_click_the_button_in_the_setup_firm_wizard(String button) {
//        delay(3000);
        SetupFirmWizardView view = new SetupFirmWizardView();

        try {
            view.clickButton(button);
            BaseView.popDefaultTimeout();
        } catch (org.openqa.selenium.NoSuchElementException e) {
            BaseView.takeScreenshot("Create_Enterprise_Company-looking-for-Start_Processing.png");
            fail("Did not see the [Start Processing] button");
        }
    }

    @Then("^I see that I am in the right firm$")
    public void I_see_that_I_am_in_the_right_firm() throws Throwable {
        String firmSequence = getFirmSequence();

        assertNotNull(
            String.format("Required JVM parameter '%s' not specified", FIRM_SEQUENCE),
            firmSequence
        );

        String       expected = "Selenium-" + firmSequence;
        String actualFirmName = HomeView.getFirmName();

        assertNotNull("Unable to determine firm name from IWMS web-ui", actualFirmName);
        assertEquals(expected, actualFirmName);
    }
}
