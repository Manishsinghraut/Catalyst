package com.lucernex.qa.pages.iwms.contract;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;

/**
 * Created by RLE0239 on 5/14/2015.
 */
public class AllContractPagesPage {

//    @FindBy(how = How.CSS,using = "div#gidPanel_header div[id^='title'] .x-title-text")
    @FindBy(how = How.CSS,using = ".x-title-text")
    public WebElement title;

    @FindBy(how = How.CSS,using = ".x-panel-header-title .x-title-text.x-title-text-default.x-title-item")
    public WebElement panelHeader;

    @FindBy(how = How.CSS,using = "div.x-box-mc")
    public WebElement successMsg;

    @FindBy(how = How.CSS,using = "span#msgCloser img")
    public WebElement msgCloser;

    @FindBy(how = How.CSS,using = "div.x-box-mc span.frmError")
    public WebElement errorMsg;

    @FindBy(how = How.NAME,using = "searchText")
    public WebElement searchTextField;

    @FindBy(how = How.CSS,using = ".tblHeader")
    public WebElement tblHeader;

    @FindBy(how = How.CSS,using = "div[id^='messagebox'][class='x-component x-window-text x-box-item x-component-default']")
    public WebElement generateRentMsg;

    @FindBy(how = How.NAME,using = "batchNumbr")
    public WebElement batchNumbr;

    @FindBy(how = How.ID,using = "PaymentTransaction_SourceEntityTable_span")
    public WebElement batchID;

    @FindBy(how = How.CSS,using = "input[name='PercentageRent_NaturalBreakpointFlag'][value='false']")
    public WebElement artificialBreakpoint;

}