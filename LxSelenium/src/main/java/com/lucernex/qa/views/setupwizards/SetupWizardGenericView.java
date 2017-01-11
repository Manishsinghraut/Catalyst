package com.lucernex.qa.views.setupwizards;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.logging.Logger;

import static org.junit.Assert.fail;

/**
 * Created by sowmya on 05/09/2014.
 */
public class SetupWizardGenericView {

    private static final Logger logger = Logger.getLogger(SetupWizardGenericView.class.getName());

    public static void selectFolderTemplateFromList (String folderTemplate) {
        try{
            BaseView.selectFromList(By.name("entityTemplateID"),folderTemplate);
        }catch(Exception e){
            BaseView.takeScreenshot("UnableToSelectFolderFromList.png");
            fail("Error in selecting an option "+folderTemplate+" from list "+e.getMessage());
        }
    }

    public static void selectTemplateFromList (String template) {
        try{
            BaseView.selectFromList(By.name("entityTemplateID"),template);
        }catch(Exception e){
            BaseView.takeScreenshot("UnableToSelectFolderFromList.png");
            fail("Error in selecting an option "+template+" from list "+e.getMessage());
        }
    }

    public static void selectPortfolioFromList (String portfolio) {
        try{
            BaseView.selectFromList(By.name("srcProgramID"),portfolio);
        }catch(Exception e){
            BaseView.takeScreenshot("UnableToSelectPortfolioFromList.png");
            fail("Error in selecting an option "+portfolio+" from list "+e.getMessage());
        }
    }

    public static void selectProjectTemplate (String template) {
        try {
            BaseView.selectFromList(By.name("projTemplateID"), template);
        } catch (Exception e) {
            BaseView.takeScreenshot("UnableToSelectTemplateFromList.png");
            fail("Error in selecting an option " + template + " from list " + e.getMessage());
        }
    }

    public static void selectProgramTemplate (String template) {
        try{
            BaseView.selectFromList(By.name("entityTemplateID"),template);
        }catch(Exception e){
            BaseView.takeScreenshot("UnableToSelectTemplateFromList.png");
            fail("Error in selecting an option "+template+" from list "+e.getMessage());
        }
    }

    public static void checkProject(String projectName) throws Throwable {
        try {
            BrowserDriver.getCurrentDriver().findElement(By.xpath("//td//div[contains(text(),'" + projectName + "')]/parent::td/preceding-sibling::td[1]//div/img")).click();
        } catch (Exception Ex) {
            BaseView.takeScreenshot("checkProject.png");
            logger.info("Error :" + Ex.getMessage());
            org.junit.Assert.fail("Error :" + Ex.getMessage());
        }
    }

    public static void deleteIncompleteWizard() throws Throwable {
        try {
            BaseView.pushVeryShortTimeout();
            try {
                WebElement modalWindow = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div.x-css-shadow+div.x-window"));
                modalWindow.findElement(By.partialLinkText("Delete")).click();
                CommonMethods.waitTillDivisionLoads();
            } catch (Exception e) {
            }
        } catch (Exception Ex) {
            BaseView.takeScreenshot("deleteIncompleteWizard.png");
            logger.info("Error :" + Ex.getMessage());
        }finally {
            BaseView.popDefaultTimeout();
        }
    }
}
