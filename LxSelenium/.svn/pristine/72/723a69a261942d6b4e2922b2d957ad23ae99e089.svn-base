package com.lucernex.qa.pages;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;

/**
 * First page of pair of IWMS login pages.
 */
public class Login1Page {
    @FindBy(how = How.NAME, using = "authLoginName")
    public WebElement userNameField;

    @FindBy(how = How.NAME, using = "authLoginFirmName")
    public WebElement firmNameField;

    //UI changed
    /*@FindBy(how = How.CLASS_NAME, using = "loginbutton")
    public WebElement proceedButton;*/

    @FindBy(how = How.CSS, using = "input[value='Proceed']")
    public WebElement proceedButton;
}
