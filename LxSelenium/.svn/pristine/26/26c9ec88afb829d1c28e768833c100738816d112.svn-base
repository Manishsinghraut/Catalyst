package com.lucernex.qa.pages.components;

import com.google.common.collect.Maps;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.components.*;
import org.codehaus.plexus.util.StringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.*;
import java.util.logging.Logger;

import static junit.framework.Assert.*;

/**
 * Created by rupinderk on 7/25/2014.
 */
public class NonEditableFormOrPage {
    private final Logger logger = Logger.getLogger(LxModalWindow.class.getName());
    List<com.lucernex.qa.views.components.Field> fields = null;
    private Map<String, String> labelToValueMap = Maps.newHashMap();

    public Map<String, String> getLabelToValueMap() {
        return labelToValueMap;
    }

    public Set<String> getAllFieldLabels() {


        List<Field> fields = null;
        Set<String> allFieldLabels = this.getRequiredFieldLabels();
        allFieldLabels.addAll(this.getOptionalFieldLabels());

        return allFieldLabels;
    }

    public Set<String> getRequiredFieldLabels() {
        return this.getFieldLabelsByRequired(true);
    }
    private Set<String> getFieldLabelsByRequired(boolean areRequired) {
        List<Field> myFields = this.getFields();

        if (myFields == null || myFields.isEmpty()) {
            return new TreeSet<String>();
        }

        Set<String> labels = new TreeSet<String>();

        for(Field field : myFields) {
            if( (field != null) && (field.isRequired() == areRequired) ) {
                labels.add(field.getLabel());
            }
        }

        return labels;
    }
    public List<Field> getFields() {
        if(this.fields == null) {
            this.fields = new ArrayList<Field>();

            //  Add the required fields
            List<WebElement> reqLabels = this.getRequiredFieldLabelElements();
            this.initFieldsListFromLabels(reqLabels, true);

            //  Add the optional fields
            List<WebElement> optLabels = this.getOptionalLabelElements();
            this.initFieldsListFromLabels(optLabels, false);
        }

        return fields;
    }
    private List<WebElement> getRequiredFieldLabelElements() {
        List<WebElement> labels = BrowserDriver.getCurrentDriver().findElements(By.cssSelector(".requiredFieldLabel"));
        return labels;
    }


    private List<WebElement> getOptionalLabelElements() {

        List<WebElement> labels = BrowserDriver.getCurrentDriver().findElements((By.cssSelector(".optionalFieldLabel")));
        return labels;
    }
    public Set<String> getOptionalFieldLabels() {
        return this.getFieldLabelsByRequired(false);
    }


    private void initFieldsListFromLabels(List<WebElement> fieldLabels, boolean required) {

        //  Do nothing if fieldLabels is null or empty
        if (fieldLabels == null || fieldLabels.isEmpty()) {
            return;
        }

        //  initialize the Fields on the form
        for (WebElement myFieldLabel : fieldLabels) {
            String myLabel = myFieldLabel.getText();

                    String labelID = myFieldLabel.getAttribute("id");
                    if (StringUtils.isEmpty(labelID)) {
                        continue;
                    }
                    //  Get the label's parent
                    try {
                        BaseView.waitForElement(By.xpath(".//*[@id='" + labelID + "']/../following-sibling::td[1]"));
                        WebElement labelXpath = BrowserDriver.getCurrentDriver().findElement(By.xpath(".//*[@id='" + labelID + "']/../following-sibling::td[1]"));
                        logger.info(labelXpath.getText());

                        labelToValueMap.put(myLabel, labelXpath.getText());
                        //assertTrue(String.format("Invalid value for label id - %s", new String[]{labelID}), StringUtils.equals(myLabel, labelXpath.getText().trim()));
                    } catch (Exception ex) {
                        logger.throwing("Exception", "Finding text", ex);
            }
        }

    }

    public void assertFieldValue(String expectedValue, String foundValue) {

        assertEquals("Value is not equal", expectedValue, foundValue);

    }
}
