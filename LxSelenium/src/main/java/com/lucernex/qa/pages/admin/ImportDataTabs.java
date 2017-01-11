package com.lucernex.qa.pages.admin;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;

/**
 * Represents the tabs available under the [Admin/Import Data] page.
 */
public class ImportDataTabs {
    @FindBy(how = How.CSS, using = "a[href$='admin/Messenger.jsp']")
    public WebElement importDataTab;

    @FindBy(how = How.CSS, using = "a[href$='admin/Messenger.jsp?formSubmit=fileDownload']")
    public WebElement spreadsheetsTab;

    @FindBy(how = How.CSS, using = "a[href$='admin/MessengerScheduleJobEdit.jsp?']")
    public WebElement scheduleJobTab;

    @FindBy(how = How.CSS, using = "a[href$='admin/JobLogEdit.jsp?']")
    public WebElement jobLogTab;
}
