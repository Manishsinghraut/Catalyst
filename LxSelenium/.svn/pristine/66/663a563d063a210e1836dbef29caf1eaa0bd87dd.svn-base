package com.lucernex.qa.pages.admin;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;

public class SpreadsheetsPage {
    @FindBy(how = How.CSS, using = "div#main select[name='handlerType']")
    public WebElement templateSelect;

    // This selector is only visible when templateSelect == 'Contract Data'
    @FindBy(how = How.CSS, using = "div#contractListDiv select[name='contractList']")
    public WebElement contractSelect;


    @FindBy(how = How.CSS, using = "#main > form > table > tbody > tr > td > table > tbody > tr:nth-child(2) > td > div > input")
    public WebElement downloadButton;
}
