package com.lucernex.qa.views.components;

import org.apache.commons.lang.StringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static junit.framework.Assert.assertNotNull;
import static junit.framework.Assert.assertTrue;


public class CheckBoxGroupField extends Field {
    private Map<String,WebElement> label2checkBox = new HashMap<String, WebElement>(7);

    @Override
    public void setValue(String value) {
        assertNotNull(label2checkBox);

        WebElement checkBox = label2checkBox.get(value);

        assertNotNull(
                String.format("Field '%s' does not have a '%s' checkBox  choice!", getLabel(), value),
                label2checkBox
        );

        checkBox.click();
    }

    @Override
    public String getValue() {
        //TODO  Need to implement this method!!!!
        return StringUtils.EMPTY;
    }


    public CheckBoxGroupField(
            boolean        required,
            String            label,
            String             name,
            WebElement       parent,
            List<WebElement> checkBoxes
    ) {
        super(required, label, name, parent);

        assertNotNull(checkBoxes);
        assertTrue(checkBoxes.size() > 0);

        parent = checkBoxes.get(0).findElement(By.xpath(".."));
        assertNotNull(parent);

        String text = parent.getText();

        assertNotNull(text);

    }

}
