package com.lucernex.qa.pages.iwms.project.details.forms;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;

import java.util.List;

/**
 * IWMS Forms page.
 */
public class FormsPage {

    @FindBy(linkText = "<Expand All>")
    public WebElement expandAllForms;

    @FindBy(linkText = "<Collapse All>")
    public WebElement collapseAllForms;

    @FindBy(how = How.CSS,using = "input[value='Close Issue']")
    public WebElement confirmFormClose;

    @FindBy(how = How.CSS,using = "input[value='Confirm']")
    public WebElement confirmFormReopen;

    @FindBy(how = How.CSS,using = "input[value='Submit']")
    public WebElement submit;

    /*@FindBy(how = How.CSS,using = "tr.tabSpacer td")
    public WebElement formActionSuccessMessage;
    */
    @FindBy(how = How.CSS,using = ".tabHeader.frmNote")
    public WebElement formActionSuccessMessage;

    @FindBy(how = How.CSS,using = ".lx-add-btn")
    public WebElement formButtons;

    @FindBy(how = How.CSS,using = "input[name='includeReplies']")
    public WebElement includeReplies;

    @FindBy(how = How.CSS,using = "img[src='/en/img/preview.gif']")
    public WebElement printPreview;
}