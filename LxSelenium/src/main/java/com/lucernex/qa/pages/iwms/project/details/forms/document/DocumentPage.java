package com.lucernex.qa.pages.iwms.project.details.forms.document;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * Created by RLE0097 on 30-11-2016.
 */
public class DocumentPage {
    @FindBy(xpath = ".//*[contains(./text(),'Ready for Release')]/parent::tr[1]/following-sibling::tr[1]/td/*/input")
    public WebElement 	readyForReleaseCheckBox;
}
