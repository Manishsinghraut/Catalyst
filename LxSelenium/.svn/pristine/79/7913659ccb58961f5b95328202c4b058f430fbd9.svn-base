package com.lucernex.qa.pages.components;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * Created by salomem on 3/29/14.
 */
public class AddItemPopupPage {//extends InBrowserPopupPage {
    @FindBy(css = "div.lxmodalwindow div.x-panel-body-noheader > div.frmError")
    public WebElement   errorMsgLabel;

    @FindBy(id="ShortName_label")
    public WebElement   nameLabelField;

    @FindBy(name="ShortName")
    public WebElement   nameInputField;

    @FindBy(id="ActualLongName_label")
    public WebElement   descriptionLabelField;

    @FindBy(name="ActualLongName")
    public WebElement   descriptionInputField;

    @FindBy(xpath="//div[contains(@class,'x-panel-fbar')]//button[contains(text(),'Add')]")
    public WebElement   addButton;

    @FindBy(xpath = "//button[contains(text(),'Cancel')]")
    public WebElement   cancelButton;

    @FindBy(partialLinkText = "<View Duplicate Item>")
    public WebElement duplicateLink;
}
