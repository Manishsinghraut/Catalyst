package com.lucernex.qa.views.components;

import com.lucernex.qa.browsers.BrowserDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;

import java.util.logging.Logger;

import static com.google.common.base.Strings.isNullOrEmpty;
import static org.junit.Assert.assertNotNull;

/**
 * A field that has a drop down list of values and an 'input' field which receives
 * the selected value.
 */
public class DropdownField extends Field {
    private static final Logger logger = Logger.getLogger(DropdownField.class.getName());

    private String id = null; // Value of Ext.form.field.ComboBox.id widget property.

    private boolean hasInvalidClass(WebElement we) {
        String clazz = we.getAttribute("class");

        return clazz != null && clazz.contains("x-form-invalid-field");
    }

    @Override
    public void setValue(String value) {
        if (!isNullOrEmpty(value)) {
            String currentValue = getValue();

            if (!value.equals(currentValue)) {
                // The following would work if this field was a plain vanilla Ext.form.field.ComboBox
                // but it does not. The call will set the value but then it gets cleared for some
                // strange reason.
                // BrowserDriver.executeScript(String.format("Ext.getCmp('%s').setRawValue('%s');", id, value));

                WebElement text = BrowserDriver.getCurrentDriver().findElement(By.id(id + "-inputEl"));
                WebElement picker = BrowserDriver.getCurrentDriver().findElement(By.id(id + "-trigger-picker"));

                text.click();
                picker.click();
                text.sendKeys(value);
                text.sendKeys(Keys.TAB);
            }
        }
    }

    @Override
    public String getValue() {
        String js = String.format("return Ext.getCmp('%s').getRawValue();", id);

        return (String)BrowserDriver.executeScript(js);
    }

    /**
     * Creates instance given all configurable properties.
     *
     * @param required - is this a required field?
     * @param label    - field label visible to user
     * @param name     - name of record field
     * @param element  - the 'img' tag that provides the drop down list when clicked. i.e. The arrow button
     */
    public DropdownField(
        boolean   required,
        String       label,
        String        name,
        WebElement element
    ) {
        super(required, label, name, element);

        String js = String.format("return Ext.ComponentQuery.query('*[id^=%s_]')[0].getId();", name);
        Object id = BrowserDriver.executeScript(js);

        assertNotNull(String.format("Unable to find Ext.form.field.ComboBox with id [%s_*]", name), id);

        this.id = (String)id;
    }
}
