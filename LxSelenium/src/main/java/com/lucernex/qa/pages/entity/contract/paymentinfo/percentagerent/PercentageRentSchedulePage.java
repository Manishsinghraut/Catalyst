package com.lucernex.qa.pages.entity.contract.paymentinfo.percentagerent;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;

/**
 * @since 1.0.0
 * @author Andrew.Subichev
 */
public class PercentageRentSchedulePage {

    @FindBy(how = How.CSS, using = "select[name=CurrentSelectorDate_month]")
    public WebElement selectedMonth;

    @FindBy(how = How.CSS, using = "select[name=CurrentSelectorDate_year]")
    public WebElement selectedYear;

    @FindBy(how = How.CSS, using = "input[name=Refresh]")
    public WebElement refreshButton;

    @FindBy(how = How.CSS, using = "a#OffsetPaymentLink")
    public WebElement offsetPaymentLink;

}
