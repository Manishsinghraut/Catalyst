package com.lucernex.qa.admin;

import com.lucernex.qa.views.admin.AdminGridView;
import com.lucernex.qa.views.admin.AdminPageView;
import com.lucernex.qa.views.components.AddItemPopupView;
import com.lucernex.qa.views.components.EXTListView;
import com.lucernex.qa.views.components.InBrowserPopupView;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;

import java.util.List;

import static junit.framework.Assert.*;

/**
 * Created by salomem on 3/24/14.
 */
public class ManageDefinedFieldsSteps {
    //@Then("^I see the Job Function Code link is \"([^\"]*)\"$")
    public void I_see_the_Job_Function_Code_link_is(String visibility) {
        if(visibility.equals("visible")) {
            AdminPageView.verifyJobFunctionCodeDisplayed();
        } else {
            AdminPageView.verifyJobFunctionCodeNotDisplayed();
        }
    }

    //@Then("^I see the Job Title Code link is \"([^\"]*)\"$")
    public void I_see_the_Job_Title_Code_link_is(String visibility) {
        if(visibility.equals("visible")) {
            AdminPageView.verifyJobTitleCodeDisplayed();
        } else {
            AdminPageView.verifyJobTitleCodeNotDisplayed();
        }
    }

    //@Then("^I see the User Class Code link is \"([^\"]*)\"$")
    public void I_see_the_User_Class_Code_link_is(String visibility) {
        if(visibility.equals("visible")) {
            AdminPageView.verifyUserClassCodeDisplayed();
        } else {
            AdminPageView.verifyUserClassCodeNotDisplayed();
        }
    }

    //@When("^I see the Job Function Code Popup$")
    public void I_see_the_Job_Function_Code_Popup() {
        //  Verify that Job Function Code Popup is present
        String expectedHeaderText = "Job Function Code";
        InBrowserPopupView.verifyHeaderTextEquals(expectedHeaderText);
    }

    //@Then("^I see the add button is \"([^\"]*)\"$")
    public void I_see_the_add_button_is(String visibility) {
        if(visibility.equals("visible")) {
            EXTListView.verifyAddButtonDisplayed();
        } else {
            EXTListView.verifyAddButtonNotDisplayed();
        }
    }

    //@And("^I see the view links are \"([^\"]*)\"$")
    public void I_see_the_view_links_are(String visibility) {
        if(visibility.equals("visible")) {
            EXTListView.verifyViewLinksDisplayed();
        } else {
            EXTListView.verifyViewLinksNotDisplayed();
        }
    }

    //@And("^I see the edit links are \"([^\"]*)\"$")
    public void I_see_the_edit_links_are(String visibility) {
        if(visibility.equals("visible")) {
            EXTListView.verifyEditLinksDisplayed();
        } else {
            EXTListView.verifyEditLinksNotDisplayed();
        }
    }

    @Then("^I see the \"([^\"]*)\" action links are \"([^\"]*)\"$")
    public void I_see_the_links_are(String actionLink, String visibility) {
        List<String> availActions;

        try {
            availActions = AdminGridView.getActions();
        } catch (InterruptedException e) {
            String msg = String.format("Unable to see the actions within admin grid: %s", e.getMessage());

            fail(msg);
            return;
        }

        boolean containsDelete = availActions.contains(actionLink);

        if(visibility.equals("visible")) {
            //EXTListView.verifyDeleteLinksDisplayed();
            assertTrue("Did not see the 'delete' actions when they should be visible", containsDelete);
        } else {
            //EXTListView.verifyDeleteLinksNotDisplayed();
            assertTrue("Did see the 'delete' actions when they should not be visible", !containsDelete);
        }
    }

    @And("^I close the in browser popup$")
    public void I_close_the_in_browser_popup() throws Throwable {
        InBrowserPopupView.clickClose();
    }

    //@And("^I enter \"([^\"]*)\" into the name field$")
    public void I_enter_into_the_name_field(String name) {
        //  Enter the given String into the name field
        AddItemPopupView.enterName(name);
    }

    //@And("^I enter \"([^\"]*)\" into the description field$")
    public void I_enter_into_the_description_field(String description) {
        //  Enter the given String into the description field
        AddItemPopupView.enterDescription(description);
    }

    @Then("^I see the item was successfully added with \"([^\"]*)\" and \"([^\"]*)\"$")
    public void I_see_the_item_was_successfully_added_with_and(String expectedName, String expectedDescription) {
        //  Verify the line item exists as specified
        //EXTListView.verifyItemExistsWith(expectedName, expectedDescription);

        int nameRowIndex = 0;

        try {
            nameRowIndex = AdminGridView.getGridRowIndexFromZero(0, expectedName);
        } catch (InterruptedException e) {
            String msg = String.format("Unable to see the admin grid row index: %s", e.getMessage());

            fail(msg);
            return;
        }

        System.out.println("Found index: " + nameRowIndex);
        //  Check that name is not -1
        assertTrue("Item with name, " + expectedName + ", was not found", nameRowIndex > -1);
        //  Check that the name has the expected description too
        String actualDescription = null;

        try {
            actualDescription = AdminGridView.getGridCell(nameRowIndex, 1);
        } catch (InterruptedException e) {
            String msg = String.format("Unable to see the admin grid cell: %s", e.getMessage());

            fail(msg);
            return;
        }

        assertEquals(expectedName + " is missing the expected description, " + expectedDescription, expectedDescription, actualDescription);
    }

    //@Then("^I see the item failed to be added due to it being a duplicate$")
    public void I_see_the_item_failed_to_be_added_due_to_it_being_a_duplicate() {
        AddItemPopupView.verifyMessageDisplayed("Failed to add item, an item with the exact same name may already exist");
    }

    @And("^I see the link to the duplicated item$")
    public void I_see_the_link_to_the_duplicated_item() throws Throwable {
        AddItemPopupView.verifyLinkToDuplicateDisplayed();
    }

    @Then("^I see the message \"([^\"]*)\" in the popup window$")
    public void I_see_the_message_in_the_popup_window(String expectedMessage) {
        AddItemPopupView.verifyMessageDisplayed(expectedMessage);
    }
}
