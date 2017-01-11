package com.lucernex.qa.views.admin.ManageScheduleTemplate;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.pages.admin.ManageScheduleTemplate.TemplateDetailsPage;
import com.lucernex.qa.utils.AjaxEnabledPageFactory;
import com.lucernex.qa.views.BaseView;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertNotNull;

/**
 * Represents the page you see when you navigate Admin->Manage Schedule Templates->Template Details.
 */
public class TemplateDetailsView extends BaseView {
    private static final TemplateDetailsPage templateDetailsPage = AjaxEnabledPageFactory.ajaxInitElements(BrowserDriver.getCurrentDriver(), TemplateDetailsPage.class);

    /**
     * Returns a list of the names of TaskItem links.
     */
    public static List<String> getTaskItems() {
        List<String> names = new ArrayList<>();

        for (WebElement link : templateDetailsPage.taskItemLinks) {
            names.add(link.getText());
        }

        return names;
    }

    /**
     * Attempts to click on the TaskItem link identified by the specified name.
     *
     * @param taskItemName - name of desired TaskItem link
     *
     * @return true if specified TaskItem found otherwise false
     */
    public static boolean clickTaskItemLink(String taskItemName) {
        assertNotNull(taskItemName);

        for (WebElement link : templateDetailsPage.taskItemLinks) {
            if (taskItemName.equals(link.getText())) {
                link.click();
                return true;
            }
        }

        return false;
    }

    /**
     * Attempts to select the specified schedule template by name.
     *
     * @param templateName - name of desired schedule template
     *
     * @return true if specified template found otherwise false
     */
    public static boolean chooseScheduleTemplate(String templateName) {
        assertNotNull(templateName);

        WebElement we = templateDetailsPage.templateSelect;

        assertNotNull(we);

        try {
            Select select = new Select(we);

            select.selectByVisibleText(templateName);

            return true;
        } catch (NoSuchElementException e) {
            return false;
        }
    }
}
