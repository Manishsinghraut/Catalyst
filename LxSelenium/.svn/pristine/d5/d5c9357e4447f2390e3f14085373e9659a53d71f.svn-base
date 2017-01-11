package com.lucernex.qa.views.components;

import org.openqa.selenium.WebElement;

import static junit.framework.Assert.assertTrue;

/**
 * Represents a textarea field.
 */
public class TextareaField extends Field {
    @Override
    public void setValue(String value) {
        if (value != null) {
            assertTrue(element != null);
            element.sendKeys(value);
        }
    }

    public TextareaField(boolean required, String label, String name, WebElement element) {
        super(required, label, name, element);
    }

    public TextareaField() {
    }
}
