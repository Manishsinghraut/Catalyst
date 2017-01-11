package com.lucernex.qa.views.components;

import com.lucernex.qa.browsers.BrowserDriver;
import org.openqa.selenium.By;

/**
 * Represents an ext-js Ext.Button widget.
 */
public class Button {
    private String id = null; // Value of Ext.Button.id widget property.

    public void click() {
        BrowserDriver.getCurrentDriver().findElement(By.id(id)).click();
    }

    public Button(String label) {
        String js = String.format("return Ext.ComponentQuery.query('button[text=%s]')[0].id", label);

        id = (String) BrowserDriver.executeScript(js);
    }
}
