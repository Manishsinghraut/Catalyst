package com.lucernex.qa.views.components;

import com.lucernex.qa.browsers.BrowserDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.ArrayList;
import java.util.List;

import static com.google.common.base.Strings.isNullOrEmpty;
import static junit.framework.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.fail;

/**
 * Represents the 'Apply Schedule Template' modal dialog.
 */
public class ApplyScheduleTemplateModalDialogView extends ModalDialogView {
    private static final String DIALOG_TITLE = "Apply Schedule Template";

    // Name of [<input type="radio"] radio group.
    private static final String RADIO_GROUP_NAME = "startStopWhenRadio";

    public void waitForModalWindow() {
        WebElement titleWE = modalDialogPage.title;

        assertNotNull(titleWE);

        String title = titleWE.getText();

        assertEquals(DIALOG_TITLE, title);
    }

    private List<Field> fields = null;

    /**
     * Returns the set of fields in the modal dialog's form.
     */
    public List<Field> getFields() {
        if (fields == null) {
            WebElement form = modalDialogPage.form;

            assertNotNull(form);

            List<WebElement> radios = form.findElements(By.cssSelector("input[name=" + RADIO_GROUP_NAME + "]"));

            assertNotNull(radios);
            assertEquals(2, radios.size());

            WebElement select = form.findElement(By.cssSelector("select#taskTemplateIDToAssign"));

            assertNotNull(select);

            List<String> radioLabels = new ArrayList<>();

            radioLabels.add("Start on ....");
            radioLabels.add("Finish on ....");

            SelectField            template = new SelectField(false, "Schedule Template", "taskTemplateIDToAssign", select);
            RadioGroupField radioGroupField = new RadioGroupField(true, RADIO_GROUP_NAME, RADIO_GROUP_NAME, form, radios, radioLabels);
            DateField             startDate = new DateField(false, "Start on ....", "startDate", "span", "startDate_ex");
            DateField              stopDate = new DateField(false, "Finish on ....", "stopDate", "span", "stopDate_ex");

            fields = new ArrayList<>(4);
            fields.add(template);
            fields.add(radioGroupField);
            fields.add(startDate);
            fields.add(stopDate);
        }

        return fields;
    }

    /**
     * Returns the set of field labels in the modal dialog's form.
     */
    public List<String> getFieldLabels() {
        List<Field>  fields = getFields();
        List<String> labels = new ArrayList<>();

        for (Field f : fields) {
            labels.add(f.getLabel());
        }

        return labels;
    }

    /**
     * Sets the value of the specified field.
     *
     * @param field - the field we are to update
     * @param value - the new value for the field
     */
    public void setFieldValue(Field field, String value) {
        assert field != null;

        if (isNullOrEmpty(value)) {
            field.setValue(value);
        }
    }

    /**
     * Sets the value of the identified field.
     *
     * @param fieldLabel - identifies the field to update
     * @param value      - the new value for the field
     */
    public void setFieldValue(String fieldLabel, String value) {
        assert fieldLabel != null;
        assert fields    != null;

        if (!isNullOrEmpty(value)) {
            for (Field f : fields) {
                if (fieldLabel.equals(f.getLabel())) {
                    f.setValue(value);
                }
            }
        }
    }

    /**
     * Clicks the modal dialog button which has the specified label.
     *
     * @param buttonLabel - label on button to be clicked
     */
    public void clickButton(String buttonLabel) {
        Button btn = new Button(buttonLabel);

        btn.click();
    }

    /**
     * Wait for processing to finish after clicking the specified modal dialog button.
     *
     * @param messsage - error message if expected result not seen
     */
    public void waitForProcessingFinish(String messsage) {
        try {
            BrowserDriver.findElementWithTimeout(By.cssSelector("iframe[src*='TaskGantt2']"), 30l);
        } catch (InterruptedException e) {
            fail(messsage);
        }
    }
}
