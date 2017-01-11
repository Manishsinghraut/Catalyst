package com.lucernex.qa.entity.contract.paymentinfo.receipts;

import com.lucernex.qa.utils.Navigation;
import com.lucernex.qa.views.components.ActionsView;
import com.lucernex.qa.views.components.LxModalWindow;
import com.lucernex.qa.views.components.PortfolioNavigationView;
import com.lucernex.qa.views.entity.contract.paymentinfo.receipts.ReceiptsPageView;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;

//import static com.lucernex.qa.utils.ForceWaitForItem.delay;

/**
 * Created by sergeym on 9/5/2014.
 */
public class ReceiptsStep {
    @And("^I see alert box with message \"([^\"]*)\"$")
    public void I_see_alert_box_with_message(String arg1) throws Throwable {
        ReceiptsPageView.checkForAlertMessage(arg1);
    }

    @And("^I see Amount Not Allocated is zero$")
    public void I_see_Amount_Not_Allocated_is_zero() throws Throwable {
        ReceiptsPageView.amountNotAllocatedIsZero();
    }

    @And("^I see Amount Not Allocated is not zero$")
    public void I_see_Amount_Not_Allocated_is_not_zero() throws Throwable {
        ReceiptsPageView.amountNotAllocatedIsNotZero();
    }

    @And("^I delete \"([^\"]*)\" contract from \"([^\"]*)\" folders$")
    public void I_delete_contract_from_folders(String contractName, String folder) throws Throwable {
        //1. navigate to facilities
        Navigation.navigateTo("Contract");
        Navigation.navigateTo("Details");
        Navigation.navigateTo("Summary");

        //2. portfolio navigation
        if(!PortfolioNavigationView.navigateToLinkInFolder(folder, contractName)) {
            return;
        }

        //3.Click on Edit action button
        ActionsView.edit();
//        delay(1000);
        //4.Click on Delete action button
        ActionsView.delete();
//        delay(1000);
        //5.Click on "Yes" button
        LxModalWindow.clickButton("Yes");

        //6. Delete facility
        StringBuffer sb = new StringBuffer();
        sb.append("Delete Contract \"");
        sb.append(contractName);
        sb.append("\" and all data");
        LxModalWindow.clickButton(sb.toString());
    }

    @Given("^I navigate to folders \"([^\"]*)\" and contract \"([^\"]*)\"$")
    public void I_navigate_to_folders_and_contract(String folder, String contractName) throws Throwable {
        PortfolioNavigationView.navigateToLinkInFolder(folder, contractName);
    }

    @And("^I select check All Checkbox$")
    public void I_select_check_All_Checkbox() throws Throwable {
        ReceiptsPageView.checkAllCheckbox();
    }

    @And("^I click on the \"([^\"]*)\" button and wait$")
    public void I_click_on_the_button_and_wait(String button) throws Throwable {
        LxModalWindow.clickButton(button);
//        delay(4000);
    }
}
