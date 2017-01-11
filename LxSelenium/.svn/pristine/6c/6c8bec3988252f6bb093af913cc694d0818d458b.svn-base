package com.lucernex.qa.views.components;

import org.openqa.selenium.WebElement;

/**
 * Represents a simple text field.
 */
public class ReadOnlyField extends Field {

    @Override
    public void setValue(String value) {
        throw new UnsupportedOperationException("Cannot set value for READ ONLY field");
    }

    public ReadOnlyField(boolean required, String label, String name, WebElement element) {
        super(required, label, name, element);
    }

    public ReadOnlyField() {
    }
}
