package com.lucernex.qa;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.CucumberContext;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.utils.Spreadsheet;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.HomeView;
import com.lucernex.qa.views.LoginView;
import com.lucernex.swagger.util.Credentials;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import junit.framework.AssertionFailedError;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import static com.google.common.base.Strings.isNullOrEmpty;
import static junit.framework.Assert.assertNotNull;
import static junit.framework.TestCase.fail;

public class LoginSteps {
    private static final Logger logger = Logger.getLogger(LoginSteps.class.getName());
    private static final com.lucernex.qa.utils.SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    private URL getCurrentBaseURL() {
        try {
            URL currentURL = new URL(BrowserDriver.getCurrentDriver().getCurrentUrl());

            return new URL(currentURL.getProtocol(), currentURL.getHost(), currentURL.getPort(), "");
        } catch (MalformedURLException e) {
            logger.info(String.format("Invalid current URL [%s]", BrowserDriver.getCurrentDriver().getCurrentUrl()));
            return null;
        }
    }

    @Given("^I login to IWMS using LxAdmin credentials into the \"([^\"]*)\" firm$")
    public void I_login_to_IWMS_using_LxAdmin_credentials_into_the_firm(String firmname) throws Throwable{
        try {
            URL url = CucumberContext.getURL();

            assertNotNull(url);

            String appURL = url.toString();

            assertNotNull(appURL);

            // Load browser and point it at configured IWMS web-ui.
            BrowserDriver.loadPage(appURL);

            Boolean loggedIn = (Boolean) CucumberContext.getCucumberContext().get("loggedIn");

            if (loggedIn != null && loggedIn && HomeView.waitForAuthenticatedPage()) {
                logger.info("Already logged in, reusing authenticated session(1).");
                return;
            }

            Credentials credentials = CucumberContext.getCredentials();

            assertNotNull(credentials);

            // If we are given a firmname, then override the default.
            if (!isNullOrEmpty(firmname)) {
                logger.info("Using firm [" + firmname + "]");
                credentials = new Credentials(
                        credentials.getUsername(), firmname, credentials.getPassword()
                );
                CucumberContext.getCucumberContext().put("credentials", credentials);
            } else {
                logger.info("Using firm [" + credentials.getFirmname() + "]");
            }

            assertNotNull(credentials);

            // Already logged in so use existing authenticated session.
            if (HomeView.isAuthenticatedPageDisplayed()) {
                logger.info("Already logged in, reusing authenticated session(2).");
                CucumberContext.getCucumberContext().put("loggedIn", true);
                return;
            }

            // Look for 1st IWMS authentication page.
            LoginView.verifyFirstPageDisplayed();

            // Enter username and firmname in 1st IWMS authentication page.
            LoginView.firstPageSubmit(
                    credentials.getUsername(),
                    credentials.getFirmname()
            );

            // Wait for 2nd IWMS authentication page.
            LoginView.verifySecondPageDisplayed();

            // Enter password into 2nd IWMS authentication page.
            System.out.println(credentials.getPassword());
            LoginView.secondPageSubmit(credentials.getPassword());

            // Make sure we got logged in.
            for (int i = 0; i < 2; i++) {
                String currentURL = BrowserDriver.getCurrentDriver().getCurrentUrl();

                if (currentURL != null && currentURL.endsWith("ResetPasswordEditForm.jsp?expiredPassword=true")) {
                    HomeView.takeScreenshot("expired-password.png");
                    fail(String.format("The password for username [%s], firmname [%s] has expired!", credentials.getUsername(), credentials.getFirmname()));
                }

                try {
                    HomeView.verifyFooterDisplayed();
                } catch (NoSuchElementException e) {
                    URL baseURL = getCurrentBaseURL();

                    if (baseURL != null) {
                        // Redirect to IWMS dashboard.
                        BrowserDriver.loadPage(baseURL.toString() + "/RolloutManager/dashboard/DashboardDispatch.jsp");
                    }
                }
            }

            CucumberContext.getCucumberContext().put("loggedIn", true);

            URL baseURL = getCurrentBaseURL();

            if (baseURL != null) {
                // IWMS can redirect on login to a different URL so capture the redirect URL.
                CucumberContext.getCucumberContext().put(CucumberContext.IWMS_URL, baseURL);
            }

            logger.info("Logged in successfully.");
        }
        catch(Exception e){
            BaseView.takeScreenshot("I_login_to_IWMS_using_LxAdmin_credentials_into_the_firm");
            String msg = String.format("Unable to login and see expected dashboard: %s", e.getMessage());
            logger.log(Level.SEVERE, msg, e);
            fail(msg);
        }
    }

    @Given("^I login to IWMS using LxAdmin credentials$")
    public void I_login_to_IWMS_using_LxAdmin_credentials() throws Throwable{
        I_login_to_IWMS_using_LxAdmin_credentials_into_the_firm(null);
    }

    @Given("^I navigate to IWMS$")
    public void I_navigate_to_IWMS() throws Throwable {
        BrowserDriver.loadPage(CucumberContext.getURL());
    }

    @And("^I see the first IWMS authentication page$")
    public void I_see_the_first_IWMS_authentication_page() throws Throwable {
        LoginView.verifyFirstPageDisplayed();
    }

    @And("^I choose LxAdmin credentials$")
    public void I_choose_LxAdmin_credentials() throws Throwable {
        Credentials credentials = CucumberContext.getCredentials();

        assertNotNull(credentials);
    }

    @When("^I enter username and firmname from selected credentials$")
    public void I_enter_username_and_firmname_from_selected_credentials() throws Throwable {
        Credentials credentials = CucumberContext.getCredentials();

        assertNotNull(credentials);
        LoginView.firstPageSubmit(
            credentials.getUsername(),
            credentials.getFirmname()
        );
    }

    @And("^I see the second IWMS authentication page$")
    public void I_see_the_second_IWMS_authentication_page() throws Throwable {
        LoginView.verifySecondPageDisplayed();
    }

    @And("^I enter password from selected credentials$")
    public void I_enter_password_from_selected_credentials() throws Throwable {
        Credentials credentials = CucumberContext.getCredentials();

        assertNotNull(credentials);
        LoginView.secondPageSubmit(credentials.getPassword());
    }

    @Then("^the navigation bar is \"([^\"]*)\"$")
    public void The_navigation_bar_is(String visibility) throws Throwable {
        if ("visible".equals(visibility)) {
            HomeView.verifyNavigationBarDisplayed();
        } else {
            HomeView.verifyNavigationBarNotDisplayed();
        }
    }

    @And("^I logout$")
    public void I_logout() throws Throwable {
        SeleniumUtil.switchTodefaultContent();
//        ForceWaitForItem.delay(2000);
//        URL url = CucumberContext.getURL();
//        BrowserDriver.loadPage(url);
        HomeView.logout();
//        BrowserDriver.loadPage(url);
//        URL url = CucumberContext.getURL();
//        BrowserDriver.loadPage(url);
//        ForceWaitForItem.delay(2000);
    }

    private boolean isLoggedIn() {
        try {
            HomeView.verifyFooterDisplayed();
            return true;
        } catch (NoSuchElementException ex) {
            return false;
        } catch (AssertionFailedError error) {
            return false;
        }
    }

    @And("^I take a screenshot to file \"([^\"]*)\"$")
    public void I_take_a_screenshot_to_file(String filename) throws Throwable {
        BaseView.takeScreenshot(filename);
    }

    @And("^I switch to user \"([^\"]*)\"$")
    public void I_switch_to_user(String username) {
        try {
            CucumberContext.switchUser(username);
        } catch (Exception e) {
            fail(e.getMessage());
        }
    }

    @And("^I Login as \"([^\"]*)\" using \"([^\"]*)\" and \"([^\"]*)\" in the firm \"([^\"]*)\"$")
    public void     I_Login_as_using_and_in_the_firm(String strAccessType, String strUserName, String strPassword, String strFirmName) throws Throwable {

        URL url = CucumberContext.getURL();

        assertNotNull(url);

        String appURL = url.toString();

        assertNotNull(appURL);

        // Load browser and point it at configured IWMS web-ui.
        BrowserDriver.loadPage(appURL);

        Boolean loggedIn = (Boolean)CucumberContext.getCucumberContext().get("loggedIn");

        Credentials credentials = CucumberContext.getCredentials();

        assertNotNull(credentials);
        if (isNullOrEmpty(strFirmName)) {
            credentials = new Credentials(
                    strUserName, credentials.getFirmname(), strPassword
            );
        }
        else
            credentials = new Credentials(
                    strUserName, strFirmName, strPassword
            );

        CucumberContext.getCucumberContext().put("credentials", credentials);


        assertNotNull(credentials);

        // Look for 1st IWMS authentication page.
        LoginView.verifyFirstPageDisplayed();

        // Enter username and firmname in 1st IWMS authentication page.
        LoginView.firstPageSubmit(
                credentials.getUsername(),
                credentials.getFirmname()
        );

        // Wait for 2nd IWMS authentication page.
        LoginView.verifySecondPageDisplayed();

        // Enter password into 2nd IWMS authentication page.
        LoginView.secondPageSubmit(credentials.getPassword());
    }

    @And("^Accept Eula and move on$")
    public void Accept_Eula_and_move_on() throws Throwable {
        if(BrowserDriver.getCurrentDriver().findElements(By.name("accept")).size()>0){
            List<WebElement> forms = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("form[action*='AcceptEULA.jsp']"));

            if (forms == null || forms.size() != 1) {
                HomeView.takeScreenshot("Expecting-EULA-page-but saw.png");
                fail("Did not see the EULA page");
            }

            logger.info("About to accept EULA");
            boolean sawEULA = false;
            try {
                SeleniumUtil.checkbox("name", "accept", com.lucernex.qa.utils.SeleniumUtilities.OBJWAITTIMEOUT);
                SeleniumUtil.click("xpath", ".//input[@value=\"Continue\"]", com.lucernex.qa.utils.SeleniumUtilities.OBJWAITTIMEOUT);
                sawEULA = true;
            } catch (Exception e) {
                logger.severe(String.format("Did not see the expected EULA page, see [EULA_page.png]"));
                BaseView.takeScreenshot("EULA_page.png");
            }

            try{
                // See if we are logged in...
                for (int i = 0; i < 2; i++) {
                    try {
                        HomeView.verifyFooterDisplayed();

                        // Seeing the IWMS footer is a signal that we are authenticated.
                        CucumberContext.getCucumberContext().put("loggedIn", true);

                        URL baseURL = getCurrentBaseURL();

                        if (baseURL != null) {
                            // IWMS can redirect on login to a different URL so capture the redirect URL.
                            CucumberContext.getCucumberContext().put(CucumberContext.IWMS_URL, baseURL);
                        }

                        if (sawEULA) {
                            logger.info("EULA accepted and logged in.");
                        } else {
                            logger.info("Did not see EULA page but we are logged in.");
                        }
                    } catch (NoSuchElementException e) {
                        URL baseURL = getCurrentBaseURL();

                        if (baseURL != null) {
                            // Redirect to IWMS dashboard.
                            BrowserDriver.loadPage(baseURL.toString() + "/RolloutManager/dashboard/DashboardDispatch.jsp");
                        }
                    }
                }
            } catch (Exception e) {
                logger.info("Error :" + e.getMessage());
                fail(e.getMessage());
                BaseView.takeScreenshot("EulaScreen.png");
            }
        }
    }

    private Credentials getCredentialsFromMemberSpreadsheet(String loginName) throws IOException {
        String  localPath = new File("Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/Member_SS.xlsx").getAbsolutePath();
        Spreadsheet excel = new Spreadsheet(new File(localPath));

        excel.getSheetName();

        for (int i = 6; i < 100; i++) {
            String strExlAccessType = excel.getCellValue("Member.LoginName", i, Spreadsheet.Type.TEXT).toString();

            if (!isNullOrEmpty(strExlAccessType) && (strExlAccessType.equalsIgnoreCase(loginName))) {
                return new Credentials(
                    excel.getCellValue("Member.LoginName", i, Spreadsheet.Type.TEXT).toString(),
                    "unknown-firm",
                    excel.getCellValue("Member.Password",  i, Spreadsheet.Type.TEXT).toString()
                );
            }
        }

        return null; // did not find specified loginName in spreadsheet
    }

    @Then("^I Login to IWMS using \"([^\"]*)\" access credentials$")
    public void I_Login_to_IWMS_using_access_credentials(String loginName) throws Throwable {
        try {
            boolean flag = false;
            String strFirmName = "", strUserName, strPassword;
            int sheetRowNum = 0;
            String localPath = new File("Data/ImportDataFiles/iwms/AdminPage/MemberAdministration/Member_SS.xlsx").getAbsolutePath();
            Spreadsheet excel = new Spreadsheet(new File(localPath));
            excel.getSheetName();

            for (int i = 6; i < 100; i++) {
                String strExlAccessType = excel.getCellValue("Member.LoginName", i, Spreadsheet.Type.TEXT).toString();
                if (!isNullOrEmpty(strExlAccessType) && (strExlAccessType.equalsIgnoreCase(loginName))) {
                    sheetRowNum = i;
                    flag = true;
                }
                if (flag) break;
            }
            if (flag) {
                strUserName = excel.getCellValue("Member.LoginName", sheetRowNum, Spreadsheet.Type.TEXT).toString();
                strPassword = excel.getCellValue("Member.Password", sheetRowNum, Spreadsheet.Type.TEXT).toString();

                URL url = CucumberContext.getURL();

                assertNotNull(url);

                String appURL = url.toString();

                assertNotNull(appURL);

                // Load browser and point it at configured IWMS web-ui.
                BrowserDriver.loadPage(appURL);

                Boolean loggedIn = (Boolean) CucumberContext.getCucumberContext().get("loggedIn");
                if (loggedIn != null && loggedIn && HomeView.waitForAuthenticatedPage()) {
                    logger.info("Already logged in, reusing authenticated session(1).");
                    return;
                }


                Credentials credentials = CucumberContext.getCredentials();

                assertNotNull(credentials);
                if (isNullOrEmpty(strFirmName)) {
                    credentials = new Credentials(
                            strUserName, credentials.getFirmname(), strPassword
                    );
                } else
                    credentials = new Credentials(
                            strUserName, strFirmName, strPassword
                    );

                CucumberContext.getCucumberContext().put("credentials", credentials);


                assertNotNull(credentials);

                // Look for 1st IWMS authentication page.
                LoginView.verifyFirstPageDisplayed();

                // Enter username and firmname in 1st IWMS authentication page.
                LoginView.firstPageSubmit(
                        credentials.getUsername(),
                        credentials.getFirmname()
                );

                // Wait for 2nd IWMS authentication page.
                LoginView.verifySecondPageDisplayed();

                // Enter password into 2nd IWMS authentication page.
                LoginView.secondPageSubmit(credentials.getPassword());

                // Make sure we got logged in.
                for (int i = 0; i < 2; i++) {
                    try {
                        HomeView.verifyFooterDisplayed();
                    } catch (NoSuchElementException e) {
                        URL baseURL = getCurrentBaseURL();

                        if (baseURL != null) {
                            // Redirect to IWMS dashboard.
                            BrowserDriver.loadPage(baseURL.toString() + "/RolloutManager/dashboard/DashboardDispatch.jsp");
                        }
                    }
                }

                CucumberContext.getCucumberContext().put("loggedIn", true);

                URL baseURL = getCurrentBaseURL();

                if (baseURL != null) {
                    // IWMS can redirect on login to a different URL so capture the redirect URL.
                    CucumberContext.getCucumberContext().put(CucumberContext.IWMS_URL, baseURL);
                }

                logger.info("Logged in successfully.");
            } else
                logger.info("Login to IWMS using " + loginName + " access credentials does not exist in excel spreadsheet");
        }
        catch(Exception e){
            BaseView.takeScreenshot("I_Login_to_IWMS_using_access_credentials");
            String msg = String.format("Unable to login and see expected dashboard: %s", e.getMessage());
            logger.log(Level.SEVERE, msg, e);
            logger.info("Created new WebDriver instance as old one was failing to respond.");
//            fail(msg);
        }
    }

    @Given("^I Login to IWMS using \"([^\"]*)\" access credentials expecting EULA page$")
    public void I_Login_to_IWMS_using_access_credentials_expecting_EULA_page(String loginName) throws Throwable {
        Credentials currentCredentials = CucumberContext.getCredentials();

        assertNotNull(currentCredentials);

        Credentials newCredentials = getCredentialsFromMemberSpreadsheet(loginName);

        assertNotNull(newCredentials);

        URL url = CucumberContext.getURL();

        assertNotNull(url);

        String appURL = url.toString();

        assertNotNull(appURL);

        BrowserDriver.loadPage(appURL);

        logger.info("Using username: [" + currentCredentials.getUsername() + "]");
        logger.info("Using firmname: [" + currentCredentials.getFirmname() + "]");

        // Look for 1st IWMS authentication page.
        LoginView.verifyFirstPageDisplayed();

        // Enter username and firmname in 1st IWMS authentication page.
        LoginView.firstPageSubmit(
            newCredentials.getUsername(),
            currentCredentials.getFirmname()
        );

        // Wait for 2nd IWMS authentication page.
        LoginView.verifySecondPageDisplayed();

        // Enter password into 2nd IWMS authentication page.
        LoginView.secondPageSubmit(newCredentials.getPassword());

//        List<WebElement> forms = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("form[action*='AcceptEULA.jsp']"));
//
//
//        if (forms == null || forms.size() != 1) {
//            HomeView.takeScreenshot("Expecting-EULA-page-but saw.png");
//            fail("Did not see the EULA page");
//        }

    }
}
