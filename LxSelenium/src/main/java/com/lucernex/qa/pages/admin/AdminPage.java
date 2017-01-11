package com.lucernex.qa.pages.admin;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;

public class AdminPage {
    @FindBy(how = How.CSS, using = ".frmHeader")
    public WebElement systemAdministratorDashboardLabel;

    @FindBy(how = How.ID, using = "footerHtml")
    public WebElement footerDiv;

    @FindBy(how = How.ID, using = "div#msgRow")
    public WebElement messageDiv;

    @FindBy(partialLinkText = "Job Function Code")
    public WebElement jobFunctionCode;

    @FindBy(partialLinkText = "Job Title Code")
    public WebElement jobTitleCode;

    @FindBy(partialLinkText = "User Class Code")
    public WebElement userClassCode;

    @FindBy(css = "div.x-tab-strip-wrap")
    //@FindBy(how = How.CSS, using = "div#main")
    public WebElement tabsDiv;

    @FindBy(how = How.CSS, using = "div[id^=BOGridLX_]")
    public WebElement gridDiv;

    @FindBy(how = How.CSS, using = "div[id^=BOListExtGrid]")
    public WebElement innerGridDiv;

    @FindBy(how = How.CSS, using = "div.x-window-bl")
    public WebElement modalWindowTopDiv;

    //  The modal window that's on top always has a shadow immediately before it.
    //  We will use the shadow to always find the active modal window.
    @FindBy(how = How.CSS, using = "div.x-css-shadow+div.x-window")
    public WebElement modalWindowDiv;

    //@FindBy(how = How.CSS, using = "div.x-shadow + div.x-window span.x-window-header-text")
    @FindBy(how = How.CSS, using = "div.x-css-shadow+div.x-window div.x-title-text")
    public WebElement modalWindowLabelDiv;

    @FindBy(how = How.CSS, using = "div.x-resizable-pinned")
    public WebElement confirmWindowDiv;

    @FindBy(how = How.ID, using = "errMsg")
    public WebElement Error;

    @FindBy(how = How.PARTIAL_LINK_TEXT, using = "Manage Members/Contacts")
    public WebElement manageMembersContacts;

    @FindBy(how=How.CSS, using=".tblHeader>font")
    public WebElement modalWindowInnerText;
}
