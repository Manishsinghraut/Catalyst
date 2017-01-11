package com.lucernex.qa.pages.setupwizards;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;

/**
 * Created by ToanD on 4/2/2014.
 */
public class SetupWizardAssignMembersPage {

   @FindBy(how = How.XPATH, using = "//button[text()='Assign Members']")
    public WebElement assignMembersButton;
}
