package com.lucernex.qa;

import com.lucernex.qa.views.components.LxModalWindow;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.openqa.selenium.By;

/**
 * Created by rupinderk on 5/28/2014.
 */
public class SetUpWizardSteps {
    @Then("^I select \"([^\"]*)\" from the list$")
    public void I_select_from_the_list(String FieldName) throws Throwable {
        LxModalWindow.setRadioFieldValue(FieldName);
    }

    @Then("^I select \"([^\"]*)\" from the Program List$")
    public void I_select_from_the_Program_List(String optionValue) throws Throwable {
       LxModalWindow.selectDropdownOption(By.name("wizardProgramID"), optionValue);
        System.out.println("Selected portfolio - clicking on the next button");
    }

    @And("^I select \"([^\"]*)\" from the default project list$")
     public void I_select_from_the_default_project_list(String optionValue) throws Throwable {
        LxModalWindow.selectDropdownOption(By.name("CodeDefaultProjectTypeID"), optionValue);
        System.out.println("Selected Default project type - clicking on the next button");
    }
}
