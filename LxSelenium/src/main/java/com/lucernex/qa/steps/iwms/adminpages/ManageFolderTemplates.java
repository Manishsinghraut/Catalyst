package com.lucernex.qa.steps.iwms.adminpages;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.adminpages.folderadministration.ManageFolderTemplatesView;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import cucumber.api.java.en.And;
import org.eclipse.persistence.jpa.jpql.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.util.List;
import java.util.logging.Logger;

/**
 * Created by RLE0097 on 3/21/2015.
 */
public class ManageFolderTemplates {
    private static final Logger logger = Logger.getLogger(ManageFolderTemplates.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    @And("^I see the created folder \"([^\"]*)\"$")
    public void I_see_the_created_folder(String strFolderName) throws Throwable {
        ManageFolderTemplatesView.verifyCreatedFolder(strFolderName);
    }

    @And("^I verified that deleted folder \"([^\"]*)\" does not exist$")
    public void I_verified_that_deleted_folder_does_not_exist(String strFolderName) throws Throwable{
        ManageFolderTemplatesView.verifyDeletedFolder(strFolderName);
    }

    @And("^I see the assign template folder structure \"([^\"]*)\"$")
    public void I_see_the_assign_template_folder_structure(String strFolderName) throws Throwable {
        ManageFolderTemplatesView.verifyAssignTemplateFolder(strFolderName);
    }

    @And("^I apply folder template from select field$")
    public void I_apply_folder_template_from_select_field(List<Field> fields) throws Throwable{
        ManageFolderTemplatesView.selectFolderTemplate(fields);
    }

    @And("^I expand Group on task name$")
    public void I_expand_Group_on_task_name() throws Throwable {
        AllContractPagesView.switchToFrame();
        try {

//            try {
//                int size = BrowserDriver.getCurrentDriver().findElements(By.tagName("td")).size();
//                int count = 0;
//                for (WebElement ele : BrowserDriver.getCurrentDriver().findElements(By.tagName("td"))) {
//                    count++;
//                    if ((count % 2)==1) {
//                        ele.click();
//                    } else {
//                        TestCase.fail("Group task name does  not exist");
//                    }
//                }
//
//            } catch (Exception e) {
//                BaseView.takeScreenshot("I_expand_Group_on_task_name.png");
//                Assert.fail(e.getMessage());
//            }
//            List<WebElement> ele = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("img[class=\"x-tree-elbow-img x-tree-elbow-end-plus x-tree-expander\"]"));
            for (WebElement ele : BrowserDriver.getCurrentDriver().findElements(By.tagName("img"))) {
//                if (ele.size()==2)
                if(ele.getAttribute("class").contains(" x-tree-elbow-img x-tree-elbow-end-plus x-tree-expander"))
                    ele.click();
//                else
//                    TestCase.fail("Group task name does  not exist");
            }


        } catch (Exception e) {
            BaseView.takeScreenshot("I_expand_Group_on_task_name.png");
            Assert.fail(e.getMessage());
        }
    }
}
