package com.lucernex.qa.views.components;

import org.openqa.selenium.WebElement;

import static junit.framework.Assert.assertTrue;

/**
 * Represents a simple text field.
 */
public class TextField extends Field {
    @Override
    public void setValue(String value) {
        if (value != null) {
            assertTrue(element != null);
            element.sendKeys(value);
        }
    }

    public TextField(boolean required, String label, String name, WebElement element) {
        super(required, label, name, element);
    }

    public TextField() {
    }
}
