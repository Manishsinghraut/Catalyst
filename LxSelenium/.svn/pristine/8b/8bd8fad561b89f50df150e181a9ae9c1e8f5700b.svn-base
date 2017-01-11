package com.lucernex.qa.pages.components;

import com.google.common.base.Function;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.views.components.*;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.Select;

import java.util.*;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.google.common.base.Preconditions.checkArgument;
import static com.google.common.base.Strings.isNullOrEmpty;
import static junit.framework.Assert.*;

/**
 * This class handles the pages and forms when they are in edit mode. This class should be instantiated when the
 * driver gets to a page(form) that is in edit mode.
 *
 * DOES NOT SUPPORT SUMMARY ENTITY PAGES (SEP)! We will probably need to use a properties file to find fields on SEPs.
 */
public class EditableFormOrPage {
    private final Logger logger = Logger.getLogger(LxModalWindow.class.getName());

    List<com.lucernex.qa.views.components.Field> fields = null;  //  All of the fields on this page
    private Map<String, String> labelToValueMap = Maps.newHashMap();
    public Map<String, String> getLabelToValueMap() {
        return labelToValueMap;
    }

    //iframe[src*=formSubmit]
    @FindBy(css = "#f1EditFormTable")
    public WebElement fpEdit;           //  The Form/Page in edit mode

    /**
     * Returns a set of field labels that are found within the page/form.
     *
     * @return the set of required and optional field labels
     */
    public Set<String> getAllFieldLabels() {
        Set<String> allFieldLabels = this.getRequiredFieldLabels();
        allFieldLabels.addAll(this.getOptionalFieldLabels());

        return allFieldLabels;
    }

    /**
     * Returns a set of required field labels on the page/form.
     *
     * @return The required field labels as a Set of Strings.
     */
    public Set<String> getRequiredFieldLabels() {
        return this.getFieldLabelsByRequired(true);
    }

    /**
     * Returns a set of optional field labels on the page/form.
     *
     * @return The optional field labels as a Set of Strings.
     */
    public Set<String> getOptionalFieldLabels() {
        return this.getFieldLabelsByRequired(false);
    }

    /**
     * Returns a set of field labels on the page/form by their "is required" property.
     *
     * @param areRequired - flag indicating which type of fields to grab from the page/form. True for the required
     *                    fields, false for the optional fields.
     * @return a Set of Strings for all required fields on the page/form if 'areRequired' is set to 'true,' or all
     * optional fields if 'areRequired' is set to 'false.'
     */
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

    /**
     * Returns a list of field instances which represent the from fields found on pages and forms.
     * @return
     */
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

    /**
     * Returns a list of elements, which are field labels, that are marked as required.
     *
     * @return List<WebElement> - List of all elements, which are field labels, that have the class "requiredFieldLabel".
     */
    private List<WebElement> getRequiredFieldLabelElements() {
        List<WebElement> labels = this.fpEdit.findElements(By.cssSelector(".requiredFieldLabel"));
        labels.addAll(this.fpEdit.findElements(By.cssSelector(".reqdLabel")));

        return labels;
    }

    /**
     * Returns a list of elements, which are field labels, that are marked as optional.
     * @return
     */
    private List<WebElement> getOptionalLabelElements() {
        //  Can't look for a generic "optinalFieldLabel" class because header labels (found in SEPs and Manage Company)
        //  are "span" tags that contain this class
        //List<WebElement> labels = this.fpEdit.findElements((By.cssSelector("div.optionalFieldLabel,font.optionalFieldLabel")));
        List<WebElement> labels = this.fpEdit.findElements((By.cssSelector(".optionalFieldLabel")));

        //  Remove section bars
        for(int index = 0; index < labels.size(); index++) {
            WebElement myLabel = labels.get(index);
            WebElement parent = BrowserDriver.getParent(myLabel);
            if(parent.getAttribute("class").equals("tblHeader")) {
                //  Remove from the list
                labels.remove(index);
            }
        }

        return labels;
    }

    private Pattern tildaRE = Pattern.compile("~~(.*)#~");

    /**
     * Returns the specified field label with the potential surrounding ~~label#~ removed.
     *
     * Example: given "~~My Field#~", returns "My Field"
     */
    private String removeTildas(String label) {
        Matcher m = tildaRE.matcher(label);

        if (m.find()) {
            return m.group(1);
        }

        return label;
    }

    private WebElement findWiseDropdown(WebElement parent, String fieldID) {
        if (parent == null || fieldID == null) {
            return null;
        }

        try {
            WebElement we = parent.findElement(By.cssSelector(String.format("div[id^='wdd_div_%s']", fieldID)));

            if (we != null) {
                return we.findElement(By.cssSelector("input[type='text']"));
            } else {
                return null;
            }
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * Initializes the list of fields, representing all fields on the page, from the given list of field label WebElements.
     *
     * @param fieldLabels - the list of WebElements representing the field labels
     * @param required - - flag indicating if the all of the field labels are required or not.
     */
    private void initFieldsListFromLabels(List<WebElement> fieldLabels, boolean required) {
        //  Do nothing if fieldLabels is null or empty
        if(fieldLabels == null || fieldLabels.isEmpty()) {
            return;
        }

        //  initialize the Fields on the form
        for (WebElement myFieldLabel : fieldLabels) {

            try {

                //  Get the label's text
                String myLabel = removeTildas(StringUtils.substringBefore(myFieldLabel.getText(), "_"));

                System.out.println("My Label is -----"+ myLabel);
                //  Get the label's ID attribute, before the underscore "_"
                String labelID = StringUtils.substringBefore(myFieldLabel.getAttribute("id"), "_");
                System.out.println("My labelID is -----"+ labelID);

                logger.info(String.format("Working with '%s' having id '%s'", myLabel, labelID));
                //  Get the label's parent
                WebElement labelParent = myFieldLabel.findElement(By.xpath(".."));

                if (StringUtils.isEmpty(labelID)) {
                    logger.info(String.format("Skipping '%s' label due to empty labelID", myLabel));
                    continue;
                }

                //  Look for the label's input field by matching the labelID
                List<WebElement> inputElements = this.findElementsWithSimilarName(labelParent, labelID);

                // If we didn't find input elements from the parent try a broader (more expensive) search.
                if (inputElements == null || inputElements.isEmpty()) {
                    WebElement wiseDropdownTextField = findWiseDropdown(labelParent, labelID);

                    if (wiseDropdownTextField != null) {
                        inputElements = new ArrayList<WebElement>(1);
                        inputElements.add(wiseDropdownTextField);
                    } else {
                        inputElements = this.findElementsWithSimilarName(labelID);
                    }
                }

                List<Field> foundFields = Lists.newArrayList();

                for(WebElement inputElement : inputElements) {

                    //  Use it's sibling if it's a hidden input field
                    if (EditableFormOrPage.isHidden(inputElement)) {
                        //  Hidden inputs are usually accompanied by its not hidden version
                        //inputElement = inputElement.findElement(By.cssSelector( String.format(" + %s", tag) ));
                        WebElement temp = inputElement.findElement(By.xpath("following-sibling::*"));
                        if (temp.getTagName().equals("input")) {
                            inputElement = temp;
                        } else {
                            inputElement = BrowserDriver.getCurrentDriver().findElement(By.cssSelector("[id*=" + labelID + "]"));
                        }
                    }

                    String tag = inputElement.getTagName();

                    //  Determine the inputElement's input type
                    if (tag.equals("input")) {
                        //  If it's text input field
                        if (EditableFormOrPage.isTextInput(inputElement)) {
                            foundFields.add(new TextField(required, myLabel, labelID, inputElement));
                            labelToValueMap.put(myLabel, inputElement.getAttribute("value"));
                        }
                        //  If it's a drop down field
                        else if (EditableFormOrPage.isDropdown(inputElement)) {
                            foundFields.add(EditableFormOrPage.createDropdownField(required, myLabel, labelID, inputElement));
                            //TODO review the logic to get the value of the select field
                            labelToValueMap.put(myLabel, inputElement.getAttribute("value"));
                            break; // we are done here.
                        }
                        //  If it's a radio button field
                        else if (EditableFormOrPage.isRadioButton(inputElement)) {
                            //WebElement radioButtonGroup = inputElement.findElement(By.xpath("../.."));
                            foundFields.add(EditableFormOrPage.createRadioButtonGroup(required, myLabel, labelID, labelParent));
                            //TODO review the logic to get the value of the radio field
                            labelToValueMap.put(myLabel, inputElement.getAttribute("value"));
                            break; // we are done here.
                        }
                        //  If it's a checkbox
                        else if (EditableFormOrPage.isCheckbox(inputElement)) {
                            WebElement checkBoxParent = inputElement.findElement(By.xpath("../.."));
                            foundFields.add(EditableFormOrPage.createCheckBoxGroup(required, myLabel, labelID, checkBoxParent));
                            //TODO review the logic to get the value of the Checkbox field
                            labelToValueMap.put(myLabel, inputElement.getAttribute("value"));
                        }

                    } else if (tag.equals("select")) {
                        //  If it's a compound select field
                        if (EditableFormOrPage.isCompoundSelectField(inputElement)) {
                            WebElement table = inputElement.findElement(By.xpath("../../.."));
                            foundFields.add(EditableFormOrPage.createCompoundSelectField(required, myLabel, labelID, table));
                            //TODO review the logic to get the value of the compound select field
                            labelToValueMap.put(myLabel, inputElement.getAttribute("value"));
                        }
                        //  If it's a regular select field
                        else {
                            foundFields.add(new SelectField(required, myLabel, labelID, inputElement));
                            //TODO review the logic to get the value of the select field
                            labelToValueMap.put(myLabel, inputElement.getAttribute("value"));
                        }
                    } else if (tag.equals("textarea")) {
                        //  If it's a text area field
                        foundFields.add(new TextareaField(required, myLabel, labelID, inputElement));
                        //TODO - verify get attribute works as expected
                        labelToValueMap.put(myLabel, inputElement.getAttribute("value"));
                    } else if (tag.equals("span")) {
                        foundFields.add(new ReadOnlyField(required, myLabel, labelID, inputElement));
                        labelToValueMap.put(myLabel, inputElement.getText());
                    }

                }

                //  Add the field to the list of fields
                if (foundFields.isEmpty()) {
                    logger.severe(String.format("%s cannot be processed!!!", myFieldLabel.getText()));
                } else if(foundFields.size() == 1) {
                    this.fields.add(foundFields.get(0));
                } else if(foundFields.size() > 1) {
                    CompositeField compField = new CompositeField(required, myLabel, labelID, foundFields);
                    this.fields.add(compField);
                    labelToValueMap.put(myLabel, compField.getValue());
                }
            } catch(Exception ex) {
                logger.throwing("Editable Form", String.format("%s cannot be processed!!!", myFieldLabel.getText()), ex);
            }
        }
        logger.info(String.format("Found %s input values from %s labels", labelToValueMap.size(), fieldLabels.size()));
    }

    /**
     * Returns the WebElements that have a name attribute that contains the specified
     * field name.
     *
     * @param parent - parent DOM element that contains both field label and input elements.
     * @param name   - field name
     */
    public List<WebElement> findElementsWithSimilarName(WebElement parent, String name) {
        List<WebElement> elements;

        try {
            elements = parent.findElements(By.cssSelector(String.format("[name*=%s]", name)));
        } catch (Exception ex) {
            return null;
        }

        if (CollectionUtils.isNotEmpty(elements)) {
            Iterator<WebElement> it = elements.iterator();

            // Remove those WebElements which are of the 'hidden' type.
            while (it.hasNext()) {
                WebElement we = it.next();
                String   type = we.getAttribute("type");

                if (type != null && type.equalsIgnoreCase("hidden")) {
                    it.remove();
                }
            }

            List<String> elementTypes = Lists.transform(elements, new Function<WebElement, String>() {
                @Override
                public String apply(WebElement webElement) {
                return webElement.getTagName();
                }
            });
            logger.info(String.format("Returning element types for passed '%s' are: %s", name, elementTypes.toString()));
        }

        return elements;
    }

    /**
     * Returns the first WebElement, inside this editable page/form that contains the given name as part of its
     * attribute 'name'.
     *
     * @param name
     * @return
     */
    public List<WebElement> findElementsWithSimilarName(String name) {
        List<WebElement> we;
        try {
            we = this.fpEdit.findElements(By.cssSelector(String.format("[name*=%s]", name)));
        } catch (Exception ex) {
            logger.info(String.format("Couldn't find element '%s' by name.  Will try by ID now", name));
            we = this.fpEdit.findElements(By.cssSelector(String.format("span[id*=%s]", name)));
        }

        if(CollectionUtils.isNotEmpty(we)) {
            List<String> elementTypes = Lists.transform(we, new Function<WebElement, String>() {
                @Override
                public String apply(WebElement webElement) {
                    return webElement.getTagName();
                }
            });
            logger.info(String.format("Returning element types for passed '%s' are: %s", name, elementTypes.toString()));
        }

        return we;
    }

    /**
     * Returns true if the given element has the attribute 'type' equal to "hidden".
     * @param element
     * @return true if element's attribute equals "hidden", false otherwise.
     */
    private static boolean isHidden(WebElement element) {
        String type = element.getAttribute("type");

        return (type != null && type.equals("hidden"));
    }

    /**
     * Checks if the given input WebElement is a text input field.
     *
     * @param we - the input WebElement field
     * @return - true if the input WebElment is a text input field, false otherwise.
     */
    private static boolean isTextInput(WebElement we) {
        if (we == null) {
            return false;
        }

        String type = we.getAttribute("type");

        // Oddly enough the password input element has the autocomplete attribute.
        if ("password".equals(type)) {
            return true;
        }

        if (type == null || type.equals("text")) {
            String autocomplete = we.getAttribute("autocomplete");

            // If the 'input' tag has an 'autocomplete' attribute, then it is
            // not a simple text field but is instead part of a compound drop
            // down field.
            return isNullOrEmpty(autocomplete);
        } else {
            return false;
        }
    }

    /**
     * Checks if the given input WebElement is a drop down field.
     *
     * @param we - - the input WebElment field.
     * @return true if the input WebElement is a drop down field, false otherwise.
     */
    private static boolean isDropdown(WebElement we) {
        if (we == null) {
            return false;
        }

        String type = we.getAttribute("type");
        String auto = we.getAttribute("autocomplete");

        if (type.equals("text") && !isNullOrEmpty(auto)) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * Checks if the given WebElement is a radio button.
     *
     * @param we
     * @return
     */
    private static boolean isRadioButton(WebElement we) {
        String type = we.getAttribute("type");

        return type.equals("radio");
    }


    private static boolean isCheckbox(WebElement we) {
        String type = we.getAttribute("type");

        return type.equals("checkbox");
    }

    /**
     * Checks if the given WebElement is a compound select field.
     * @param we
     * @return
     */
    private static boolean isCompoundSelectField(WebElement we) {
        String size = we.getAttribute("size");
        //return !isNullOrEmpty(size);
        return !size.equals("0");
    }

    /**
     * Creates a new DropdownField.
     *
     * @param required - flag indicating if the field is required on the form/page
     * @param label - the field's text label
     * @param name - the field's name
     * @param input - the input element of that field
     * @return the newly created DropdownField
     */
    private static DropdownField createDropdownField(
            boolean required,
            String label,
            String name,
            WebElement input
    ) {
        WebElement parent = input.findElement(By.xpath("../.."));

        assertNotNull("Unable to get parent DOM element!", parent);

        WebElement arrowBtn;

        try {
            arrowBtn = parent.findElement(By.cssSelector("div.x-form-trigger"));
        } catch (org.openqa.selenium.NoSuchElementException e) {
            return null;
        }

        assertNotNull("Did not find expected 'div.x-form-trigger' element!", arrowBtn);

        return new DropdownField(required, label, name, arrowBtn);
    }

    /**
     * Creates a new CompoundSelectField.
     *
     * @param required - flag indicating if the field is required on the form/page
     * @param label - the field's text label
     * @param name - the field's name
     * @param table - the table element holding the 2 Select elements
     * @return the newly created CompoundSelectField
     */
    private static CompoundSelectField createCompoundSelectField(
            boolean required,
            String label,
            String name,
            WebElement table
    ) {
        Select available;
        Select selected;
        WebElement moveRightBtn;
        WebElement moveLeftBtn;

        List<WebElement> selects = table.findElements(By.cssSelector("select"));

        assertTrue(
                "Did not find required pair of 'select' tags!",
                selects != null && selects.size() == 2
        );

        available = new Select(selects.get(0));
        selected = new Select(selects.get(1));

        List<WebElement> buttons = table.findElements(By.cssSelector("input[type=button]"));

        assertTrue(
                "Did not find required pair of 'button' tags!",
                buttons != null && buttons.size() == 2
        );

        moveRightBtn = buttons.get(0);
        moveLeftBtn = buttons.get(1);

        return new CompoundSelectField(required, label, name, available, selected, moveRightBtn, moveLeftBtn);
    }

    /**
     * Creates a new RadioGroupField.
     *
     * @param required - flag indicating if the field is required on the form/page
     * @param label - the field's text label
     * @param name - the field's name
     * @param parent - the parent WebElement for the radio group.
     * @return the newly created RadioGroupField
     */
    private static RadioGroupField createRadioButtonGroup(
            boolean required,
            String label,
            String name,
            WebElement parent
    ) {
        if (parent == null) {
            return null;
        }

        List<WebElement> radios = parent.findElements(By.cssSelector("input[type=radio]"));

        if (radios == null || radios.isEmpty()) {
            return null;
        }

        return new RadioGroupField(required, label, name, parent, radios);
    }

    /**
     * Creates a new CheckBoxGroup
     *
     * @param required
     * @param label
     * @param name
     * @param parent
     * @return
     */
    private static CheckBoxGroupField createCheckBoxGroup(boolean required, String label, String name, WebElement parent) {
        if (parent == null) {
            return null;
        }

        List<WebElement> checks = parent.findElements(By.cssSelector("input[type=checkbox]"));

        if (checks == null || checks.isEmpty()) {
            return null;
        }

        return new CheckBoxGroupField(required, label, name, parent, checks);
    }

    /**
     * Updates the value of the specified field. In the event the field is of
     * type select, then multiple values can be concatenated together separated
     * by the tab character.
     *
     * @param label - label of field to inquire about
     * @param value - desired value of field
     */
    public void setFieldValue(String label, String value) {
        checkArgument(label != null, "Required argument 'label' is null!");

        List<Field> fields = this.getFields();

        assertTrue(fields != null);

        for (Field f : fields) {
            if (f.getLabel().contains(label)) {
                f.setValue(value);
                logger.info(String.format("Updated modal window field '%s' to '%s'", label, value));
                return;
            }
        }

        fail("Specified field '%s' is unknown!");
    }



    private static void getAllLabelsOnNonEditabelForm(String fieldLabel, String value) {
        //  Do nothing if fieldLabels is null or empty
        List<WebElement> fieldLabels = BrowserDriver.getCurrentDriver().findElements((By.cssSelector(".optionalFieldLabel")));
        System.out.println("Labels are: " + fieldLabels);
        if(fieldLabels == null || fieldLabels.isEmpty()) {
            return;
        }

        //  initialize the Fields on the form
        for(WebElement myFieldLabel : fieldLabels) {
            String myLabel = myFieldLabel.getText();

            if(myLabel.equals(fieldLabel)) {
                String labelID = myFieldLabel.getAttribute("id");

                WebElement ancestor = myFieldLabel.findElement(By.xpath(".//*[@id='" + labelID + "']/ancestor::td"));
                WebElement xpathToLabelValue = ancestor.findElement(By.xpath(".//*[@id='" + labelID + "']/ancestor::td/following-sibling::td[1]"));
                String labelValue = xpathToLabelValue.getText();
                System.out.println("Labels are: " + labelID + "and the value is: " + labelValue);
                assertEquals(value, labelValue);
            }

        }
    }

 /*// Validation of editable form or page
    public static void validateFieldsListFromLabelsOnEditableForm(String fieldLabel, String value) throws InterruptedException{
        BaseView.switchToFrame();
        EditableFormOrPage.getAllLabelsOnNonEditabelForm(fieldLabel, value);


      *//*  ActionsView.edit();
        PortfolioNavigationView.expandPortfolioNavigationTab();*//*

       //Navigation.navigateTo("Unspecified");
        PortfolioNavigationView.navigateToFolder("Unspecified");
        PortfolioNavigationView.expandPortfolioNavigationTab();
      *//*  PortfolioNavigationView.navigateToFolder("");*//*


    *//*    for (int i = 0; i < labels.size(); i++) {
            WebElement label = labels.get(i);
            if (label.getText().contains(labelName)) {
                String labelCss = label.getCssValue();
                String labelValue = label.findElement(By.cssSelector(labelCss+"")).getText();
            }

        }*//*
    }

*/

    private void getFieldsListFromLabels(){
        getAllFieldLabels();

    }

    public static void setFormValue(String formName, String elementName, String value) {
        StringBuffer sb = new StringBuffer();

        sb.append("Lx.Form.updateFormField(Ext.getDom('");
        sb.append(formName);
        sb.append("'), '");
        sb.append(elementName);
        sb.append("', '");
        sb.append(value);
        sb.append("', true);\n");

        ((JavascriptExecutor) BrowserDriver.getCurrentDriver()).executeScript( sb.toString() );
        return;
    }


    public static String getFormValue(String formName, String elementName) {
        StringBuffer sb = new StringBuffer();

        sb.append("return Lx.Form.getValueFromBaseName('");
        sb.append(elementName);
        sb.append("', Ext.getDom('");
        sb.append(formName);
        sb.append("'));");

        return sb.toString();
    }
}
