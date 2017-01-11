package com.lucernex.qa.pages.iwms.adminpages.companyadministration.managecustomlist;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;

/**
 * IWMS Customlist page.
 */
public class CustomListPage {

    @FindBy(how = How.CSS, using = "input[value=' >> '][onclick='addNumericConstant(this.form)']")
    public WebElement moveNumericField;

    @FindBy(how = How.CSS, using = "input[value=' >> '][onclick='addSelectedField(this.form)']")
    public WebElement moveSelectedField;

    @FindBy(how = How.CSS, using = "input[value='Save Layout']")
    public WebElement saveLayout;

    @FindBy(how = How.XPATH, using = "//div[starts-with(@id,'customListGrid')]//span[text()='Add']")
    public WebElement addLineItemsToForm;

    @FindBy(how = How.XPATH, using = "//div[starts-with(@id,'customListGrid')]//span[text()='Add']")
    public WebElement addLineItem;

    @FindBy(how = How.CSS, using = "div[id^='customListGrid'] input[name^='textfield']")
    public WebElement labelName;
}