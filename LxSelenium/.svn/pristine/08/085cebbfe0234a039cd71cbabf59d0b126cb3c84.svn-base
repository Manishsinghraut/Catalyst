package com.lucernex.qa.views.admin.ManageScheduleTemplate;

import com.lucernex.qa.views.components.*;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import java.util.ArrayList;
import java.util.List;

import static com.google.common.base.Strings.isNullOrEmpty;
import static junit.framework.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

/**
 * Represents the modal dialog named 'Task Detail' which provides editing of a
 * selected Schedule Task record.
 */
public class TaskDetailModalDialogView extends ModalDialogView {
    private static final String DIALOG_TITLE = "Task Detail";

    // Name of radio group which chooses [by Job Title] or [by Job Title at Org Chart Level].
    private static final String ASSIGNEE_TYPE_RADIO_GROUP_NAME = "AssigneeType";

    public void waitForModalWindow() {
        WebElement titleWE = modalDialogPage.title;

        assertNotNull(titleWE);

        String title = titleWE.getText();

        assertEquals(DIALOG_TITLE, title);
    }

    /**
     * Returns a list of any links present within the modal window.
     */
    public List<WebElement> getLinks() {
        WebElement form = modalDialogPage.form;

        assertNotNull(form);

        // [Add Notify Template] link
        // --------------------------
        WebElement addNotifyTemplateLink = form.findElement(By.cssSelector("a[href*=Notification]"));

        assertNotNull(addNotifyTemplateLink);

        List<WebElement> links = new ArrayList<>(1);

        links.add(addNotifyTemplateLink);
        return links;
    }

    private List<Field> fields = null;

    /**
     * Returns the set of fields in the modal dialog's form.
     */
    public List<Field> getFields() {
        if (fields == null) {
            fields = new ArrayList<>(4);

            WebElement form = modalDialogPage.form;

            assertNotNull(form);

            // [Name] field
            // ------------
            WebElement taskNameFld = form.findElement(By.cssSelector("input[name='TaskName']"));

            assertNotNull(taskNameFld);
            fields.add(new TextField(false, "Name", "TaskName", taskNameFld));

            // [Duration (days)] field
            // -----------------------
            WebElement durationFld = form.findElement(By.cssSelector("input[name='OriginalDuration']"));

            assertNotNull(durationFld);
            fields.add(new TextField(true, "Duration (days)", "OriginalDuration", taskNameFld));

            // [Initial Status] field
            // ----------------------
            WebElement taskStatusSelect = form.findElement(By.cssSelector("select[name='CodeTaskStatusID']"));

            assertNotNull(taskStatusSelect);
            fields.add(new SelectField(true, "Initial Status", "CodeTaskStatusID", taskStatusSelect));

            // [Task starts] radio button
            // --------------------------
            WebElement taskStartsRadio = form.findElement(By.cssSelector("input[name=RadioDaysAfterStart]"));

            assertNotNull(taskStartsRadio);
            fields.add(new RadioButtonField(false, "Task starts", "RadioDaysAfterStart", taskStartsRadio));

            // [Task is dependent upon] radio button
            // -------------------------------------
            WebElement taskIsDependentUponRadio = form.findElement(By.cssSelector("input[name=RadioPredecessorTaskID]"));

            assertNotNull(taskStartsRadio);
            fields.add(new RadioButtonField(false, "Task is dependent upon", "RadioPredecessorTaskID", taskIsDependentUponRadio));

            // [Assignee Type] radio group
            // ---------------------------
            List<WebElement> assigneeTypeRadios = form.findElements(By.cssSelector("input[name=" + ASSIGNEE_TYPE_RADIO_GROUP_NAME + "]"));
            List<String>     assigneeTypeLabels = new ArrayList<>();

            assigneeTypeLabels.add("by Job Title");
            assigneeTypeLabels.add("by Job Title at Org Chart Level");

            assertNotNull(assigneeTypeRadios);
            assertEquals(2, assigneeTypeRadios.size());
            fields.add(new RadioGroupField(true, ASSIGNEE_TYPE_RADIO_GROUP_NAME, ASSIGNEE_TYPE_RADIO_GROUP_NAME, form, assigneeTypeRadios, assigneeTypeLabels));

            // [Auto-Assign by Job Titles] compound selector field
            // ---------------------------------------------------
            WebElement availableSelect = form.findElement(By.cssSelector("select[name='AssigneeTypeList_available']"));
            WebElement  selectedSelect = form.findElement(By.cssSelector("select[name='AssigneeTypeList']"));
            WebElement    moveRightBtn = form.findElement(By.cssSelector("input[name='removeAttentioner']"));
            WebElement     moveLeftBtn = form.findElement(By.cssSelector("input[name='addAttentioner']"));

            assertNotNull(availableSelect);
            assertNotNull(selectedSelect);
            assertNotNull(moveRightBtn);
            assertNotNull(moveLeftBtn);
            fields.add(
                new CompoundSelectField(
                    false,
                    "Auto-Assign by Job Titles",
                    "assignees",
                    new Select(availableSelect),
                    new Select(selectedSelect),
                    moveRightBtn,
                    moveLeftBtn
                )
            );

            // [Comments] field
            // ----------------
            WebElement commentsTextArea = form.findElement(By.cssSelector("textarea[name='Description']"));

            assertNotNull(commentsTextArea);
            fields.add(new TextareaField(false, "Comments", "Description", commentsTextArea));
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
            Thread.sleep(1000l);
        } catch (InterruptedException e) {
            // ignore
        }
    }
}
