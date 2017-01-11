package com.lucernex.qa.views.entity;

import com.google.common.collect.Lists;
import com.lucernex.qa.data.Entity.EntityType;
import com.lucernex.qa.pages.entity.GenericEntityPage;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.steps.iwms.GenericSteps;
import com.lucernex.qa.utils.CucumberContext;
import com.lucernex.qa.utils.Navigation;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.HomeView;
import com.lucernex.qa.views.components.ActionsView;
import com.lucernex.qa.views.components.LxModalWindow;
import com.lucernex.swagger.BusinessObjectClient;
import com.lucernex.swagger.domain.BusinessObject;
import com.lucernex.swagger.domain.BusinessObjectLink;
import com.lucernex.swagger.util.Credentials;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.http.client.utils.URIBuilder;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.net.URISyntaxException;
import java.net.URL;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Currency;
import java.util.List;
import java.util.Locale;
import java.util.logging.Logger;
import java.util.regex.Pattern;

import static com.lucernex.qa.utils.CucumberContext.getCucumberContext;
import static com.lucernex.qa.utils.ForceWaitForItem.delay;
import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertNotNull;
import static org.junit.Assert.fail;

/**
 * Created by salomem on 5/5/14.
 */
public class GenericEntityView extends BaseView {
    private static final Logger LOGGER = Logger.getLogger(GenericEntityView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    public static int lxID;

    private static final GenericEntityPage genEntityPage = PageFactory.initElements(BrowserDriver.getCurrentDriver(),
            GenericEntityPage.class);

    /**
     * Returns the label on the currently active entity tab.
     * @return the String label of the active entity tab.
     */
    public static String getActiveEntityTab() {
        LOGGER.info("Looking for the current entity tab...");
        return BrowserDriver.getTextFromElement(genEntityPage.activeEntityTab.findElement(By.tagName("a")));
    }

    /**
     * Clicks on the specified second level tab, if it exists.
     * @param tabName - the second level tab to click on
     */
    public static void clickSecondLevelTab(String tabName) {
        LOGGER.info("Clicking the 2nd level tab " + tabName + "...");
        BrowserDriver.clickElement(genEntityPage.secondLevelTabBar.findElement(By.partialLinkText(tabName)));
    }

    /**
     * Returns the label on the currently active second level tab.
     * @return the String label of the active second level tab.
     */
    public static String getActiveSecondLevelTab() {
        LOGGER.info("Looking for the current second level tab...");
        return BrowserDriver.getTextFromElement(genEntityPage.activeSecondLevelTab.findElement(By.tagName("a")));
    }

    /**
     * Clicks on the given third level tab, if it exists.
     * @param tabName - the third level tab's name.
     */
    public static void clickThirdLevelTab(String tabName) {
        LOGGER.info("Clicking the 3nd level tab " + tabName + "...");
        //  Get all third level tabs
        List<WebElement> allTabs = BrowserDriver.waitForElement(genEntityPage.subTabBar).findElements(By.tagName("li"));

        //  Find the expected tab
        for(WebElement myTab : allTabs) {
            if(myTab.getText().trim().equalsIgnoreCase(tabName)) {
                //  Click then return
                myTab.click();
                return;
            }
        }
        //  Did not find the expected third level tab
        fail(String.format("Did not find the third level tab '%s%'!", tabName) );
    }

    /**
     * Calls RESTful FIQL to get list of ProjectEntityID by ProjectName
     * @param entityType
     * @param projectName
     * @return List of Project Entity IDs
     * @throws Exception
     */
    protected static List<Integer> getProjectEntityIDs(EntityType entityType, String projectName) throws Exception {
        List<Integer> returnValue = Lists.newArrayList();

        URL baseURL = CucumberContext.getURL();
        assertNotNull(baseURL);

        Credentials credentials = CucumberContext.getCredentials();
        assertNotNull(credentials);

        BusinessObjectClient boClient = new BusinessObjectClient(baseURL.toString(), credentials);
        List<BusinessObject> entities = boClient.findByFIQL(
                entityType.name(),
                "ProjectName==" + projectName,
                "ProjectEntityID");

        assertNotNull("Entities cannot be null", entities);

        for(BusinessObject entity : entities) {
            if(entity != null && entity.getField("ProjectEntityID") != null
                              && entity.getField("ProjectEntityID").getValue() != null) {
                returnValue.add(NumberUtils.toInt(entity.getField("ProjectEntityID").getValue().toString()));
            } else {
                LOGGER.warning("Cannot get 'ProjectEntityID' from business object : " + entity);
            }
        }

        return returnValue;
    }


    public static void switchToEntityByName(EntityType entityType, String projectName) throws Throwable {
        SeleniumUtil.switchTodefaultContent();
        List<Integer> projectEntityIDs;
        projectEntityIDs = getProjectEntityIDs(entityType, projectName);
        for (int i=0;i<15;i++) {
            if (projectEntityIDs.size() > 0) {
                assertNotNull(String.format("Could not find PEIDs for %s type and %s name", entityType.name(), projectName), projectEntityIDs);
                assertEquals(String.format("Expectation failed for %s type and %s name", entityType.name(), projectName), 1, projectEntityIDs.size());
                switchToEntityByPEID(entityType, projectEntityIDs.get(0));
                return;
            } else {
                delay(5000);
                projectEntityIDs = getProjectEntityIDs(entityType, projectName);
            }
            assertNotNull(String.format("Could not find PEIDs for %s type and %s name", entityType.name(), projectName), projectEntityIDs);
            assertEquals(String.format("Expectation failed for %s type and %s name", entityType.name(), projectName), 1, projectEntityIDs.size());
        }
    }

    /**
     * Loads specific entity's summary page
     *
     * @param entityType
     * @param projectEntityID
     * @throws InterruptedException
     * @throws URISyntaxException
     */
    protected static void switchToEntityByPEID(EntityType entityType, Integer projectEntityID) throws Throwable {

        assertNotNull("PEID cannot be null", projectEntityID);
        LOGGER.info("Working with ProjectEntityID : " + projectEntityID);
        Navigation.navigateTo(entityType.name());
        delay(3000);
        String currentURL = BrowserDriver.getCurrentDriver().getCurrentUrl();
        LOGGER.info("Current URL : " + currentURL);

        URIBuilder uriBuilder = new URIBuilder(currentURL);
        uriBuilder.addParameter("projectEntityID", projectEntityID.toString());
        LOGGER.info("Modified URL : " + uriBuilder.build().toString());
        BrowserDriver.loadPage(uriBuilder.build().toString());
        HomeView.verifyFooterDisplayed();
    }

    /**
     * Deletes project entity such as 'Contract', 'Facility', etc.  by its name
     * @param entityType
     * @param projectName
     * @throws Exception
     */
    public static void deleteProjectEntityByName(EntityType entityType, String projectName) throws Throwable{

            List<Integer> projectEntityIDs = getProjectEntityIDs(entityType, projectName);

            if (CollectionUtils.isNotEmpty(projectEntityIDs)) {
                LOGGER.info(String.format("Found %s project entity IDs by %s name", projectEntityIDs.size(), projectName));
                for (Integer projectEntityID : projectEntityIDs) {

                    switchToEntityByPEID(entityType, projectEntityID);
                    ActionsView.verifyActionsDisplayed();

                    ActionsView.edit();

                    ActionsView.delete();

                    LxModalWindow.clickButton("Yes");

                    // Look for the optional modal window that appears when the entity
                    // being deleted has children and confirmation is needed when
                    // deleting them as well as the original entity.
                    if (LxModalWindow.isPresent()) {

                        LxModalWindow.waitForModalWindowFirmNote();

                        StringBuffer sb = new StringBuffer();
                        sb.append("Delete ");
                        sb.append(entityType.name());
                        sb.append(" \"");
                        sb.append(projectName);
                        sb.append("\" ");
                        sb.append("and all data");
                        LOGGER.info("Final delete button : " + sb.toString());

                        LxModalWindow.clickButton(sb.toString());
                    }
                }

                LOGGER.info(String.format("Deleted %d entities by name!", projectEntityIDs.size()));
            } else {
                LOGGER.info(String.format("No entities found to delete by name %s", projectName));
            }

    }

    /**
     * Returns the entity banner.
     * @return the String representing the entity banner.
     */
    public static String getEntityBanner() {
        LOGGER.info("Looking for the entity banner");
        return genEntityPage.currentEntityBanner.getText();
    }

    public static boolean checkEntityBanner(String entityName) throws Throwable{
        LOGGER.info("Looking for the entity banner");
        return SeleniumUtil.waitForElementContainText(genEntityPage.currentEntityBanner,entityName);
    }

    public static String convertToFormatPattern(String strField) throws Exception {
        if(isValidDate(strField)){
            strField = SeleniumUtil.getDateFormat( strField );
        }else if(isValidStringNumberPattern(strField)){
            strField = displayCurrency( strField );
        }
        return strField;
    }

    public static boolean isValidDate(String inDate) {
        if(inDate.length()==10) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
            dateFormat.setLenient(false);
            try {
                dateFormat.parse(inDate.trim());
            } catch (ParseException pe) {
                return false;
            }
            return true;
        }
        else
            return false;
    }

    public static boolean isValidStringNumberPattern( String FieldValue )
    {
        Pattern PATTERN = Pattern.compile("^(-?0|-?[1-9]\\d*)(\\.\\d+)?(E\\d+)?$");
        if(PATTERN.matcher( FieldValue ).matches()){
            return true;
        }else if((FieldValue.startsWith("$") || FieldValue.endsWith("%"))){
            return true;
        }
        else
            return false;
    }

    static public String displayCurrency( String strField ) {

        if("1.234.567,89".equals(getCucumberContext().SESSION_NUMBER_FORMAT)) {
            if(strField.contains("0.00000")){
                strField=strField.replace(".",",");
            }
            else {
                String strCur = "", strPerc = "";
                if (strField.startsWith("$")) {
                    strField = strField.replace("$", "");
                    strCur = "$";
                }
                if (strField.endsWith("%")) {
                    strField = strField.replace("%", "");
                    strPerc = "%";
                }
                strField=strField.trim().replace(",", "");
                Locale currentLocale = Locale.FRANCE;
                Double currencyAmount = new Double(strField);
                Currency currentCurrency = Currency.getInstance(currentLocale);
                NumberFormat currencyFormatter =  NumberFormat.getCurrencyInstance(currentLocale);
                strField = strCur + currencyFormatter.format(currencyAmount).replace(" €", "").replace(" ",".") + strPerc;
                System.out.println(strField);
            }
        }
        return strField;
    }

    public static void getLxID(String strName,String strType) throws Exception {
        URL baseURL = CucumberContext.getURL();
        assertNotNull(baseURL);

        Credentials credentials = CucumberContext.getCredentials();
        assertNotNull(credentials);
        BusinessObjectClient boClient = new BusinessObjectClient(baseURL.toString(), credentials);
        List<BusinessObjectLink> entities = boClient.findBusinessObjectLinksByType(strType, "lxid,name,objecttype");
        assertNotNull("Lx id cannot be null", entities);

        for(BusinessObjectLink entity : entities) {
            if(entity.getName().equalsIgnoreCase(strName)){
                GenericSteps.lxRecID= Integer.toString(entity.getLxID());
            }
        }
    }
}
