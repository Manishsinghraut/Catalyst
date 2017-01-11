package com.lucernex.qa.pages;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;

/**
 * IWMS home page.
 */
public class HomePage {
    @FindBy(how = How.ID, using = "m1_Program")
    public WebElement programMenuItem;

    @FindBy(css = "#m1_Program")
    public WebElement portfolioTab;
    @FindBy(css = "#m1_CapitalProgram")
    public WebElement programTab;
    @FindBy(css = "#m1_Prototype")
    public WebElement prototypeTab;
    @FindBy(css = "#m1_PotentialProject")
    public WebElement siteTab;
    @FindBy(css = "#m1_Project")
    public WebElement projectTab;
    @FindBy(css = "#m1_Location")
    public WebElement locationTab;
    @FindBy(css = "#m1_Parcel")
    public WebElement parcelTab;
    @FindBy(css = "#m1_Facility")
    public WebElement facilitytab;
    @FindBy(css = "#m1_CapitalProject")
    public WebElement capitalProjectTab;
    @FindBy(css = "#m1_Contract")
    public WebElement contractTab;
    @FindBy(css = "#m1_MyLinks")
    public WebElement myLinksTab;
    @FindBy(css = "div#lx-hpicker-div[style*=\"display: block;\"] > select#lx-hpicker")
    public WebElement fourthLevelMenuSelect;


    @FindBy(how = How.ID, using = "reportsBtn")
    public WebElement reportsButton;

    @FindBy(how = How.ID, using = "calendarBtn")
    public WebElement calendarButton;

    @FindBy(how = How.ID, using = "dashboardBtn")
    public WebElement dashboardButton;

    @FindBy(how = How.ID, using = "portfolioBtn")
    public WebElement myPortfolioButton;

    @FindBy(css = "[name=Tools]")
    public WebElement toolsButton;

    @FindBy(css = "[name=~~Tools#~]")
    public WebElement tildaToolsButton;

    @FindBy(css = "div.x-menu > ul.x-menu-list")
    public WebElement toolsDropDown;

    @FindBy(how = How.ID, using = "adminBtn")
    public WebElement adminButtonParent;

    @FindBy(css = "[name=searchText]")
    public WebElement searchInputBox;
    @FindBy(css = "#advSearchDiv")
    public WebElement spyGlass;

    @FindBy(how = How.ID, using = "footerHtml")
    public WebElement footerDiv;

    // Appears in top-right corner of IWMS pages and its value is the firm name.
    @FindBy(how = How.ID, using = "firm_text")
    public WebElement firmSpan;
}
