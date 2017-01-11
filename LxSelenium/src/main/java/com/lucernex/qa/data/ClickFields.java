package com.lucernex.qa.data;

public class ClickFields {
	private String locator;
    private String element;

    public String getLocator() {
        return locator;
    }

    public void setName(String locator) {
        this.locator = locator;
    }

    public String getElement() {
        return element;
    }

    public void setElement(String element) {
        this.element = element;
    }

    @Override
    public String toString() {
        return "Field{" +
                "locator='" + locator + '\'' +
                ", element='" + element + '\'' +
                '}';
    }

    public ClickFields(String locator, String element) {
        this.locator = locator;
        this.element = element;
    }

    public ClickFields() {
    }
}
