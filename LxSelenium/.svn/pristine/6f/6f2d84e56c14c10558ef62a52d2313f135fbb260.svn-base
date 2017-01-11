package com.lucernex.qa.views.components;

import org.apache.commons.lang.StringUtils;
import org.openqa.selenium.WebElement;

import java.util.*;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertNotNull;
import static junit.framework.Assert.assertTrue;

/**
 * Represents a field that consist of two or more radio buttons.
 */
public class RadioGroupField extends Field {
    private Map<String,WebElement> label2radio = new HashMap<String, WebElement>(7);

    @Override
    public void setValue(String value) {
        assertNotNull(label2radio);

        WebElement radio = label2radio.get(value);

        assertNotNull(
            String.format("Field '%s' does not have a '%s' radio button choice!", getLabel(), value),
            radio
        );

        radio.click();
    }

    @Override
    public String getValue() {
        //TODO  Need to implement this method!!!!
        return StringUtils.EMPTY;
    }

    /**
     * Tokenize a list of words using capitalized letters as a word delimiter. Also, removes spaces
     *
     * Example
     *   given: "YesNo" or "Yes No"
     * returns: ["Yes","No"]
     *
     * @param words - set of words
     */
    static List<String> tokenizeCapitalizedWords(String words) {
        List<String> tokens = new ArrayList<String>(5);
        int j = 0;

        for (int i = 1; i < words.length(); i++) {
            char chr = words.charAt(i);

            // Did we see the beginning of the next word?
            if (Character.isUpperCase(chr)) {
                //  Check if the last character is a space
                if(Character.isWhitespace(words.charAt(i - 1))) {
                    //  Do not include the last character if it's a white space character
                    tokens.add(words.substring(j, i - 1));
                } else {
                    tokens.add(words.substring(j, i));
                }

                j = i;
            }
        }

        if (j > 0) {
            tokens.add(words.substring(j));
        }

        return tokens;
    }

    /**
     * Creates instance given all configurable properties.
     *
     * @param required - is this a required field?
     * @param label    - field label visible to user
     * @param name     - name of record field
     * @param parent   - parent element
     * @param radios   - list of radio input elements
     */
    public RadioGroupField(
        boolean        required,
        String            label,
        String             name,
        WebElement       parent,
        List<WebElement> radios
    ) {
        super(required, label, name, parent);

        assertNotNull(radios);
        assertTrue(radios.size() > 0);

        //parent = radios.get(0).findElement(By.xpath(".."));
        assertNotNull(parent);

        String parentTag = parent.getTagName();

        if ("form".equals(parentTag)) {
        }

        String text = parent.getText();

        assertNotNull(text);

        // Given something like: "Send Welcome Email\nYesNo"
        String[] tokens = text.split("\n");

        assertTrue(tokens.length == 2);

        // We want a list like ["Yes", "No"]
        List<String> labels = tokenizeCapitalizedWords(tokens[1]);

        assertEquals(labels.size(), radios.size());

        for (int i = 0; i < labels.size(); i++) {
            label2radio.put(labels.get(i), radios.get(i));
        }
    }

    /**
     * Creates instance given all configurable properties.
     *
     * @param required - is this a required field?
     * @param label    - field label visible to user
     * @param name     - name of record field
     * @param parent   - parent element
     * @param radios   - list of radio input elements
     * @param labels   - labels for the radio buttons
     */
    public RadioGroupField(
        boolean        required,
        String            label,
        String             name,
        WebElement       parent,
        List<WebElement> radios,
        List<String>     labels
    ) {
        super(required, label, name, parent);

        assertNotNull(radios);
        assertTrue(radios.size() > 0);
        assertNotNull(labels);
        assertEquals(radios.size(), labels.size());

        assertNotNull(parent);

        for (int i = 0; i < labels.size(); i++) {
            label2radio.put(labels.get(i), radios.get(i));
        }
    }

    public RadioGroupField() {
    }
}
