package com.lucernex.qa.views.components;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.pages.components.ModalDialogPage;
import com.lucernex.qa.utils.AjaxEnabledPageFactory;
import org.openqa.selenium.WebElement;

import java.util.List;

import static com.google.common.base.Strings.isNullOrEmpty;
import static org.junit.Assert.assertNotNull;

/**
 * Represents an ext-js modal dialog.
 */
abstract public class ModalDialogView {
    protected static final ModalDialogPage modalDialogPage = AjaxEnabledPageFactory.ajaxInitElements(BrowserDriver.getCurrentDriver(), ModalDialogPage.class);

    /**
     * Waits until the modal dialog window is visible.
     */
    abstract public void waitForModalWindow();

    /**
     * Returns the set of fields in the modal dialog's form.
     */
    abstract public List<Field> getFields();

    /**
     * Returns the set of field labels in the modal dialog's form.
     */
    abstract public List<String> getFieldLabels();

    /**
     * Sets the value of the specified field.
     *
     * @param field - the field we are to update
     * @param value - the new value for the field
     */
    abstract public void setFieldValue(Field field, String value);

    /**
     * Sets the value of the identified field.
     *
     * @param fieldLabel - identifies the field to update
     * @param value      - the new value for the field
     */
    abstract public void setFieldValue(String fieldLabel, String value);

    /**
     * Returns a list of any links present within the modal window.
     */
    public List<WebElement> getLinks() {
        return null;
    }

    /**
     * Attempts to click on the link which has the specified label.
     *
     * @param linkLabel - link's user oriented text
     *
     * @return true if link was found otherwise false
     */
    public boolean clickLink(String linkLabel) {
        assertNotNull(linkLabel);

        List<WebElement> links = getLinks();

        if (links == null || links.isEmpty()) {
            return false;
        }

        for (WebElement link : links) {
            String actualLinkLabel = link.getText();

            if (!isNullOrEmpty(actualLinkLabel) && actualLinkLabel.contains(linkLabel)) {
                link.click();
            }
        }

        return false;
    }

    /**
     * Clicks the modal dialog button which has the specified label.
     *
     * @param buttonLabel - label on button to be clicked
     */
    abstract public void clickButton(String buttonLabel);

    /**
     * Wait for processing to finish after clicking the specified modal dialog button.
     *
     * @param messsage - error message if expected result not seen
     */
    abstract public void waitForProcessingFinish(String messsage);
}
