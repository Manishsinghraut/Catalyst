package com.lucernex.qa.views.components;

import org.openqa.selenium.WebElement;

import static com.google.common.base.Strings.isNullOrEmpty;
import static org.junit.Assert.fail;

/**
 * Represents an independent checkbox field (not a member of a group).
 */
public class CheckBoxField extends Field {
    /**
     * Set the value of the checkbox.
     *
     * @param value - selection value ["true" or "false"]
     */
    public void setValue(String value) {
        if (isNullOrEmpty(value)) {
            return;
        }

        try {
            boolean selected = Boolean.parseBoolean(value);

            if (element.isSelected()) {
                if (!selected) {
                    element.click();
                }
            } else {
                if (selected) {
                    element.click();
                }
            }
        } catch (Exception e) {
            fail(e.getMessage());
        }
    }

    public CheckBoxField(boolean required, String label, String name, WebElement element) {
        super(required, label, name, element);
    }

    public CheckBoxField() {
        super();
    }
}
