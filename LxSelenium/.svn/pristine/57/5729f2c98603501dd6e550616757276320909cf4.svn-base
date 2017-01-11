package com.lucernex.qa.views.admin.ManageScheduleTemplate;

import com.google.common.collect.ImmutableMap;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.pages.admin.ManageScheduleTemplate.UpdatePortfolioPage;
import com.lucernex.qa.utils.AjaxEnabledPageFactory;
import org.openqa.selenium.WebElement;

import static com.google.common.base.Strings.isNullOrEmpty;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

/**
 * Represents the page you see when you navigate [Admin->Manage Schedule Templates->Update Portfolio].
 */
public class UpdatePortfolioView {
    private static final UpdatePortfolioPage updatePortfolioPage = AjaxEnabledPageFactory.ajaxInitElements(BrowserDriver.getCurrentDriver(), UpdatePortfolioPage.class);

    private static ImmutableMap<String,String> label2name = ImmutableMap.<String, String>builder()
        .put("Update Assignees for not begun tasks?", "updateAssignees")
        .put("Update Notifications for not begun tasks?", "updateNotifications")
        .put("Update Dates/Predecessors for not begun tasks and create missing tasks?", "updateDates")
        .put("Only show entities with a change?", "showModified")
        .build();

    /**
     * Clicks the specified update options checkbox.
     *
     * @param updateOptionsCheckboxLabel - user oriented label for desired checkbox
     *
     * @return true if checkbox was found otherwise false
     */
    public static boolean clickUpdateOptionsCheckbox(String updateOptionsCheckboxLabel) {
        assertNotNull(updateOptionsCheckboxLabel);

        String checkboxName = label2name.get(updateOptionsCheckboxLabel);

        assertNotNull(String.format("Checkbox not found with label '%s'", updateOptionsCheckboxLabel), updateOptionsCheckboxLabel);

        for (WebElement checkbox : updatePortfolioPage.updateOptionsCheckboxes) {
            String actualName = checkbox.getAttribute("name");

            if (actualName != null && actualName.equals(checkboxName)) {
                checkbox.click();
                return true;
            }
        }

        return false;
    }

    private static String getButtonLabel() {
        String actualLabel = updatePortfolioPage.button.getText();

        if (isNullOrEmpty(actualLabel)) {
            actualLabel = updatePortfolioPage.button.getAttribute("value");
        }

        return actualLabel;
    }

    public static void clickButton(String buttonLabel) {
        assertNotNull(buttonLabel);

        String actualLabel = getButtonLabel();

        assertEquals(buttonLabel, actualLabel);

        updatePortfolioPage.button.click();
    }

    public static boolean waitForButton(String buttonLabel) {
        for (int attempt = 0; attempt < 10; attempt++) {
            String actualLabel = getButtonLabel();

            if (actualLabel.contains(buttonLabel)) {
                return true;
            }

            try {
                Thread.sleep(2000l);
            } catch (InterruptedException e) {
                // ignore
            }
        }

        return false;
    }
}
