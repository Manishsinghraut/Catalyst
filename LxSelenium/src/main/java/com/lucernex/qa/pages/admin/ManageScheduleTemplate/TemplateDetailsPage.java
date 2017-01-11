package com.lucernex.qa.pages.admin.ManageScheduleTemplate;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;

import java.util.List;

/**
 * Represents the page you see when you navigate [Admin->Manage Schedule Templates->Template Details].
 */
public class TemplateDetailsPage {
    @FindBy(how = How.CSS, using = "select#projectEntityID")
    public WebElement templateSelect;

    @FindBy(how = How.CSS, using = "form[name='scheduleForm'] td[class='dataNormalHdr'] a")
    public List<WebElement> taskGroupinks;

    @FindBy(how = How.CSS, using = "form[name='scheduleForm'] td[class='dataNormal'] a")
    public List<WebElement> taskItemLinks;
}
