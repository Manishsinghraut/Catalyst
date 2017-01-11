package com.lucernex.qa.views.components;

import org.openqa.selenium.WebElement;

import static junit.framework.Assert.fail;

/**
 * Represents a field in a lx modal window.
 */
abstract public class Field {
    protected boolean required;
    protected String label;
    protected String name;
    protected WebElement element;

    public boolean isRequired() {
        return required;
    }

    public String getLabel() {
        return label;
    }

    public String getName() {
        return name;
    }

    public String getValue() {
        if (element == null) {
            return null;
        } else {
            String tag = element.getTagName();

            if ("input".equals(tag)) {
                return element.getAttribute("value");
            } else {
                fail(String.format("Getting a value for tag '%s' is not supported!", tag));
                return null;
            }
        }
    }

    abstract public void setValue(String value);

    public WebElement getElement() {
        return element;
    }

    @Override
    public String toString() {
        return "Field{" +
                "required=" + required +
                ", label='" + label + '\'' +
                ", name='" + name + '\'' +
                ", element=" + element +
                '}';
    }

    protected Field(boolean required, String label, String name, WebElement element) {
        this.required = required;
        this.label    = label;
        this.name     = name;
        this.element  = element;
    }

    protected Field() {
    }
}
