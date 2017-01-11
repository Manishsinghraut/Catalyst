package com.lucernex.qa.pages.entity.contract.paymentinfo.receipts;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;

/**
 * Created by sergeym on 9/5/2014.
 */
public class ReceiptsPage {

    @FindBy(how = How.CSS, using = "span[class='x-window-header-text']")
    public WebElement errorAlert;

    @FindBy(how = How.NAME, using = "PaymentReceipt_AmountNotAllocated")
    public WebElement amountNotAllocated;

    @FindBy(how = How.XPATH, using = ".//*[@id='ContractReceiptReconciliationDiv']/div/div/div[2]/div/div/div[1]/div/div/table/thead/tr/td[1]/div/div")
    public WebElement allCheckBox;

}
