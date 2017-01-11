package com.lucernex.qa.views.components;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import java.util.Iterator;
import java.util.List;

import static com.google.common.base.Strings.isNullOrEmpty;
import static junit.framework.Assert.assertTrue;

/**
 * Represents a select field.
 */
public class SelectField extends Field {
    private Select select = null;

    /**
     * Returns tab character separated selected value(s).
     */
    public String getValue() {
        if (element == null) {
            return null;
        } else {
            List<WebElement> options = select.getAllSelectedOptions();

            if (options == null || options.isEmpty()) {
                return null;
            }

            StringBuilder            sb = new StringBuilder();
            List<WebElement> selections = select.getAllSelectedOptions();

            if (selections == null || selections.isEmpty()) {
                return null;
            }

            Iterator<WebElement> it = selections.iterator();

            if (it.hasNext()) {
                WebElement we = it.next();

                sb.append(we.getAttribute("value"));
            }

            while (it.hasNext()) {
                WebElement we = it.next();

                sb.append('\t');
                sb.append(we.getAttribute("value"));
            }

            return sb.toString();
        }
    }

    @Override
    public void setValue(String value) {
        if (isNullOrEmpty(value)) {
            select.deselectAll();
            return;
        }

        if (select.isMultiple()) {
            String[] values = value.split("\t");

            if (values.length > 0) {
                select.deselectAll();

                for (String t : values) {
                    select.selectByVisibleText(t);
                }
            } else {
                select.deselectAll();
                select.selectByVisibleText(value);
            }
        } else {
            assertTrue(
                String.format("Field '%s' does not support multiple selections!", getLabel()),
                value.indexOf('\t') == -1
            );
            select.selectByVisibleText(value);
        }
    }

    public SelectField(boolean required, String label, String name, WebElement element) {
        super(required, label, name, element);
        this.select = new Select(element);
    }


}
