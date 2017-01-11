package com.lucernex.qa.pages.entity.contract.paymentinfo.recoveries;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;

/**
 * Created by sergeym on 7/22/2014.
 */
public class RecoveriesPage {

    @FindBy(how = How.CSS, using = "#divExpenseRecoveryPrepaidAmount img")
    public WebElement prepaidAmountTotalButton;

    @FindBy(how = How.XPATH, using = ".//*[@id='ExpenseRecoveryPrepaidAmountDiv']/div/div/div[2]/div/div/div[1]/div/div/table/thead/tr/td[1]/div/div")
    public WebElement allCheckBox;

    @FindBy(how = How.ID, using = "total")
    public WebElement prepaidAmountTotal;

    @FindBy(how = How.NAME, using = "ExpenseRecovery_ApprovedPrePaidAmount")
    public WebElement prepaidAmountField;

    @FindBy(how = How.ID, using = "CodeRecoveryGroupID_label")
    public WebElement recoveryGroupLabel;
}
