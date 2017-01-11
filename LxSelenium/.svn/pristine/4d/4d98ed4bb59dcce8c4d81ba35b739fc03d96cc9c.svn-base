package com.lucernex.qa.views.components;

import org.openqa.selenium.WebElement;

import static com.google.common.base.Strings.isNullOrEmpty;
import static junit.framework.Assert.assertFalse;

/**
 * Represents a radio button which is not part of a radio button group.
 */
public class RadioButtonField extends Field {
    /**
     * Returns "true" or "false" depending on the radio button's current state.
     */
    public String getValue() {
        return getElement().getAttribute("value");
    }

    /**
     * Sets the radio button's current value.
     *
     * @param value - should be "true" or "false"
     */
    public void setValue(String value) {
        assertFalse(String.format("Illegal argument value '%s' for radio button", value), isNullOrEmpty(value));

        String currentValue = getValue();

        if (currentValue != null && currentValue.equalsIgnoreCase(value)) {
            return; // radio button is already in desired state.
        }

        if (value.equalsIgnoreCase("true")) {
            getElement().click();
        }
    }

    public RadioButtonField() {
    }

    public RadioButtonField(boolean required, String label, String name, WebElement element) {
        super(required, label, name, element);
    }
}
