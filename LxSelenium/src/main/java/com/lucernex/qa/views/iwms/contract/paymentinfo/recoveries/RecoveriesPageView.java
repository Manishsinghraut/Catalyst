package com.lucernex.qa.views.iwms.contract.paymentinfo.recoveries;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.pages.iwms.contract.paymentInfo.recoveries.RecoveriesPage;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import junit.framework.TestCase;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

/**
 * Created by sowmya on 9/24/2015.
 */
public class RecoveriesPageView extends BaseView {

    private static final Logger logger = Logger.getLogger(RecoveriesPageView.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    private static final RecoveriesPage recoveriesPage = PageFactory.initElements(
            BrowserDriver.getCurrentDriver(),
            RecoveriesPage.class
    );

    public static void clickGroupedExpenseReportedLinkInNetPage() {
        BrowserDriver.waitForElement(recoveriesPage.groupedExpenseReportedLink);
        CommonMethods.moveToWebElementAndFocus(recoveriesPage.groupedExpenseReportedLink);
        if (!recoveriesPage.groupedExpenseReportedLink.isDisplayed()) {
            takeScreenshot("looking-for-groupedExpenseReported-link.png");
            fail("Did not see the grouped Expense Reported link!");
        }
        recoveriesPage.groupedExpenseReportedLink.click();
    }

    public static void clickGroupedExpenseApprovedLinkInNetPage() {
        BrowserDriver.waitForElement(recoveriesPage.groupedExpenseApprovedLink);
        CommonMethods.moveToWebElementAndFocus(recoveriesPage.groupedExpenseApprovedLink);
        if (!recoveriesPage.groupedExpenseApprovedLink.isDisplayed()) {
            takeScreenshot("looking-for-groupedExpenseApproved-link.png");
            fail("Did not see the grouped Expense Approved link!");
        }
        recoveriesPage.groupedExpenseApprovedLink.click();
    }

    public static void clickAdditionalExpenseReportedLinkInNetPage() {
        BrowserDriver.waitForElement(recoveriesPage.additionalExpenseReportedLink);
        CommonMethods.moveToWebElementAndFocus(recoveriesPage.additionalExpenseReportedLink);
        if (!recoveriesPage.additionalExpenseReportedLink.isDisplayed()) {
            takeScreenshot("looking-for-additionalExpenseReported-link.png");
            fail("Did not see the additional Expense Reported link!");
        }
        recoveriesPage.additionalExpenseReportedLink.click();
    }

    public static void clickAdditionalExpenseApprovedLinkInNetPage() {
        BrowserDriver.waitForElement(recoveriesPage.additionalExpenseApprovedLink);
        CommonMethods.moveToWebElementAndFocus(recoveriesPage.additionalExpenseApprovedLink);
        if (!recoveriesPage.additionalExpenseApprovedLink.isDisplayed()) {
            takeScreenshot("looking-for-additionalExpenseReported-link.png");
            fail("Did not see the additional Expense Reported link!");
        }
        recoveriesPage.additionalExpenseApprovedLink.click();
    }

    public static void verifyVarianceAmount(List<String> variance) {
        List<WebElement> data = BrowserDriver.getCurrentDriver().findElements(By.xpath("//div[@class='tblHeader']/font[text()='Variance Amt.']/ancestor::tr[1]/following-sibling::tr/td[5]"));

        for (int i = 0; i < variance.size(); i++) {
            if (!data.get(i).getText().trim().equals(variance.get(i).trim())) {
                fail("Expected " + i + "th variance amount " + variance.get(i).trim() + "is not present");
            }
            System.out.println("Expected " + i + "th variance amount " + variance.get(i).trim() + "is present");
        }
    }

    public static void verifyComputedAmount(String variance) {
//        WebElement data = BrowserDriver.getCurrentDriver().findElement(By.id("ComputedApprovedTotalAmount_span"));
        WebElement data = BrowserDriver.getCurrentDriver().findElement(By.id("ComputedApprovedTotalAmount"));

        if (!data.getText().trim().equals(variance.trim())) {
            fail("Expected " + data.getText() + "th computed amount " + variance.trim() + "is not present");
        }
        System.out.println("Expected " + data.getText() + "th computed amount " + variance.trim() + "is  present");
    }


    public static void verifyLabelValuePair(List<Field> labelValuePair) {
        for (Field f : labelValuePair) {
            if (f.getName().contains("Total")) {
                String label = f.getName().replaceAll(" ", "");
                String s[] = label.split("TotalApproved");
                label = s[0]+"ApprovedTotal" + s[1] + "_label";
                String value =  s[0]+"ApprovedTotal" + s[1];
                if (!(BrowserDriver.getCurrentDriver().findElement(By.id(label)).getText().trim().equals(f.getName()) &&
                        BrowserDriver.getCurrentDriver().findElement(By.id(value)).getText().equals(f.getValue()))) {
                    fail(f.getName() + " : " + f.getValue() + "does not exist");
                }
                System.out.println(f.getName() + " : " + f.getValue() + " exist");
            } else {
                String label = f.getName().replaceAll(" ", "");
                String value = label;
                label = label + "_label";
                if (!(BrowserDriver.getCurrentDriver().findElement(By.id(label)).getText().trim().equals(f.getName()) &&
                        BrowserDriver.getCurrentDriver().findElement(By.id(value)).getText().equals(f.getValue()))) {
                    fail(f.getName() + " : " + f.getValue() + "does not exist");
                }
                System.out.println(f.getName() + " : " + f.getValue() + " exist");
            }
        }
    }

    public static void checkSendMailCheckboxInReconcilePopup() {
        if (!BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[componentid='sendEmail']")).isDisplayed()) {
            takeScreenshot("looking-for-send mail checkbox-link.png");
            fail("Did not see the send mail checkbox link!");
        }
        BrowserDriver.getCurrentDriver().findElement(By.cssSelector("input[componentid='sendEmail']")).click();
    }

    public static void verifySuccessMessage(String msg) throws Throwable {
        try {
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 30);
            wait.until(ExpectedConditions.textToBePresentInElement(recoveriesPage.msg, msg));
            logger.info(msg + " is displayed");
            String successMsg = recoveriesPage.msg.getText();
            if (!successMsg.isEmpty()) {
                assertEquals("Expected :" + msg + " is different from" + successMsg, successMsg, msg);
            }
            CommonMethods.waitTillDivisionLoads();
        } catch (Exception e) {
            logger.info(msg + " disappeared before displaying");
        }
    }

    public static void verifySuccessMessageInNonFramePage(String msg) throws Throwable {
        try {
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 15);
            wait.until(ExpectedConditions.textToBePresentInElement(recoveriesPage.successMsg, msg));
            logger.info(msg + " is displayed");
            String successMsg = recoveriesPage.successMsg.getText();
            if (!successMsg.isEmpty()) {
                assertEquals("Expected :" + msg + " is different from" + successMsg, successMsg, msg);
            }
            CommonMethods.waitTillDivisionLoads();
        } catch (Exception e) {
            logger.info(msg + " disappeared before displaying");
        }
    }

    public static void clickSubmitBtn() {
        BrowserDriver.waitForElement(recoveriesPage.submitBtn);
        CommonMethods.moveToWebElementAndFocus(recoveriesPage.submitBtn);
        if (!recoveriesPage.submitBtn.isDisplayed()) {
            takeScreenshot("looking-for-OK button.png");
            fail("Did not see the OK button link!");
        }
        recoveriesPage.submitBtn.click();
    }

    public static void clickDeductionsReportedLink() {
        BrowserDriver.waitForElement(recoveriesPage.deductionsReportedLink);
        CommonMethods.moveToWebElementAndFocus(recoveriesPage.deductionsReportedLink);
        if (!recoveriesPage.deductionsReportedLink.isDisplayed()) {
            takeScreenshot("looking-for-deductions Reported-link.png");
            fail("Did not see the deductions Reported link!");
        }
        recoveriesPage.deductionsReportedLink.click();
    }

    public static void clickRecoveriesReportedLink() {
        try {
            Thread.sleep(10000);
            SeleniumUtil. waitForElementVisibilityOf(recoveriesPage.recoveriesReportedLink,6,SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.waitForElementIsClickable(recoveriesPage.recoveriesReportedLink, 8, SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.moveToElement(recoveriesPage.recoveriesReportedLink,SeleniumUtilities.OBJWAITTIMEOUT);
            BrowserDriver.waitForElement(recoveriesPage.recoveriesReportedLink);
            CommonMethods.moveToWebElementAndFocus(recoveriesPage.recoveriesReportedLink);
            if (!recoveriesPage.recoveriesReportedLink.isDisplayed()) {
                takeScreenshot("looking-for-recoveries Reported-link.png");
                fail("Did not see the recoveries Reported link!");
            }
            recoveriesPage.recoveriesReportedLink.sendKeys("");
//            recoveriesPage.recoveriesReportedLink.click();
            SeleniumUtil.click(recoveriesPage.recoveriesReportedLink,SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void verifyEditableRowGridValues(String gridID, List<Field> fields) throws Throwable {

        String strElement = AllContractPagesView.getGridElement(gridID);
        AllContractPagesView.moveToElementAndFocus(strElement);

        WebElement gridElement = SeleniumUtil.getElement("cssselector",strElement,5,2); //BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

        for(Field f :fields) {
            int columnCount = 0;
            for (WebElement gridHeader : headers) {
                columnCount++;
                if (gridHeader.getText().trim().equals(f.getName())) {
                    List<WebElement> inputs = gridElement.findElements(By.cssSelector("div[id^='roweditor'][class='x-box-target']>div:nth-of-type(" + columnCount + ") input"));
                    if (inputs.size() == 2) {
                        assertEquals(f.getValue() + " value is not present under header " + gridHeader.getText(), inputs.get(1).getAttribute("value").trim(), f.getValue());
                    }else{
                        assertEquals(f.getValue() + " value is not present under header " + gridHeader.getText(), inputs.get(0).getAttribute("value").trim(), f.getValue());
                    }
                    logger.info(f.getValue() + " value is present under header " + gridHeader.getText());
                }
            }
        }
    }

    public static void doubleUniqueClickGridRow(String gridID, String cellValue, String header, List<Field> fields) throws Throwable {
        int foundCount = 0;
        int row = 0;
        int colIndex = 0;
        WebElement clickableRow = null;
        int count = 0;

        String strElement = AllContractPagesView.getGridElement(gridID);
        AllContractPagesView.moveToElementAndFocus(strElement);

        WebElement gridElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(strElement));
        List<WebElement> headers = gridElement.findElements(By.cssSelector("div[id^='headercontainer'] span.x-column-header-text-wrapper"));

        //Fetch rows
        List<WebElement> fixRow = new ArrayList<WebElement>();

        for (WebElement tr : gridElement.findElements(By.cssSelector("tr[class*='important']"))) {
            colIndex = 0;
            for (WebElement td : tr.findElements(By.cssSelector("td.x-grid-cell"))) {
                colIndex++;
                AllContractPagesView.focusWebElement(td);
                SeleniumUtilities.waitForNonStaleWebElement(td);
                if ((td.getText().trim().contains(cellValue.trim()) || cellValue.trim().contains(td.getText().trim())) && headers.get(colIndex-1).getText().trim().equals(header.trim())) {
                    fixRow. add(BrowserDriver.getParent(td));
                }
            }
        }

        for (WebElement ele : fixRow) {
            List<WebElement> cells = ele.findElements(By.cssSelector("td.x-grid-cell"));
            row = 0;
            foundCount = 0;
            for(WebElement cell : cells){
                row = row + 1;
                AllContractPagesView.focusWebElement(cells.get(cells.size() - 1));
                AllContractPagesView.focusWebElement(cell);
                for (Field f : fields) {
                    if (cell.getText().contains(f.getValue()) && headers.get(row - 1).getText().trim().equals(f.getName())) {
                        foundCount++;
                    }
                }
            }

            if(foundCount == fields.size()){
                try{
                    count = foundCount;
                    clickableRow = ele;
                    logger.info("Final Expected " + cellValue + " is present under column header " + header);
                    AllContractPagesView.focusWebElement(clickableRow);
                    Actions doubleClick = new Actions(BrowserDriver.getCurrentDriver());
                    doubleClick.doubleClick(clickableRow.findElement(By.tagName("td"))).build().perform();
                }catch(Exception e){
                }
            }
        }

        if(!(count ==fields.size())){
            logger.info("Final Expected " + cellValue + " is not present under column header " + header);
            TestCase.fail("Final Expected " + cellValue + " is not present under column header " + header);
        }
    }

    public static void verifyDeductionsReportedAndApprovedAmount(List<Field> labelValuePair) {
        for (Field f : labelValuePair) {
            if (f.getName().contains("Reported")) {
                if (!BrowserDriver.getCurrentDriver().findElement(By.id("vis_ExpenseRecovery_ReportedDeductionsGross")).getText().trim().equals(f.getValue())) {
                    fail(f.getName() + " : " + f.getValue() + "does not exist");
                }
                System.out.println(f.getName() + " : " + f.getValue() + " exist");
            }
            if (f.getName().contains("Approved")) {
                if (!BrowserDriver.getCurrentDriver().findElement(By.id("vis_ExpenseRecovery_ApprovedDeductionsGross")).getText().trim().equals(f.getValue())) {
                    fail(f.getName() + " : " + f.getValue() + "does not exist");
                }
                System.out.println(f.getName() + " : " + f.getValue() + " exist");
            }

            if (f.getName().contains("Budgeted")) {
                if (!BrowserDriver.getCurrentDriver().findElement(By.id("vis_ExpenseRecovery_BudgetedDeductionsGross")).getText().trim().equals(f.getValue())) {
                    fail(f.getName() + " : " + f.getValue() + "does not exist");
                }
                System.out.println(f.getName() + " : " + f.getValue() + " exist");
            }
        }
    }

    public static void verifyRecoveriesReportedAndApprovedAmount(List<Field> labelValuePair) {
        for (Field f : labelValuePair) {
            if (f.getName().contains("Reported")) {
                if (!BrowserDriver.getCurrentDriver().findElement(By.id("vis_ExpenseRecovery_ReportedRecoveriesGross")).getText().trim().equals(f.getValue())) {
                    fail(f.getName() + " : " + f.getValue() + "does not exist");
                }
                System.out.println(f.getName() + " : " + f.getValue() + " exist");
            }
            if (f.getName().contains("Approved")) {
                if (!BrowserDriver.getCurrentDriver().findElement(By.id("vis_ExpenseRecovery_ApprovedRecoveriesGross")).getText().trim().equals(f.getValue())) {
                    fail(f.getName() + " : " + f.getValue() + "does not exist");
                }
                System.out.println(f.getName() + " : " + f.getValue() + " exist");
            }

            if (f.getName().contains("Budgeted")) {
                if (!BrowserDriver.getCurrentDriver().findElement(By.id("vis_ExpenseRecovery_BudgetedRecoveriesGross")).getText().trim().equals(f.getValue())) {
                    fail(f.getName() + " : " + f.getValue() + "does not exist");
                }
                System.out.println(f.getName() + " : " + f.getValue() + " exist");
            }
        }
    }

    public static void verifySubtotalReportedAndApprovedAmount(List<Field> labelValuePair) {
        for (Field f : labelValuePair) {
            if (f.getName().contains("Reported")) {
                if (!BrowserDriver.getCurrentDriver().findElement(By.id("ReportedSubTotal2Gross")).getText().trim().equals(f.getValue())) {
                    fail(f.getName() + " : " + f.getValue() + "does not exist");
                }
                System.out.println(f.getName() + " : " + f.getValue() + " exist");
            }
            if (f.getName().contains("Approved")) {
                if (!BrowserDriver.getCurrentDriver().findElement(By.id("ApprovedSubTotal2Gross")).getText().trim().equals(f.getValue())) {
                    fail(f.getName() + " : " + f.getValue() + "does not exist");
                }
                System.out.println(f.getName() + " : " + f.getValue() + " exist");
            }

            if (f.getName().contains("Budgeted")) {
                if (!BrowserDriver.getCurrentDriver().findElement(By.id("BudgetedSubTotal2Gross")).getText().trim().equals(f.getValue())) {
                    fail(f.getName() + " : " + f.getValue() + "does not exist");
                }
                System.out.println(f.getName() + " : " + f.getValue() + " exist");
            }
        }
    }

    public static void verifySubtotalReportedAndApprovedAmount1(List<Field> labelValuePair) {
        for (Field f : labelValuePair) {
            if (f.getName().contains("Reported")) {
                if (!BrowserDriver.getCurrentDriver().findElement(By.id("ReportedSubTotal1Gross")).getText().trim().equals(f.getValue())) {
                    fail(f.getName() + " : " + f.getValue() + "does not exist");
                }
                System.out.println(f.getName() + " : " + f.getValue() + " exist");
            }
            if (f.getName().contains("Approved")) {
                if (!BrowserDriver.getCurrentDriver().findElement(By.id("ApprovedSubTotal1Gross")).getText().trim().equals(f.getValue())) {
                    fail(f.getName() + " : " + f.getValue() + "does not exist");
                }
                System.out.println(f.getName() + " : " + f.getValue() + " exist");
            }

            if (f.getName().contains("Budgeted")) {
                if (!BrowserDriver.getCurrentDriver().findElement(By.id("BudgetedSubTotal1Gross")).getText().trim().equals(f.getValue())) {
                    fail(f.getName() + " : " + f.getValue() + "does not exist");
                }
                System.out.println(f.getName() + " : " + f.getValue() + " exist");
            }
        }
    }



    public static void verifyDeductionsReportedAndApprovedNetAmount(List<Field> labelValuePair) {
        for (Field f : labelValuePair) {
            if (f.getName().contains("Reported")) {
                if (!BrowserDriver.getCurrentDriver().findElement(By.id("vis_ExpenseRecovery_ReportedDeductionsNet")).getText().trim().equals(f.getValue())) {
                    fail(f.getName() + " : " + f.getValue() + "does not exist");
                }
                System.out.println(f.getName() + " : " + f.getValue() + " exist");
            }
            if (f.getName().contains("Approved")) {
                if (!BrowserDriver.getCurrentDriver().findElement(By.id("vis_ExpenseRecovery_ApprovedDeductionsNet")).getText().trim().equals(f.getValue())) {
                    fail(f.getName() + " : " + f.getValue() + "does not exist");
                }
                System.out.println(f.getName() + " : " + f.getValue() + " exist");
            }

            if (f.getName().contains("Budgeted")) {
                if (!BrowserDriver.getCurrentDriver().findElement(By.id("vis_ExpenseRecovery_BudgetedDeductionsNet")).getText().trim().equals(f.getValue())) {
                    fail(f.getName() + " : " + f.getValue() + "does not exist");
                }
                System.out.println(f.getName() + " : " + f.getValue() + " exist");
            }
        }
    }

    public static void verifyRecoveriesReportedAndApprovedNetAmount(List<Field> labelValuePair) {
        for (Field f : labelValuePair) {
            if (f.getName().contains("Reported")) {
                if (!BrowserDriver.getCurrentDriver().findElement(By.id("vis_ExpenseRecovery_ReportedRecoveriesNet")).getText().trim().equals(f.getValue())) {
                    fail(f.getName() + " : " + f.getValue() + "does not exist");
                }
                System.out.println(f.getName() + " : " + f.getValue() + " exist");
            }
            if (f.getName().contains("Approved")) {
                if (!BrowserDriver.getCurrentDriver().findElement(By.id("vis_ExpenseRecovery_ApprovedRecoveriesNet")).getText().trim().equals(f.getValue())) {
                    fail(f.getName() + " : " + f.getValue() + "does not exist");
                }
                System.out.println(f.getName() + " : " + f.getValue() + " exist");
            }

            if (f.getName().contains("Budgeted")) {
                if (!BrowserDriver.getCurrentDriver().findElement(By.id("vis_ExpenseRecovery_BudgetedRecoveriesNet")).getText().trim().equals(f.getValue())) {
                    fail(f.getName() + " : " + f.getValue() + "does not exist");
                }
                System.out.println(f.getName() + " : " + f.getValue() + " exist");
            }
        }
    }

    public static void verifySubtotalReportedAndApprovedNetAmount(List<Field> labelValuePair) {
        for (Field f : labelValuePair) {
            if (f.getName().contains("Reported")) {
                if (!BrowserDriver.getCurrentDriver().findElement(By.id("ReportedSubTotal2Net")).getText().trim().equals(f.getValue())) {
                    fail(f.getName() + " : " + f.getValue() + "does not exist");
                }
                System.out.println(f.getName() + " : " + f.getValue() + " exist");
            }
            if (f.getName().contains("Approved")) {
                if (!BrowserDriver.getCurrentDriver().findElement(By.id("ApprovedSubTotal2Net")).getText().trim().equals(f.getValue())) {
                    fail(f.getName() + " : " + f.getValue() + "does not exist");
                }
                System.out.println(f.getName() + " : " + f.getValue() + " exist");
            }

            if (f.getName().contains("Variance")) {
                if (!BrowserDriver.getCurrentDriver().findElement(By.id("ABVarianceSubTotal2Net")).getText().trim().equals(f.getValue())) {
                    fail(f.getName() + " : " + f.getValue() + "does not exist");
                }
                System.out.println(f.getName() + " : " + f.getValue() + " exist");
            }
        }
    }

    public static void clickDeductionsReportedNetLink() {
        BrowserDriver.waitForElement(recoveriesPage.deductionsReportedNetLink);
        CommonMethods.moveToWebElementAndFocus(recoveriesPage.deductionsReportedNetLink);
        if (!recoveriesPage.deductionsReportedNetLink.isDisplayed()) {
            takeScreenshot("looking-for-deductions Reported-link.png");
            fail("Did not see the deductions Reported link!");
        }
        recoveriesPage.deductionsReportedNetLink.click();
    }

    public static void clickRecoveriesReportedNetLink() {
//        BrowserDriver.waitForElement(recoveriesPage.recoveriesReportedNetLink);
//        CommonMethods.moveToWebElementAndFocus(recoveriesPage.recoveriesReportedNetLink);
//        if (!recoveriesPage.recoveriesReportedNetLink.isDisplayed()) {
//            takeScreenshot("looking-for-recoveries Reported-link.png");
//            fail("Did not see the recoveries Reported link!");
//        }
//        recoveriesPage.recoveriesReportedNetLink.click();
        try {
            SeleniumUtil.waitForElementIsClickable("cssselector","span[id='vis_ExpenseRecovery_ReportedRecoveriesNet']",6,SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.click("cssselector", "span[id='vis_ExpenseRecovery_ReportedRecoveriesNet']", SeleniumUtilities.OBJWAITTIMEOUT);
        } catch (Exception e){
            takeScreenshot("click on net recoveries Reported link");
            fail("Did not see the recoveries Reported link!");
        }
    }

    public static void clickRecoveriesAdditionReportedLink() {
        try {
            SeleniumUtil.waitForElementVisibilityOf(recoveriesPage.recoveriesReportedAdditionsGrossLink,6,SeleniumUtilities.OBJWAITTIMEOUT);
            SeleniumUtil.moveToElement(recoveriesPage.recoveriesReportedAdditionsGrossLink,SeleniumUtilities.OBJWAITTIMEOUT);
            BrowserDriver.waitForElement(recoveriesPage.recoveriesReportedAdditionsGrossLink);
            CommonMethods.moveToWebElementAndFocus(recoveriesPage.recoveriesReportedAdditionsGrossLink);
            if (!recoveriesPage.recoveriesReportedAdditionsGrossLink.isDisplayed()) {
                takeScreenshot("looking-for-recoveries addition Reported-link.png");
                fail("Did not see the recoveries addition Reported link!");
            }
            recoveriesPage.recoveriesReportedAdditionsGrossLink.sendKeys("");
            recoveriesPage.recoveriesReportedAdditionsGrossLink.click();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 }
