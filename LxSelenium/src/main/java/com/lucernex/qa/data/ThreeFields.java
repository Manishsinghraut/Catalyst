package com.lucernex.qa.data;

public class ThreeFields {
    private String locator;
    private String element;
    private String value;
    
    public String getLocator() {
        return locator;
    }

    public void setLocator(String locator) {
        this.locator = locator;
    }

    public String getElement() {
        return element;
    }

    public void setElement(String element) {
        this.element = element;
    }
    
    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "ThreeFields{" +
                "locator='" + locator + '\'' +
                ", element='" + element + '\'' +
                ", value='" + value + '\'' +
                '}';
    }

    public ThreeFields(String locator,String element, String value) {
        this.locator = locator;
        this.element = element;
        this.value = value;
    }

    public ThreeFields() {
    }
}