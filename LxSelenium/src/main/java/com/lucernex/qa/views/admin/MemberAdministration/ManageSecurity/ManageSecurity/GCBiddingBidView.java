package com.lucernex.qa.views.admin.MemberAdministration.ManageSecurity.ManageSecurity;

import com.lucernex.qa.FileUtilities;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.data.SecurityAccessFields;
import com.lucernex.qa.utils.FileDownloader;
import com.lucernex.qa.utils.FileUpload;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import junit.framework.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.io.File;
import java.util.List;
import java.util.logging.Logger;

import static junit.framework.TestCase.fail;
import static org.junit.Assert.assertTrue;

/**
 * Created by RLE0097 on 11/10/2015.
 */
public class GCBiddingBidView {

    private static final Logger logger = Logger.getLogger(GCBiddingBidView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    public static void securityAccess(String strUserRole,List<SecurityAccessFields> fields){
        try {
            String strTab="";
            SeleniumUtil.select("name","UserClass",strUserRole, SeleniumUtilities.OBJWAITTIMEOUT);
            for(SecurityAccessFields f: fields) {

                if(f.getAccessTab().length()>0) {
                    if(SeleniumUtil.getClickableWebElementObject("xpath","//span[./text()='" + f.getAccessTab() + "']").isEnabled())
                        SeleniumUtil.click("xpath", "//span[./text()='" + f.getAccessTab() + "']", SeleniumUtilities.OBJWAITTIMEOUT);
                    strTab=f.getAccessTab();
                    SeleniumUtil.getClickableWebElementObject("xpath", "//span[./text()='" + f.getAccessTab() + "']");
                }

                if(f.getFolder().length()>0) {
                    List<WebElement> foldersEles = SeleniumUtil.getWebDriver().findElements(By.xpath("//span[contains(text(),'" + f.getFolder() + "')]//parent::td[1]/preceding-sibling::td[1]/a/img[contains(@src,'plus.gif')]"));
                    for (WebElement foldersEle : foldersEles) {
                        if ((foldersEle.isDisplayed()) && (f.getFolder().trim().length() > 0)) {
                            foldersEle.click();

                            if ((f.getSubfolder().trim().length() == 0) && f.getAccessstatus().trim().length() != 0) {
                                String row = foldersEle.getAttribute("id").replace("img_", "Lx");
                                String getAccessStatus = SeleniumUtil.getWebDriver().findElement(By.xpath(".//*[@id='" + row + "']/td/input[@value='" + f.getAccessstatus().trim().replace(" ", "").trim() + "']")).getAttribute("checked");
                                assertTrue(getAccessStatus.equalsIgnoreCase("true"));
                                break;
                            }
                            break;
                        }
                    }
                }

                if ((f.getSubfolder().trim().length() > 0) && f.getAccessstatus().trim().replace(" ", "").trim().length()>0) {
                    String getAccessStatus = SeleniumUtil.getWebDriver().findElement(By.xpath("//span[contains(text(),'" + f.getSubfolder() + "')]//parent::td[1]/preceding-sibling::td[1]/following-sibling::td/input[@value='" + f.getAccessstatus().trim().replace(" ", "").trim() + "']")).getAttribute("checked");
                    assertTrue(getAccessStatus.equalsIgnoreCase("true"));
                }
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("ExpandTreeError.png");
            logger.info("Error :" + e.getMessage());
            Assert.fail(e.getMessage());
        }
    }

    public static void verifyLockStatus(String strName) throws Throwable {
        try{
            String getLockStatus = SeleniumUtil.getWebDriver().findElement(By.xpath(".//td[contains(text(),'" + strName + "')]/following-sibling::td/input[@name='_checkbox_IsBudgetColumnLocked']")).getAttribute("disabled");
            assertTrue("I verify the "+strName+" Lock status",getLockStatus.equalsIgnoreCase("true"));
        }
        catch(Exception e){
            BaseView.takeScreenshot("I_verify_the_Lock_status.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    public static void verifySelectedStatus(String strName, String strSelectedStatus) throws Throwable {
        try {
            String getSelectedStatus = SeleniumUtil.getWebDriver().findElement(By.xpath("//div[contains(text(),'" + strName + "')]/parent::td/following-sibling::td[1]/div")).getText();
            assertTrue("I verify the " + strName + " selected status " + strSelectedStatus, getSelectedStatus.equalsIgnoreCase(strSelectedStatus));
        } catch (Exception e) {
            BaseView.takeScreenshot("I_verify_the_selected_status.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    public static void assignBudgetTemplate(){
        try{
            SeleniumUtil.click("cssselector", "input[value='Assign Budget Template']", SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception e){
            BaseView.takeScreenshot("I_click_on_Assign_Budget_Template.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    public static void VerifyBidInvitationEmailSubject(String strThreeDot, String strName, String strEmailSubject, String strFieldLabel, String strLxScriptName){
        try {
            SeleniumUtil.click("xpath", ".//input[@value='" + strName + "']/parent::div/parent::el/div/a/img[@alt='Edit Options']", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("cssselector", "input[name='json.EmailSubject']", strEmailSubject, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("cssselector", "input[value='" + strFieldLabel + "']", strFieldLabel, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.verifyTextValue("xpath", ".//div[contains(text(),'" + strLxScriptName + "')]", strLxScriptName, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("cssselector", "input[value='Cancel']", SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception e){
            BaseView.takeScreenshot("VerifyBidInvitationEmailSubject.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    public static void inviteBidders(String strName) throws Throwable {
        try{
            SeleniumUtil.click("xpath","//td[contains(text(),'"+strName+"')]/preceding::td[1]/img",SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception e){
            BaseView.takeScreenshot("I_Expand_the_work_flow_to_expose_the_first_step_to_invite_bidders" + strName + ".png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    public static void checkOutButton(){
        try{
            SeleniumUtil.click("cssselector","input[value='Check Out']",SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception e){
            BaseView.takeScreenshot("I_click_on_Check_Out_button.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    public static void inviteBiddersButton(){
        try{
            SeleniumUtil.click("cssselector","input[name='inviteBidders']",SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception e){
            BaseView.takeScreenshot("I_click_on_Invite_Bidders_button.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    public static void dragAndDropModule(String strModule) throws Throwable {
        try{
            try {
                List<WebElement> closeEles = SeleniumUtil.getWebElementObjects("cssselector", "img[class='x-tool-img x-tool-close']", 6, SeleniumUtilities.OBJWAITTIMEOUT);
                for (WebElement closeEle : closeEles) {
                    SeleniumUtil.click(closeEle, SeleniumUtilities.OBJWAITTIMEOUT);
                }
            }
            catch(Exception ex){
            }
            SeleniumUtil.dragAndDropElement("xpath", ".//span[./text()='" + strModule + "']", "cssselector", "div[id='DEFAULT_TAB-innerCt']");
        }
        catch(Exception e){
            BaseView.takeScreenshot("I_Drag_and_Drop_module.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    public static void submitBidButton(){
        try{
            SeleniumUtil.click("cssselector","input[name='BidderBudget']",SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception e){
            BaseView.takeScreenshot("I_click_on_Submit_Bid_button.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    public static void clickOnLinkFrom(String strLink, String strEntityName) throws Throwable {
        try{
            SeleniumUtil.click("xpath",".//a[contains(text(),'"+strLink+"')]/parent::div/parent::td/preceding-sibling::td/div/a[@title='"+strEntityName+"']",SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception e){
            BaseView.takeScreenshot("I_click_on_Link_from.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    public static void clickOnCreateEmptyBidButton(){
        try{
            SeleniumUtil.click("cssselector","input[value='Create Empty Bid']",SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception e){
            BaseView.takeScreenshot("I_click_on_Create_Empty_Bid_button.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    public static void uploadButton(){
        try{
            SeleniumUtil.click("cssselector","input[name='upload']",SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception e){
            BaseView.takeScreenshot("I_click_on_upload_button.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    public static void clickOnCloseWindowButton(){
        try{
            SeleniumUtil.click("cssselector","input[value='Close Window']",SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception e){
            BaseView.takeScreenshot("I_click_on_upload_button.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }
    public static void navigateToUrl(String strURL)throws Throwable{
        try {
            BrowserDriver.loadPage(strURL);
        } catch (Exception e) {
            BaseView.takeScreenshot("I_navigate_to_url.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    public static void runNightlyBidProcessButton(){
        try{
            SeleniumUtil.click("cssselector","input[value='Run Nightly Bid Process']",SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception e){
            BaseView.takeScreenshot("I_click_on_upload_button.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }
    public static void clickOnConditionBidsButton(){
        try{
            SeleniumUtil.click("cssselector","input[name='BidLevelerBudget']",SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception e){
            BaseView.takeScreenshot("I_click_on_upload_button.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }
    public static void notifyWinningBidderButton(){
        try{
            SeleniumUtil.click("cssselector","input[value='Notify Winning Bidder']",SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception e){
            BaseView.takeScreenshot("I_click_on_upload_button.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }
    public static void changeBidCloseDateToYesterdayDate(){
        try{
            SeleniumUtil.clear("name", "BidPackage_BidCloseDate", SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.type("name", "BidPackage_BidCloseDate", SeleniumUtil.addDaystoCurrentDate(-1), SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception e){
            BaseView.takeScreenshot("I_click_on_upload_button.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }
    public static void addCurrentDateAsBidOpenDate(){
        try{
            SeleniumUtil.type("name", "BidPackage_BidOpenDate", SeleniumUtil.addDaystoCurrentDate(-6), SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception e){
            BaseView.takeScreenshot("I_click_on_upload_button.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }
    public static void addCurrentDatePlus1DayAsBidCloseDate(){
        try{
            SeleniumUtil.type("name","BidPackage_BidCloseDate", SeleniumUtil.addDaystoCurrentDate(1), SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception e){
            BaseView.takeScreenshot("I_add_current_date_plus_one_day_as_Bid_close_date.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }
    public static void addCurrentDatePlus2DaysAsConstructionStartDate() {
        try {
            SeleniumUtil.type("name", "Issue_CltExtIssue__Values1", SeleniumUtil.addDaystoCurrentDate(3), SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            BaseView.takeScreenshot("I_add_current_date_plus_two_days_as_construction_start_date.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    public static void clickOnTheCloseButtonOnPopWindow(){
        try{
            List<WebElement> buttons = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("span[class='x-btn-inner x-btn-inner-default-small']"));
            buttons.get(buttons.size()-1).click();
        }
        catch(Exception e){
            BaseView.takeScreenshot("I_click_on_the_close_button_on_pop_window.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }
    public static void clickOnStartProcessingButton(){
        try{
            String strSearchText="Finished processing:";
            for(int i=0;i<10;i++) {
                SeleniumUtil.click("cssselector", "input[value='Start processing']", SeleniumUtilities.OBJWAITTIMEOUT);
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
                wait.until(ExpectedConditions.textToBePresentInElement(By.tagName("*"), strSearchText));
            }

        }
        catch(Exception e){
            BaseView.takeScreenshot("I_click_on_Start_processing_button.png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }
    public static void processingOfGeneralContractorBidIsDone(){
        String strSearchText="Finished processing:";
        try {
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 30);
            wait.until(ExpectedConditions.textToBePresentInElement(By.tagName("*"), strSearchText));
            logger.info("Verified : " + strSearchText);
        } catch (Exception e) {
            BaseView.takeScreenshot(strSearchText + ".png");
            logger.info("Error :" + e.getMessage());
            fail(e.getMessage());
        }
    }

    public static void clickOnConditioningDefaultLink(String strVendor){
        try{
            SeleniumUtil.click("xpath",".//b[contains(text(),'"+strVendor+"')]/ancestor::tr[1]/following-sibling::tr[2]/td/div/b/a[contains(text(),'Conditioning Default')]",SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception e){
            try{
                SeleniumUtil.click("xpath",".//b[contains(text(),'"+strVendor+"')]/ancestor::tr[1]/following-sibling::tr[2]/td/div/b/a[contains(text(),'Conditioning Default')]",SeleniumUtilities.OBJWAITTIMEOUT);
            }catch(Exception ex){
                BaseView.takeScreenshot(strVendor.replace(" ","")+".png");
                logger.info("Error :" + e.getMessage());
                fail(e.getMessage());
            }
        }
    }
    public static void clickOnDefaultStatusLink(String strStatus) throws Throwable {
        try{
            SeleniumUtil.click("xpath",".//b[contains(text(),'"+strStatus+"')]/ancestor::tr[1]/following-sibling::tr[2]/td/div/b/a[contains(text(),'Default Status')]",SeleniumUtilities.OBJWAITTIMEOUT);
        }
        catch(Exception e){
            try{
                SeleniumUtil.click("xpath",".//b[contains(text(),'"+strStatus+"')]/ancestor::tr[1]/following-sibling::tr[2]/td/div/b/a[contains(text(),'Default Status')]",SeleniumUtilities.OBJWAITTIMEOUT);
            }catch(Exception ex){
                BaseView.takeScreenshot(strStatus.replace(" ","")+".png");
                logger.info("Error :" + e.getMessage());
                fail(e.getMessage());
            }
        }
    }

    public static void clickOnDownloadBudgetTemplateSpreadsheetButton(){
        try{
            FileDownloader.fileDownloader("name", "submitButton");
        }
        catch(Exception e){
            try{
                FileDownloader.fileDownloader("name", "submitButton");
            }catch(Exception ex){
                BaseView.takeScreenshot("clickOnDownloadBudgetTemplateSpreadsheetButton");
                logger.info("Error :" + e.getMessage());
                fail(e.getMessage());
            }
        }
    }

    public static void clickOnDownloadBlankSpreadsheetButton(){
        try{
            FileDownloader.fileDownloader("name", "download");
        }
        catch(Exception e){
            try{
                FileDownloader.fileDownloader("name", "download");
            }catch(Exception ex){
                BaseView.takeScreenshot("I_click_on_download_Blank_Spreadsheet_button"+ ".png");
                logger.info("Error :" + e.getMessage());
                fail(e.getMessage());
            }
        }
    }
    public static void uploadBidSpreadsheet(String dataDir, List<String> files) {
        try {
            String dataFolder = null;
            SeleniumUtil.click("cssselector", "input[name='upload']", SeleniumUtilities.OBJWAITTIMEOUT);
            dataFolder = dataDir;
            SeleniumUtil.type("cssselector", "input[name='description']", "Bid values", SeleniumUtilities.OBJWAITTIMEOUT);
            FileUpload.clickOnBrowseButton("cssselector", "input[type='file']");
            File dir = new File(FileUtilities.getCWD(), dataFolder);
            assertTrue(String.format("Specified directory '%s' not found", dir.getAbsolutePath()), dir.exists());
            for (String fileName : files) {
                logger.info("Upload custom list values " + fileName);
                Thread.sleep(10000);
                File file = new File(dir, fileName);
                String f = file.getPath();
                FileUpload.fileUpload(f.replace("/", "\\"));
                assertTrue(String.format("Specified file [%s] not found", file.getAbsolutePath()), file.exists());
                Thread.sleep(20000);
            }
            SeleniumUtil.click("cssselector", "input[name='submitbutton']", SeleniumUtilities.OBJWAITTIMEOUT);

        } catch (Exception e) {
            BaseView.takeScreenshot("I_import_following_files_from.png");
            Assert.fail("I_import_following_files_from");
        }
    }

    public static void verifyFollowingBudgetValuesInGird(List<Field> fields) throws Throwable {
        try {
            int intColCount=1;
            for (Field f : fields) {
                intColCount++;
                Assert.assertTrue("Field :"+f.getName(),SeleniumUtil.verifyTextValue("xpath", ".//table[@class='linedTable']/tbody/tr[1]/td[" + intColCount + "]", f.getName(), SeleniumUtilities.OBJWAITTIMEOUT));
                Assert.assertTrue("Field :"+f.getValue(),SeleniumUtil.verifyTextValue("xpath", ".//table[@class='linedTable']/tbody/tr[3]/td[" + intColCount + "]", f.getValue(), SeleniumUtilities.OBJWAITTIMEOUT));
            }
        } catch (Exception e) {
            BaseView.takeScreenshot("I_import_following_files_from.png");
            Assert.fail("I_import_following_files_from");
        }
    }

    public static void clickGetNotificationsLink() {
        try {
            BrowserDriver.getCurrentDriver().findElement(By.linkText("Get Notifications alerts")).click();
        } catch (Exception e) {
            fail(e.getMessage());

        }
    }
}
