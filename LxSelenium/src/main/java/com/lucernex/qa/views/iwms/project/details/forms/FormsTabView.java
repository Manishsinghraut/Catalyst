package com.lucernex.qa.views.iwms.project.details.forms;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.pages.iwms.project.details.forms.FormsPage;
import com.lucernex.qa.steps.iwms.GenericSteps;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import junit.framework.Assert;
//import org.eclipse.jetty.util.log.Log;
import org.openqa.selenium.By;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.List;
import java.util.logging.Logger;

//import static com.lucernex.qa.utils.ForceWaitForItem.delay;
import static junit.framework.Assert.*;

/**
 * Created by rle0239 on 28-04-2015.
 */
public class FormsTabView {

    private static final FormsPage formsPage = PageFactory.initElements(BrowserDriver.getCurrentDriver(), FormsPage.class);
    private static final Logger logger = Logger.getLogger(FormsTabView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    public static WebElement getFormActions(String formName)throws InterruptedException{
        assertNotNull("Did not pass Form name", formName);
//        return BrowserDriver.findElementWithTimeout(By.xpath("//*[text()='"+formName+"']/parent::td/parent::tr//following-sibling::tr"),30);
        return BrowserDriver.findElementWithTimeout(By.xpath("//*[text()='"+formName+"']/ancestor::td/parent::tr//following-sibling::tr"),30);
    }

    public static WebElement getFormTitleActions(String strTitle)throws InterruptedException{
        WebElement ele = null;
        try {
            assertNotNull("Did not pass Title name", strTitle);
//            ele= SeleniumUtil.getWebElementObject("xpath", ".//td[./text()='" + strTitle + "']/parent::tr//following-sibling::tr[1]"); //BrowserDriver.findElementWithTimeout(By.xpath("//*[text()='"+formName+"']/parent::td/parent::tr//following-sibling::tr"),30);
            ele= SeleniumUtil.getWebElementObject("xpath", ".//*[./text()='"+strTitle+"']/ancestor::tr[1]/following-sibling::tr[1]"); //BrowserDriver.findElementWithTimeout(By.xpath("//*[text()='"+formName+"']/parent::td/parent::tr//following-sibling::tr"),30);
        }
        catch(Exception ex){}
        return  ele;
    }

    public static WebElement getActions(String formName)throws InterruptedException{
        assertNotNull("Did not pass Form name", formName);
        return BrowserDriver.findElementWithTimeout(By.xpath("//*[text()='"+formName+"']/ancestor::tr[1]//following-sibling::tr"),30);
    }


    public static WebElement getForm(String formName)throws InterruptedException{
        assertNotNull("Did not pass Form name", formName);
        return BrowserDriver.findElementWithTimeout(By.linkText(formName),30);
    }

    public static void clickCloseLink(String formName){

        try{
            assertNotNull("Form name is empty!",formName);
            getFormActions(formName).findElement(By.linkText("<Close>")).click();
        }catch(Exception e){
            BaseView.takeScreenshot("FailedToClickFormCloseLink.png");
            logger.warning("Failed to click <Close> link");
            Assert.fail(e.getMessage());
        }
    }

    public static void clickReopenLink(String formName){

        try{
            assertNotNull("Form name is empty!",formName);
            getFormActions(formName).findElement(By.linkText("<Reopen>")).click();
        }catch(Exception e){
            BaseView.takeScreenshot("FailedToClickFormReopenLink.png");
            logger.warning("Failed to click <Reopen> link");
            Assert.fail(e.getMessage());
        }
    }

    public static void clickExpandAll(){

        try{
            formsPage.expandAllForms.click();
            logger.info("Clicked 'Expand All' link");
        }catch(Exception e){
            BaseView.takeScreenshot("FailedToClickExpandAllLink.png");
            Assert.fail(e.getMessage());
        }
    }

    public static void clickCollapseAll(){

        try{
            formsPage.collapseAllForms.click();
            logger.info("Clicked 'Collapse All' link");
        }catch(Exception e){
            BaseView.takeScreenshot("FailedToClickCollapseAllLink.png");
            Assert.fail(e.getMessage());
        }
    }

    public static void switchToFormTab() throws Throwable{
        try {
            SeleniumUtil.handleUnexpectedAlerts();
            BrowserDriver.getCurrentDriver().switchTo().defaultContent();
            /*WebElement frame = BrowserDriver.findElementWithTimeout(By.cssSelector("iframe[src*='issue']"), 30);
            BrowserDriver.getCurrentDriver().switchTo().frame(frame);*/
            CommonMethods.switchToVisibleFrame();
            CommonMethods.waitTillDivisionLoads();
            //SeleniumUtil.switchToFrameHavingElement("id","formType");
        } catch (Exception e) {
            BaseView.takeScreenshot("FailedSwitchToFrame.png");
            Assert.fail(e.getMessage());
        }
    }

    public static void confirmCloseForm() throws Throwable {
        try {
            String parentBrowser = BrowserDriver.getCurrentDriver().getWindowHandle();
            BaseView.switchToSecondWindow();
            formsPage.confirmFormClose.click();
            BrowserDriver.getCurrentDriver().switchTo().window(parentBrowser);
            logger.info("Successfully clicked 'Close Issue' button");
        } catch (Exception e) {
            BaseView.takeScreenshot("FailedSwitchToChildWindow.png");
            Assert.fail(e.getMessage());
        }
    }

    public static void confirmReopenForm() throws Throwable {
        try {
            String parentBrowser = BrowserDriver.getCurrentDriver().getWindowHandle();
            BaseView.switchToSecondWindow();
            formsPage.confirmFormReopen.click();
            BrowserDriver.getCurrentDriver().switchTo().window(parentBrowser);
            logger.info("Successfully clicked 'Confirm' button");
        } catch (Exception e) {
            BaseView.takeScreenshot("FailedSwitchToChildWindow.png");
            Assert.fail(e.getMessage());
        }
    }

    public static void selectFormsStatusType(String formStatus){
        try{
            BaseView.selectFromList(By.cssSelector("select[name='statusType']"),formStatus);
            logger.info("Selected option '"+formStatus+"' button");
        }catch(Exception e){
            BaseView.takeScreenshot("FailedToSelectFormStatusType.png");
            logger.warning("Unable to select status type");
            Assert.fail(e.getMessage());
        }
    }

    public static void clickSubmit(){
        try{
            formsPage.submit.click();
            logger.info("Clicked 'Submit' button");
        }catch(Exception e){
            BaseView.takeScreenshot("FailedToClickSubmitButton.png");
            logger.warning("Failed to click submit button");
            Assert.fail(e.getMessage());
        }
    }

    public static void clickPrintPreview(){
        try{
            BrowserDriver.waitForElement(formsPage.printPreview);
            formsPage.printPreview.click();
            logger.info("Clicked 'Print Preview' button");
        }catch(Exception e){
            BaseView.takeScreenshot("PrintPreview.png");
            logger.warning("Failed to click Print Preview link");
            Assert.fail(e.getMessage());
        }
    }

    public static void checkShowRepliesCheckBox(){
        try{
            formsPage.includeReplies.click();
            logger.info("Clicked 'Show Replies' checkbox");
        }catch(Exception e){
            BaseView.takeScreenshot("FailedToCheckCheckbox.png");
            logger.warning("Failed to check Show Replies checkbox");
            Assert.fail(e.getMessage());
        }
    }

    public static String getSuccessMessage(){
        String message = null;
        try{
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(),30);
            //wait.until(ExpectedConditions.textToBePresentInElement(formsPage.formActionSuccessMessage, "Successfully"));
            message = formsPage.formActionSuccessMessage.getText();
        }catch(Exception e){
            BaseView.takeScreenshot("FailedFetchSuccessMessage.png");
            logger.warning("Failed to fetch text from element");
            Assert.fail(e.getMessage());
        }
        return message;
    }

    public static void verifyFormLinks(String formName, String links){

        try{
            assertNotNull("Form name is empty!",formName);
            for(String link:links.split(", ")){
                getFormActions(formName).findElement(By.linkText(link));
                logger.info("Link " +link+" present");
            }
        }catch(Exception e){
            BaseView.takeScreenshot("FailedToCheckFormLink.png");
            logger.warning("Failed to check form link");
            Assert.fail(e.getMessage());
        }
    }

    public static void clickLinks(String links, String formName) throws Throwable{

        try{
            assertNotNull("Form name is empty!",formName);
            //Waiting for page to load
            //Thread.sleep(3000);
            CommonMethods.waitTillDivisionLoads();
            for(String link:links.split(", ")){
                SeleniumUtil.click(getFormActions(formName).findElement(By.linkText(link)),SeleniumUtilities.OBJWAITTIMEOUT);
//                getFormActions(formName).findElement(By.linkText(link)).click();
                logger.info("Link " +link+" present");
            }
        }catch(Exception e){
            BaseView.takeScreenshot("FailedToClickFormLink.png");
            logger.warning("Failed to click form link "+links);
            Assert.fail(e.getMessage());
        }
    }

    public static void clickLink(String links, String formName) throws Throwable{

        try{
            assertNotNull("Form name is empty!",formName);
            //Waiting for page to load
            //Thread.sleep(3000);
            CommonMethods.waitTillDivisionLoads();
            for(String link:links.split(", ")){
                getActions(formName).findElement(By.linkText(link)).click();
                logger.info("Link " +link+" present");
            }
        }catch(Exception e){
            BaseView.takeScreenshot("FailedToClickFormLink.png");
            logger.warning("Failed to click form link "+links);
            Assert.fail(e.getMessage());
        }
    }

    public static void verifyNonEditableData(List<String> files) {
        try {

            WebElement tableEle = SeleniumUtil.getWebElementObject("cssSelector", "table[class=\'rowColor1\']");
            int size = tableEle.findElements(By.tagName("td")).size();
            for (String f : files) {
                int i = 0;
                //tableEle.findElement(By.xpath("//td[contains(text(),'"+f+"')]"));
                for (WebElement e : tableEle.findElements(By.tagName("td"))) {
                    i++;
                    if (e.getText().contains(f)) {
                        logger.info("Data " + f + " is found in the page");
                        break;
                    }
                }
                if (size == i) {
                    BaseView.takeScreenshot(f + ".png");
                    fail("Data " + f + " is not present in the page");
                }
            }
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception ex) {
            BaseView.takeScreenshot("I_verify_values_on_non_editable_page.png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static void verifyPrintPreviewData(List<String> files) {
        try {

            WebElement tableEle = SeleniumUtil.getWebElementObject("xpath", "//div[@id='popupBody']//table//table");
            int size = tableEle.findElements(By.tagName("td")).size();
            for (String f : files) {
                int i = 0;
                //tableEle.findElement(By.xpath("//td[contains(text(),'"+f+"')]"));
                for (WebElement e : tableEle.findElements(By.tagName("td"))) {
                    i++;
                    if (e.getText().contains(f)) {
                        logger.info("Data " + f + " is found in the page");
                        break;
                    }
                }
                if (size == i) {
                    BaseView.takeScreenshot(f + ".png");
                    fail("Data " + f + " is not present in the page");
                }
            }
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception ex) {
            BaseView.takeScreenshot("I_verify_values_on_non_editable_page.png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    /**
     * Returns a list of buttons as found in the form page.For this we need to pass button text
     */
    public static List<WebElement> getActionButtons() {
        for (int i = 0; i < 2; i++) {
          /*  SeleniumUtil.switchTodefaultContent();
            WebElement frame = BrowserDriver.getCurrentDriver().findElement(
                    By.cssSelector("iframe[src*='/en/issue/IssueList']")
            );*/

            /*org.junit.Assert.assertNotNull(frame);

            logger.log(Level.INFO, "Waiting for form page to appear...");
            BrowserDriver.waitForElement(frame);
            logger.log(Level.INFO, "Form page present");
            BrowserDriver.getCurrentDriver().switchTo().frame(frame);*/

            List<WebElement> buttons = BrowserDriver.getCurrentDriver().findElements(By.cssSelector(".lx-add-btn"));

            try {
                BrowserDriver.waitForAllElements(buttons);

                if (buttons != null && buttons.size() > 0) {
                    return buttons;
                } else {
                    return null;
                }
            } catch (StaleElementReferenceException e) {
            }
        }
        return null;
    }

    public static void clickFormButtonsWhenReady(String buttonText) {
        logger.info("Attempting to click form button: " + buttonText + "...");

        int maxTries = 20;
        for( int count = 0; count<maxTries; count++ ) {
            logger.info("Try " + count + " for button: " + buttonText + "...");
            //  Get action panel buttons
            List<WebElement> buttons = FormsTabView.getActionButtons();
            for( WebElement btn : buttons ){
                String text = btn.getText().trim();
                if ( text.equalsIgnoreCase(buttonText)) {
                    //  Click then return
                    logger.info("clicking button: " + buttonText + "...");
                    btn.click();
                    return;
                }
            }
            try {
//                delay(1000);
            } catch (Exception e) {
            }
        }
        fail("Did not find the form button " + buttonText + " after " + maxTries + " attempts");
    }

    public static void selectFormType(String formType){
        try{
            BaseView.selectFromList(By.cssSelector("select[name='PageLayoutID\"']"),formType);
            logger.info("Selected option '"+formType+"'");
        }catch(Exception e){
            BaseView.takeScreenshot("FailedToSelectFormType.png");
            logger.warning("Unable to select form type "+formType);
            Assert.fail(e.getMessage());
        }
    }

    public static void formGrid(String header, String value,String formName,String grid) throws Throwable{
        int tdCount = 0;
        boolean found = false;
        WebElement rowElement = null;
        WebElement table = BrowserDriver.getCurrentDriver().findElement(By
                .cssSelector(grid));
        //get column of the header
        for (WebElement tr : table.findElements(By.tagName("tr"))) {
            tdCount = 0;
            for (WebElement ele : tr.findElements(By.tagName("td"))) {
                ++tdCount;
                //if (ele.getText().contains(header)) {
                if (AllContractPagesView.getTextAndByPassException(ele).contains(header)) {
                    found = true;
                    break;
                }
            }
            if(found) break;
        }
        if (!found) {
            fail(header + ": not present");
        }

        if (found) {
            found = false;
            //Get Row of by passing unique element
            for (WebElement tr : table.findElements(By.tagName("tr"))) {
                for (WebElement ele : tr.findElements(By.tagName("td"))) {
                    //if (ele.getText().contains(formName)) {
                    if (AllContractPagesView.getTextAndByPassException(ele).contains(formName)) {
                        found = true;
                        rowElement = tr;
                        break;
                    }
                }
                if (found) break;
            }
        }
        //String text = rowElement.findElement(By.cssSelector("td:nth-of-type(" + tdCount + ")")).getText();
        String text = AllContractPagesView.getTextAndByPassException(rowElement.findElement(By.cssSelector("td:nth-of-type(" + tdCount + ")")));
        if (text.contains(value)) {
            logger.info(value + ": present");
        } else {
            fail(value + ": not present");
        }
    }
    public static void downloadSampleCustomListTemplate(){
        try {
            SeleniumUtil.click("linktext","Download Sample CustomList Template",SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception ex) {
            BaseView.takeScreenshot("downloadSampleCustomListTemplate.png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static void verifyUploadedFields(){
        try {
            assertTrue(SeleniumUtil.getWebElementObject("cssselector","img[src='/en/img/delete.png']").isDisplayed());
        } catch (Exception ex) {
            BaseView.takeScreenshot("downloadSampleCustomListTemplate.png");
            logger.info("Error :" + ex.getMessage());
        }
    }

    public static void getFormRecID() throws Throwable{
        try {
            String entityID = SeleniumUtil.getElementText("xpath","//*[@id='IssueID_label']/parent::td",1);
            GenericSteps.lxRecID = entityID.replaceAll("Form RecID\n", "");
            logger.info("Fetched entity ID " + GenericSteps.lxRecID);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to fetch entity ID.png");
            org.junit.Assert.fail("Unable to fetch entity ID ");
        }
    }

    public static void verifyMethodOfContactField(int number, String value){
        try {
            assertEquals(SeleniumUtil.getWebElementObjects("cssselector", "input[id^='Issue_CodeMethodOfContactID']", 5, 1).get(number).getAttribute("value"), value);
        } catch (Exception ex) {
            BaseView.takeScreenshot("downloadSampleCustomListTemplate.png");
            logger.info("Error :" + ex.getMessage());
            fail("Expected value "+value+" not present");
        }
    }

    public static void verifyIssueExistField(int number,boolean value){
        try {
            if(value){
                assertTrue(SeleniumUtil.getWebElementObjects("cssselector", "input[name='Issue_CltExtIssue__Values1']", 5, 1).get(number).isSelected());
            } else {
                assertFalse(SeleniumUtil.getWebElementObjects("cssselector", "input[name='Issue_CltExtIssue__Values1']", 5, 1).get(number).isSelected());
            }
        } catch (Exception ex) {
            BaseView.takeScreenshot("downloadSampleCustomListTemplate.png");
            logger.info("Error :" + ex.getMessage());
            fail("Expected value "+value+" not present");
        }
    }


    public static void clickCheckOutLinks(String strLink, String strTitleName) throws Throwable{

        try{
            assertNotNull("Title name is empty!",strTitleName);
            CommonMethods.waitTillDivisionLoads();
            for(String link:strLink.split(", ")){
//                getFormTitleActions(strTitleName).findElement(By.linkText(link)).click();
                SeleniumUtil.click(getFormTitleActions(strTitleName).findElement(By.linkText(link)),SeleniumUtilities.OBJWAITTIMEOUT);
                logger.info("Link " +link+" present");
            }
        }catch(Exception e){
            BaseView.takeScreenshot("clickCheckOutLinks");
            logger.warning("Failed to click Title link "+strLink);
            Assert.fail(e.getMessage());
        }
    }

    public static void verify(String strLink, String strTitleName) throws Throwable{

        try{
            assertNotNull("Title name is empty!",strTitleName);
            CommonMethods.waitTillDivisionLoads();
            for(String link:strLink.split(", ")){
                SeleniumUtil.click(getFormTitleActions(strTitleName).findElement(By.linkText(link)),SeleniumUtilities.OBJWAITTIMEOUT);
                logger.info("Link " +link+" present");
            }
        }catch(Exception e){
            BaseView.takeScreenshot("clickCheckOutLinks");
            logger.warning("Failed to click Title link "+strLink);
            Assert.fail(e.getMessage());
        }
    }

    public static void verifyDropdownValueDoesNot(String strOptionValue) throws Throwable{
        try{
          assertFalse(SeleniumUtil.IsValuePresentInDropdown("cssselector","select[name='PageLayoutID\"']",strOptionValue));
        }catch(Exception e){
            BaseView.takeScreenshot("verifyDropdownValueDoesnot");
            logger.warning("Failed to  verify Dropdown Value Does not :"+ strOptionValue);
            Assert.fail(e.getMessage());
        }
    }

    public static void clickAddApproverButton(String strOptionValue) throws Throwable{
        try{
            BaseView.pushShortTimeout();
            if(strOptionValue.equalsIgnoreCase("approvers")){
                SeleniumUtil.click("cssselector","input[name='addApprover'][value='>'][onclick*='availableApproverMemberIDList']",SeleniumUtilities.OBJWAITTIMEOUT);

            }else  if(strOptionValue.equalsIgnoreCase("assignees")){
                SeleniumUtil.click("cssselector","input[name='addApprover'][value='>'][onclick*='availableAssigneeMemberIDList']",SeleniumUtilities.OBJWAITTIMEOUT);

            }else  if(strOptionValue.equalsIgnoreCase("notifiers")){
                SeleniumUtil.click("cssselector","input[name='addApprover'][value='>'][onclick*='availableNotifieeMemberIDList']",SeleniumUtilities.OBJWAITTIMEOUT);
            }

        }catch(Exception e){
            BaseView.takeScreenshot("verifyDropdownValueDoesnot");
            logger.warning("Failed to  verify Dropdown Value Does not :"+ strOptionValue);
            Assert.fail(e.getMessage());
        }
    }
}