package com.lucernex.qa.pages.admin.ManageScheduleTemplate;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;

import java.util.List;

/**
 * Represents the page you see when you navigate [Admin->Manage Schedule Templates->Update Portfolio].
 */
public class UpdatePortfolioPage {
    @FindBy(how = How.CSS, using = "select#projectEntityID")
    public WebElement templateSelect;

    @FindBy(how = How.CSS, using = "div#mainwrappernoframe input[type=checkbox]")
    public List<WebElement> updateOptionsCheckboxes;

    @FindBy(how = How.CSS, using = "div#mainwrappernoframe input[onclick*=CascadeScheduleTemplate]")
    public WebElement button;
}
