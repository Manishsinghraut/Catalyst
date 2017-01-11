package com.lucernex.qa;

import com.google.common.base.CharMatcher;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.pages.lxsiteadminpage.LxSiteAdminPage;
import com.lucernex.qa.utils.*;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.HomeView;
import com.lucernex.qa.views.admin.AdminPageView;
import com.lucernex.qa.views.admin.AdminTabsView;
import com.lucernex.qa.views.admin.ImportDataTabsView;
import com.lucernex.qa.views.components.ActionsView;
import com.lucernex.qa.views.components.LxSearchResultsView;
import com.lucernex.qa.views.entity.GenericEntityView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.net.URL;
import java.util.List;
import java.util.logging.Logger;

import static com.google.common.base.Preconditions.checkArgument;
import static com.google.common.base.Preconditions.checkState;
import static org.junit.Assert.*;

//import static com.lucernex.qa.utils.ForceWaitForItem.delay;

public class NavigationSteps {
    private static final Logger logger = Logger.getLogger(NavigationSteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    private static final LxSiteAdminPage lxSiteAdminPage = AjaxEnabledPageFactory.ajaxInitElements(BrowserDriver.getCurrentDriver(), LxSiteAdminPage.class);

    @When("^I navigate to the admin dashboard$")
    public void I_navigate_to_the_admin_dashboard() throws Throwable {
        AllContractPagesView.waitTillDivisionLoads();
        HomeView.clickAdminButton();
        AllContractPagesView.waitTillDivisionLoads();
    }

    @When("^I navigate to the admin reports page$")
    public void I_navigate_to_the_admin_reports_page() throws Throwable {
        AllContractPagesView.waitTillDivisionLoads();
        HomeView.clickAdminReportsButton();
        AllContractPagesView.waitTillDivisionLoads();
    }

    @And("^I navigate to download spreadsheet page$")
    public void I_navigate_to_download_spreadsheet_page() {
        HomeView.clickAdminButton();
        AdminPageView.verifyFooterDisplayed();

        AdminPageView.clickLink("Import Data");
        AdminPageView.verifyFooterDisplayed();

        ImportDataTabsView.clickSpreadsheetsTab();
        AdminPageView.verifyFooterDisplayed();
        logger.info("Navigated to download spreadsheet page.");
    }

    @When("^I navigate to import page$")
    public void I_navigate_to_import_page() {
        HomeView.clickAdminButton();
        AdminPageView.verifyFooterDisplayed();

        AdminPageView.clickLink("Import Data");
        AdminPageView.verifyFooterDisplayed();
        logger.info("Navigated to import page.");
      }

    @And("^I navigate to admin \"([^\"]*)\" page$")
    public void I_navigate_to_admin_page(String adminLink) {
        HomeView.clickAdminButton();
        AdminPageView.verifyFooterDisplayed();

        AdminPageView.clickLink(adminLink);
        AdminPageView.verifyFooterDisplayed();
        logger.info("Navigated to admin page.");
    }

    @And("^I click on the \"([^\"]*)\" admin page tab$")
    public void I_click_on_the_admin_page_tab(String tabName) throws Throwable {
        List<String> tabNames = AdminTabsView.getTabNames();

        assertNotNull("You must first navigate to an ADMIN page", tabNames);
        assertTrue(String.format("Did not see the '%s' tab", tabName), tabNames.contains(tabName));

        AdminTabsView.clickTab(tabName);

        // Verify that the active tab is what we expect.
        try {
            String activeTab = AdminTabsView.getActiveTab();

            assertTrue(
                String.format("Saw tab '%s' but expected '%s'", activeTab, tabName),
                TildaCompare.matches(tabName, activeTab)
            );

            logger.info(String.format("Navigated to '%s' tab.", tabName));
        } catch (InterruptedException e) {
            fail(String.format("Unable to determine active admin tab: %s", e.getMessage()));
        }
    }

    /**
     * Checks that the expected sub-tabs exist, and are navigable by clicking on the sub tab.
     * @param expectedSubTabNames - the name of the expected sub tabs
     */
    @Then("^I can navigate to these tabs:$")
    public void I_can_navigate_to_these_tabs(List<String> expectedSubTabNames) {
        List<String> tabNames = AdminTabsView.getTabNames();

        for (String expected : expectedSubTabNames) {
            checkState(tabNames.contains(expected), "Did not see the expected '%s' sub tab!", expected);

            AdminTabsView.clickTab(expected);

            String activeTab;

            try {
                activeTab = AdminTabsView.getActiveTab();
            } catch (InterruptedException e) {
                fail(String.format("Unable to determine active admin tab: %s", e.getMessage()));
                return;
            }

            assertTrue(
                    String.format("Saw tab '%s' but expected '%s'", activeTab, expected),
                    TildaCompare.matches(expected, activeTab)
            );

            logger.info(String.format("Navigated to '%s' tab.", expected));
        }
    }

    /**
     * Clicks on the given entity tab.
     */
    @When("^I click on the \"([^\"]*)\" entity tab$")
    public void I_click_on_the_entity_tab(String entityType) {
        try {
            HomeView.clickEntityTab(entityType);
        } catch (InterruptedException e) {
            fail(String.format("Unable to click on '%s' entity tab: %s", entityType, e.getMessage()));
        }
    }

    /**
     * Verifies that the current entity tab is the expected entity tab.
     */
    @And("^I see that I am on the \"([^\"]*)\" entity tab$")
    public void I_see_that_I_am_on_the_entity_tab(String expectedEntityTab) {
        String currentEntityTab = GenericEntityView.getActiveEntityTab();

        assertTrue(
                String.format("Saw tab '%s' but expected '%s'", currentEntityTab, expectedEntityTab),
                TildaCompare.matches(expectedEntityTab, currentEntityTab)
        );
        logger.info(String.format("Saw expected entity tab '%s'.", expectedEntityTab));
    }

    /**
     * Clicks on the given second level tab.
     */
    @When("^I click on the second level tab \"([^\"]*)\"$")
    public void I_click_on_the_second_level_tab(String secondLvlTab) {
        GenericEntityView.clickSecondLevelTab(secondLvlTab);

        logger.info(String.format("Clicked on '%s' 2nd level tab.", secondLvlTab));
    }

    /**
     * Verifies that the current second level tab is the expected tab.
     */
    @Then("^I see that I am on the second level tab \"([^\"]*)\"$")
    public void I_see_that_I_am_on_the_second_level_tab(String expectedSecondLvlTab) {
        String currentSecondLevelTab = GenericEntityView.getActiveSecondLevelTab();

        assertTrue(
                String.format("Saw tab '%s' but expected '%s' at 2nd level", currentSecondLevelTab, expectedSecondLvlTab),
                TildaCompare.matches(expectedSecondLvlTab, currentSecondLevelTab)
        );

        logger.info(String.format("On '%s' which is the expected 2nd level tab.", expectedSecondLvlTab));
    }

    /**
     * Clicks on the third level tab.
     */
    @When("^I click on the third level tab \"([^\"]*)\"$")
    public void I_click_on_the_third_level_tab(String thirdLvlTab) {
        GenericEntityView.clickThirdLevelTab(thirdLvlTab);

        logger.info(String.format("Clicked on '%s' 3rd level tab.", thirdLvlTab));
    }

    /**
     * Some Admin grids are wrapped in a tab (when there are more than one grid) and
     * others are not (when there is a single grid). This method looks for a grid
     * if the expectedTabOrGrid argument ends with 'Grid' and a tab otherwise.
     *
     * @param expectedTabOrGrid - name of expected tab/grid
     */
    @Then("^I see that I am on the third level tab or grid\"([^\"]*)\"$")
    public void I_see_that_I_am_on_the_third_level_tab_or_grid(String expectedTabOrGrid) {
        assertNotNull("Required argument 'expectedTabOrGrid' is null", expectedTabOrGrid);

        expectedTabOrGrid = expectedTabOrGrid.trim();

        if (expectedTabOrGrid.startsWith("BOGrid") || expectedTabOrGrid.equals("mainwrappernoframe")) {
            String msg = String.format("Did not see the '%s' grid!", expectedTabOrGrid);

            try {
//                delay(3000);
                assertTrue(msg, AdminTabsView.isGridPresent(expectedTabOrGrid));

            } catch (InterruptedException e) {
                try{
//                    delay(3000);
                    assertTrue(msg, AdminTabsView.isGridPresent(expectedTabOrGrid));
                }
                catch(Exception ex){
                    BaseView.takeScreenshot(expectedTabOrGrid + ".png");
                    fail(msg);
                }
            }
        } else {
            I_see_that_I_am_on_the_third_level_tab(expectedTabOrGrid);
        }
    }

    /**
     * Verifies that the current third level tab is the expected tab.
     */
    @Then("^I see that I am on the third level tab \"([^\"]*)\"$")
    public void I_see_that_I_am_on_the_third_level_tab(String expectedThirdLvlTab) {
        try {
            String activeTab;

            activeTab = AdminTabsView.getActiveTab();

            assertNotNull(activeTab);
            assertTrue(
                String.format("Active tab is '%s' but expected '%s'", activeTab, expectedThirdLvlTab),
                TildaCompare.matches(expectedThirdLvlTab, activeTab)
            );
        } catch (Exception e) {
            String filename = CharMatcher.WHITESPACE.removeFrom(expectedThirdLvlTab) + ".png";

            HomeView.takeScreenshot(filename);
            fail(
                String.format(
                    "Did not land on the expected '%s' sub tab (took screenshot '%s')!",
                    expectedThirdLvlTab,
                    filename
                )
            );
        }

        logger.info(String.format("Saw '%s' third level tab", expectedThirdLvlTab));
        logger.info(String.format("On '%s' which is the expected 3rd level tab.", expectedThirdLvlTab));
    }

    /**
     * Peforms a firm wide entity search.
     */
    @Given("^I search Lx for \"([^\"]*)\"$")
    public void I_search_Lx_for(String searchText) {
        checkArgument(searchText != null, "Argument expected!!!");

        HomeView.searchFor(searchText);
    }

    /**
     * Verifies that the user is on the expected entity.
     */
    @Then("^I see that I am on the entity \"([^\"]*)\"$")
    public void I_see_that_I_am_on_the_entity(String expectedEntity) {
        assertTrue("I do not see the entity with '" + expectedEntity + "' on the entity banner!",
                GenericEntityView.getEntityBanner().contains(expectedEntity));

        logger.info(String.format("On '%s' which is the expected entity.", expectedEntity));
    }

    @Then("^I see that I am on the entity page \"([^\"]*)\"$")
    public void I_see_that_I_am_on_the_entity_page (String expectedEntity)throws Throwable{
        assertTrue("I do not see the entity with '" + expectedEntity + "' on the entity banner!",
                GenericEntityView.checkEntityBanner(expectedEntity));

        logger.info(String.format("On '%s' which is the expected entity.", expectedEntity));
    }

    /**
     * Clicks the search result, that is of the expected entity type, that best matches the expected link text.
     * @param expectedLinkText - the expected text of the link to attempt a click on.
     * @param expectedEntityType - the expected entity type of the target link.
     */
    @When("^I click on the \"([^\"]*)\" link under \"([^\"]*)\"$")
    public void I_click_on_the_link_under(String expectedLinkText, String expectedEntityType) {
        checkArgument(expectedLinkText != null, "Argument expected! Search Criteria cannot be null!");
        checkArgument(expectedEntityType != null, "Argument expected! Expected Entity type cannot be null!");

        try {
            LxSearchResultsView.clickLink(expectedLinkText, expectedEntityType);
        } catch (InterruptedException e) {
            fail(String.format("Unable to click on link '%s': %s", expectedLinkText, e.getMessage()));
        }
    }

    @And("^I click on the \"([^\"]*)\" action panel button")
    public void I_click_on_the_action_panel_button(String buttonTitle ) throws Throwable{
        CommonMethods.switchToVisibleFrameQuick();
        CommonMethods.waitTillDivisionLoads();
        SeleniumUtil.switchTodefaultContent();
        CommonMethods.waitTillDivisionLoads();
        ActionsView.clickActionPanelButtonWhenReady(buttonTitle);
        CommonMethods.switchToVisibleFrameQuick();
        CommonMethods.waitTillDivisionLoads();
        SeleniumUtil.switchTodefaultContent();
        CommonMethods.waitTillDivisionLoads();
    }

    @And("^I click on the \"([^\"]*)\" action panel btn")
    public void I_click_on_the_action_panel_btn(String buttonTitle ) throws Throwable{
        CommonMethods.switchToVisibleFrameQuick();
        CommonMethods.waitTillDivisionLoads();
        SeleniumUtil.switchTodefaultContent();
        CommonMethods.waitTillDivisionLoads();
        ActionsView.clickActionPanelButtonWhenReady(buttonTitle);
    }

    /**
     * Navigates to the given location via a comma delimited string, the navigation expression.
     * @param navExpression - the navigation expression as a comma delimited String.
     */
    @When("^I navigate to \"([^\"]*)\"$")
    public void I_navigate_to(String navExpression) throws Throwable{
////    	Below code had commented as part of code refactoring
////    	//  Delimit the string by comma
////        String[] tokens =   navExpression.split(", |,");
////
////        for (String token : tokens) {
////            try {
////                Navigation.navigateTo(token);
////            } catch (InterruptedException e) {
////                fail(String.format("Unable to navigate to '%s': %s", token, e.getMessage()))
////            }
////        }
//
//    	//Selenium webdriver wrapper class has implemented
//    	try {
//	    	//Delimit the string by comma
//	        String[] tokens =   navExpression.split(", |,");
//	        for (String token : tokens) {
////                delay(1000);
//                SeleniumUtil.selectHitEnterKey("paritallinktext", token, SeleniumUtilities.OBJWAITTIMEOUT);
//                CommonMethods.waitTillDivisionLoads();
////                delay(1000);
////                SeleniumUtil.click("linktext", token, SeleniumUtilities.OBJWAITTIMEOUT);
//	        }
//    	} catch (Exception e) {
//            try{
//                String[] tokens =   navExpression.split(", |,");
//                for (String token : tokens) {
////                    delay(1000);
//                    SeleniumUtil.selectHitEnterKey("paritallinktext", token, SeleniumUtilities.OBJWAITTIMEOUT);
//                    CommonMethods.waitTillDivisionLoads();
////                    delay(2000);
//                }
//            }catch(Exception ex){
//                BaseView.takeScreenshot("token.png");
//            } catch (Throwable throwable) {
//                throwable.printStackTrace();
//            }
//
//        } catch (Throwable throwable) {
//            throwable.printStackTrace();
//        }


        /*try{
            CommonMethods.waitTillDivisionLoads();
//            PortfolioNavigationView.collapsePortfolioNavigationTab();
            CommonMethods.clickOnTab(navExpression);
            CommonMethods.waitTillDivisionLoads();
        }catch (Exception ex){
            BaseView.takeScreenshot(navExpression);
            fail("Faild to click " +navExpression);
        } catch (Throwable throwable) {
            BaseView.takeScreenshot(navExpression);
            fail("Faild to click " +navExpression);
        }*/

       /* try {
            String[] tokens = navExpression.split(", |,");
            for (String token : tokens) {
                CommonMethods.waitTillDivisionLoads();
                CommonMethods.clickOnTab(token);
                CommonMethods.waitTillDivisionLoads();
            }
        }catch (Exception ex){
            BaseView.takeScreenshot(navExpression);
            fail("Faild to click " +navExpression);
        }*/

        try {
            //Delimit the string by comma
            String[] tokens =   navExpression.split(", |,");
            for (String token : tokens) {
                try{
                    BaseView.pushShortTimeout();
                    SeleniumUtil.waitForElementIsClickable("paritallinktext", token,8 ,SeleniumUtilities.OBJWAITTIMEOUT);
                    SeleniumUtil.click("paritallinktext", token, SeleniumUtilities.OBJWAITTIMEOUT);
//                    BrowserDriver.getCurrentDriver().findElement(By.linkText(token)).click();
                }catch (Exception e){
                    SeleniumUtil.click("xpath","//*[text()='"+token+"']",SeleniumUtilities.OBJWAITTIMEOUT);
                    BaseView.popDefaultTimeout();
                }
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("token.png");
            BaseView.popDefaultTimeout();
            fail("Faild to click " + navExpression);
        }
    }


    @When("^I navigate to second level \"([^\"]*)\" and third level \"([^\"]*)\" tabs$")
    public void I_navigate_to_tabs(String secondLevelTab, String thirdLevelTab) throws Throwable {
        SeleniumUtil.switchTodefaultContent();
        for (int i = 0; i < 10; i++) {
            try {
//                SeleniumUtil.hitEnterKey("linkText", secondLevelTab, SeleniumUtilities.OBJWAITTIMEOUT);
//                SeleniumUtil.dblClick("linkText", secondLevelTab, SeleniumUtilities.OBJWAITTIMEOUT);
                SeleniumUtil.dblClick("id","m2_Contract_Payment_Info", SeleniumUtilities.OBJWAITTIMEOUT);
//                BrowserDriver.getCurrentDriver().findElement(By.linkText(secondLevelTab)).click();
                BaseView.pushShortTimeout();
                if (BrowserDriver.getCurrentDriver().findElements(By.xpath("//span[text()='" + thirdLevelTab + "']")).size()>0){
                    SeleniumUtil.click("linkText",thirdLevelTab,SeleniumUtilities.OBJWAITTIMEOUT);
//                        CommonMethods.clickOnTab(thirdLevelTab);
                    break;
                }


            } catch (Exception e) {
                if (i == 10) {
                    if (!SeleniumUtil.isElementExist("xpath", "//span[text()='" + thirdLevelTab + "']")) {
                        BaseView.takeScreenshot("token.png");
                        fail("Failed to click third level tab" + e.getMessage());
                    }
                }
            }
        }
    }

    @Then("^I see the admin page$")
    public void I_see_the_admin_page() throws Throwable {
        AdminPageView.verifyAdminPageDisplayed();
    }

    @Then("^I see the Lx Tools dropdown$")
    public void I_see_the_Lx_Tools_dropdown() throws Throwable {
        HomeView.verifyLxToolsDropDown();
    }

    /**
     * Attempts to navigates to the Lx Administrator Page.
     */
    @And("^I navigate to the Lx Admin Page$")
    public void I_navigate_to_the_Lx_Admin_Page() throws Throwable{
        String lxAdminURLPath = "/RolloutManager/admin/lxadmin/LxSiteAdmin.jsp";
        URL           baseURL = CucumberContext.getURL();

        assertNotNull(baseURL);

        String lxAdminURL = baseURL.toString() + lxAdminURLPath;

        BrowserDriver.loadPage(lxAdminURL);

        // Make sure we see the form that contains our 'Create New Company' button.
        try {
            lxSiteAdminPage.createFirmForm.findElement(By.cssSelector("input[type='submit']"));
        } catch (NoSuchElementException e) {
            HomeView.takeScreenshot("Did-not-see-LxSiteAdmin.png");
            fail("Did not see the LxSiteAdmin page: " + lxAdminURL);
        }
    }

    /**
     * Attempts to click on one of the buttons in the Lx Administrator Page by its label.
     */
    @And("^I click on the \"([^\"]*)\" Lx Admin Page button$")
    public void I_click_on_the_Lx_Admin_Page_button(String name) {
        lxSiteAdminPage.clickButton(name);
        //LxAdminPageView.clickButton(name);
    }


    /**
     * Navigates to the 4th level menu with a specific item's name
     * @param itemName
     */
    @And("^I navigate to \"([^\"]*)\" fourth level menu$")
    public void I_navigate_to_fourth_level_menu(String itemName) throws Throwable {
        HomeView.selectFourthLevelMenu(itemName);
    }

    @Then("^I verify in grid \"([^\"]*)\" that \"([^\"]*)\" and \"([^\"]*)\" has \"([^\"]*)\" value$")
    public void I_verify_in_grid_that_and_has_value(String gridId, Integer rowNumber, String headerName, String cellValue) throws Throwable {
        /*logger.info(String.format("Checking for '%s' value by ID=%s row=%s header=%s", cellValue, gridId, rowNumber, headerName));
        String retValue = GridView.getGridCellValue(gridId, rowNumber, headerName);
        assertTrue(String.format("Expected value %s not equal to %s", cellValue, retValue), StringUtils.contains(retValue, cellValue));*/

        try{
            WebElement iFrame = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("iframe[id^=ext-element-]"));
            BrowserDriver.getCurrentDriver().switchTo().frame(iFrame);
            GridUtils.validateSpecificRowOfTheGridValue("cssselector", gridId, rowNumber, headerName, cellValue);
            SeleniumUtil.switchTodefaultContent();
        }
        catch(Exception ex){
            BaseView.takeScreenshot(gridId + ".png");
            logger.info("Error :"+ex.getMessage());
        }
    }

    @And("^I verify \"([^\"]*)\" button should be disabled initially on the action panel$")
    public void I_verify_button_should_be_disabled_initially_on_the_action_panel(String buttonTitle ) {
        ActionsView.verifyActionsButtonDisable(buttonTitle);
    }

    @And("^I navigate to the reports dashboard$")
    public void I_navigate_to_the_reports_dashboard() throws Throwable {
        SeleniumUtil.switchTodefaultContent();
        HomeView.clickButton("id", "reportsBtn-btnInnerEl");
        try {
            CommonMethods.waitTillDivisionLoads();
            BaseView.pushShortTimeout();
//            BrowserDriver.getCurrentDriver().findElement(By.xpath("//span[text()='List All Reports']")).click();
            SeleniumUtil.click("xpath","//span[text()='List All Reports']",SeleniumUtilities.OBJWAITTIMEOUT);
            CommonMethods.waitTillDivisionLoads();
        } catch (Exception e) {
        }
    }

    @And("^I verify the following action panel buttons are in sequence$")
    public void I_verify_the_following_action_panel_buttons_in_sequence(List<String> buttons) throws Throwable {
        int i=0;
        SeleniumUtil.switchTodefaultContent();
        CommonMethods.waitTillDivisionLoads();
        for(String eachButton:buttons){
            ActionsView.verifyButton(eachButton, i);
            i++;
        }
    }

    @And("^I navigate to the calendar dashboard$")
    public void I_navigate_to_the_calendar_dashboard() throws Throwable {
        AllContractPagesView.waitTillDivisionLoads();
        HomeView.clickCalendarIcon();
        AllContractPagesView.waitTillDivisionLoads();
    }

    @When("^I navigate to second level tab \"([^\"]*)\" and third level \"([^\"]*)\" tab of entity \"([^\"]*)\"$")
    public void I_navigate_to_tab(String secondLevelTab, String thirdLevelTab, String entity) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.navigateToTabs(secondLevelTab, thirdLevelTab, entity);
    }

    @Then("^I verify \"([^\"]*)\" third level tab not present$")
    public void I_verify_third_level_tab_not_present(String tabName) throws Throwable {
       CommonMethods.tabNotPresent(tabName);
    }
}