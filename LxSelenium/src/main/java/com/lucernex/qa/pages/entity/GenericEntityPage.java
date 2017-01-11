package com.lucernex.qa.pages.entity;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * Created by salomem on 5/5/14.
 */
public class GenericEntityPage {
    @FindBy(css = "div#tabsbar")
    public WebElement entityTabBar;         //  1st level tab bar

    //@FindBy(css = "li.current-menu-item")
    @FindBy(css = "li.starting-menu1-item")
    public WebElement activeEntityTab;      //  Active 1st level tab

    @FindBy(css = "li.current-menu-item > ul.nav2")
    public WebElement secondLevelTabBar;

    @FindBy(css = "li.starting-menu2-item")
    public WebElement activeSecondLevelTab; //  Active 2nd level tab

    @FindBy(css = "#prjBanner")
    public WebElement currentEntityBanner;

    @FindBy(css = "div.x-tab-strip-wrap")
    public WebElement subTabBar;            //  3rd level tab bar

    @FindBy(css = "li.x-tab-strip-active")
    public WebElement activeSubTab;         //  Active 3rd level tab

}
