package com.lucernex.qa.views.setupwizards;

import com.lucernex.qa.browsers.BrowserDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;
import com.lucernex.qa.pages.setupwizards.setupwizardsHomePage;

import java.util.List;
import java.util.logging.Logger;

/**
 * Created by ToanD on 4/2/2014.
 */
public class setupwizardHomePageView {

    private static final Logger logger = Logger.getLogger(setupwizardHomePageView.class.getName());

    private static final setupwizardsHomePage wizardsHomePage = PageFactory.initElements(BrowserDriver.getCurrentDriver(), setupwizardsHomePage.class);


    private static void clickDropdownName(String dropdownName,By byclass) throws Exception {

        List<WebElement> options = BrowserDriver.getCurrentDriver().findElements(byclass);//("x-combo-list-item" or "search-item"
        for (WebElement option : options) {
            if (option.getText().contains(dropdownName)) {
                option.click();
                break;
            }
        }
    }

    public static void clickToolsButton() {
        logger.info("Clicking top menu Tools button... ");
        wizardsHomePage.clickToolsButton.click();
    }

    public static void choosePortfolio (String portfolioName) {
        logger.info("Choosing Portfolio: " + portfolioName);
        wizardsHomePage.portfolioSelect.sendKeys(portfolioName);
    }


    public static void selectSetupWizards() {
        logger.info("Clicking top menu Tools button... ");
        BrowserDriver.clickElement(wizardsHomePage.clickSetupwizards);
    }


    public static void selectSetupWizardsContract() {
        logger.info("Clicking top menu Tools button... ");
        BrowserDriver.clickElement(wizardsHomePage.setupwizardsSelectContract);
    }

    public static void selectSetupWizardsProject() {
        logger.info("Clicking top menu Tools button... ");
        BrowserDriver.clickElement(wizardsHomePage.setupwizardsSelectProject);
    }

    public static void selectSetupWizardsFacility() {
        logger.info("Clicking top menu Tools button... ");
        BrowserDriver.clickElement(wizardsHomePage.setupwizardsSelectFacility);
    }

    public static void selectSetupWizardsLocation() {
        logger.info("Clicking top menu Tools button... ");
        BrowserDriver.clickElement(wizardsHomePage.setupwizardsSelectLocation);
    }

    public static void selectSetupWizardsSite() {
        logger.info("Clicking top menu Tools button... ");
        BrowserDriver.clickElement(wizardsHomePage.setupwizardsSelectSite);
    }

    public static void clickSetupWizardsNextButton() {
        logger.info("Clicking setup wizard Next button... ");
        wizardsHomePage.setupwizardsClickNextButton.click();
    }

    //Start - Setup Wizards - Second page - Site Entity fields
    public static void enterSiteName(String siteName) {
        logger.info("Entering Site name... ");
        wizardsHomePage.enterSiteName.sendKeys(siteName);
    }

    public static void selectRegionSubRegion(String regionName) throws Exception {
        logger.info("Selecting Region SubRegion name... ");
        wizardsHomePage.clickRegionSubRegion.click();
        clickDropdownName(regionName,By.className("search-item"));
     }
    public static void selectMarketDMA(String marketDMA) throws Exception {
        wizardsHomePage.clickMarketDMA.click();
        clickDropdownName(marketDMA,By.className("x-combo-list-item"));
    }
    public static void selectCountry(String countryName)  throws Exception {
        wizardsHomePage.clickCountry.click();
        clickDropdownName(countryName,By.className("x-combo-list-item"));
    }

    public static void selectState(String nameState)  throws Exception {
        wizardsHomePage.clickState.sendKeys(nameState);
      //  clickDropdownName(nameState,By.className("x-combo-list-item"));
    }
    public static void selectProjectType(String projectType ) {
        wizardsHomePage.selectProjectType.sendKeys(projectType);
    }
    public static void selectProtoType(String nameProtoType )  throws Exception {
        wizardsHomePage.clickProtoType.click();
        clickDropdownName(nameProtoType,By.className("x-combo-list-item"));
    }

    public static void enterCrossStreet1 (String crossstreet1 ) {
        wizardsHomePage.enterCrossStreet1.sendKeys(crossstreet1);
    }
    public static void enterCrossStreet2 (String crossstreet2 ) {
        wizardsHomePage.enterCrossStreet2.sendKeys(crossstreet2);
    }
    public static void enterStreetAddress1 (String streetAddress1 ) {
        wizardsHomePage.enterStreetAddress1.sendKeys(streetAddress1);
    }
    public static void enterStreetAddress2 (String  streetAddress2) {
        wizardsHomePage.enterStreetAddress2.sendKeys(streetAddress2);
    }
    public static void enterCity (String  cityName) {
        wizardsHomePage.enterCity.sendKeys(cityName);
    }
    public static void enterPostalCode (String postalCode ) {
        wizardsHomePage.enterPostalCode.sendKeys(postalCode);
    }




}
