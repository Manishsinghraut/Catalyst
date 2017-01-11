package com.lucernex.qa.pages.components;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * Created by salomem on 3/24/14.
 */
public class InBrowserPopupPage {
    @FindBy(css="div.x-window-header")
    public WebElement headerText;

    @FindBy(css="div.x-tool-close")
    public WebElement exitButton;           //  This is the small 'x' in the Top Right corner of the popup window

    //@FindBy(css="div.x-panel-fbar button")    //  'Close' is actually the 3rd button ('Prev' and 'Next' are hidden), so this doesn't work
    @FindBy(xpath="//button[contains(text(),'Close')]")
    public WebElement closeButton;
}
