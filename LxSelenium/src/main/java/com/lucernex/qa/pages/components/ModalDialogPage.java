package com.lucernex.qa.pages.components;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

/**
 * Matches DOM elements which are known to be ext-js modal dialogs.
 */
public class ModalDialogPage {
    @FindBy(css = "div[id^='lxmodalwindow-'] div.x-title-text")
    public WebElement title;

    @FindBy(css = "div[id^='lxmodalwindow-'] div[id^='toolbar-'] a.x-btn")
    public List<WebElement> buttonLinks;

    @FindBy(css = "div[id^='lxmodalwindow-'] div[id^='toolbar-'] a.x-btn span.x-btn-inner")
    public List<WebElement> buttonLabels;

    @FindBy(css = "div[id^='lxmodalwindow-'] form td.fieldLabel")
    public List<WebElement> fieldLabelTDs;

    @FindBy(css = "div[id^='lxmodalwindow-'] form")
    public WebElement form;
}
