package com.lucernex.qa.views.components;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.CucumberContext;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import static com.google.common.base.Strings.isNullOrEmpty;
import static org.junit.Assert.assertNotNull;

/**
 * Represents a Ext.form.field.Date field.
 */
public class DateField extends Field {
    private String id = null; // Value of Ext.form.field.Date.id widget property.

    public void setValue(String value) {
        if (!isNullOrEmpty(value)) {
            if (value.equalsIgnoreCase("today")) {
                SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");

                try {
                    //value = CucumberContext.getSessionDateFormat().format(new Date());
                    value = dateFormat.format(new Date());
                } catch (Exception e) {
                    e.printStackTrace();
                    // ignore
                }
            }

            BrowserDriver.executeScript(String.format("Ext.getCmp('%s').setValue('%s');", id, value));
        }
    }

    @Override
    public String getValue() {
        String js = String.format("return Ext.getCmp('%s').getRawValue();", id);

        return (String) BrowserDriver.executeScript(js);
    }

    private static WebElement lookup(String renderToTag, String  renderToID) {
        WebElement we = BrowserDriver.getCurrentDriver().findElement(
            By.cssSelector(String.format("%s#%s > div", renderToTag, renderToID))
        );

        assertNotNull(we);

        return we;
    }

    /**
     * Creates instance given all configurable properties.
     *
     * @param required    - is this a required field?
     * @param label       - field label visible to user
     * @param name        - name of record field
     * @param renderToTag - the DOM tag where the ext-js field was rendered
     * @param renderToID  - the DOM element where the ext-js field was rendered
     */
    public DateField(
        boolean   required,
        String       label,
        String        name,
        String renderToTag,
        String  renderToID
    ) {
        super(
            required,
            label,
            name,
            lookup(renderToTag, renderToID)
        );

        this.id = this.element.getAttribute("id");
    }
}
