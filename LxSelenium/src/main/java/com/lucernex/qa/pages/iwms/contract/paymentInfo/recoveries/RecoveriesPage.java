package com.lucernex.qa.pages.iwms.contract.paymentInfo.recoveries;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;

/**
 * Created by RLE0239 on 9/24/2015.
 */
public class RecoveriesPage {

    @FindBy(how = How.CSS,using = "#expRec_ExpenseRecovery_ReportedControllableExpensesNet a")
    public WebElement groupedExpenseReportedLink;

    @FindBy(how = How.CSS,using = "#expRec_ExpenseRecovery_ApprovedControllableExpensesNet a")
    public WebElement groupedExpenseApprovedLink;

    @FindBy(how = How.CSS,using = "#expRec_ExpenseRecovery_ReportedNonControllableExpensesNet a")
    public WebElement additionalExpenseReportedLink;

    @FindBy(how = How.CSS,using = "#expRec_ExpenseRecovery_ApprovedNonControllableExpensesNet a")
    public WebElement additionalExpenseApprovedLink;

    @FindBy(how = How.CSS,using = "#expRec_ExpenseRecovery_ReportedDeductionsGross a")
    public WebElement deductionsReportedLink;

    @FindBy(how = How.CSS,using = "#expRec_ExpenseRecovery_ReportedDeductionsNet a")
    public WebElement deductionsReportedNetLink;

    @FindBy(how = How.CSS,using = "#expRec_ExpenseRecovery_ReportedRecoveriesGross a")
    public WebElement recoveriesReportedLink;

    @FindBy(how = How.CSS,using = "#expRec_ExpenseRecovery_ReportedAdditionsGross a")
    public WebElement recoveriesReportedAdditionsGrossLink;

    @FindBy(how = How.CSS,using = "#expRec_ExpenseRecovery_ReportedRecoveriesNet a")
    public WebElement recoveriesReportedNetLink;

    @FindBy(how = How.CLASS_NAME,using = "x-box-mc")
    public WebElement msg;

    @FindBy(how = How.CLASS_NAME,using = "x-box-tc")
    public WebElement successMsg;

    @FindBy(how = How.ID,using = "submitBtn")
    public WebElement submitBtn;
}
