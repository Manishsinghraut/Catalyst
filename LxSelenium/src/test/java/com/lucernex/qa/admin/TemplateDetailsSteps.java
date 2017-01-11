package com.lucernex.qa.admin;

import com.lucernex.qa.views.admin.ManageScheduleTemplate.TaskDetailModalDialogView;
import com.lucernex.qa.views.admin.ManageScheduleTemplate.TemplateDetailsView;
import com.lucernex.qa.views.components.CompoundSelectField;
import com.lucernex.qa.views.components.Field;
import cucumber.api.java.en.And;

import java.util.List;

import static junit.framework.Assert.assertNotNull;
import static junit.framework.Assert.assertTrue;

/**
 * Cucumber steps for sake of Admin->Manage Schedule Templates->Template Details page.
 */
public class TemplateDetailsSteps {
    @And("^I add \"([^\"]*)\" to Auto-Assign by Job Titles$")
    public void I_add_to_Auto_Assign_by_Job_Titles(String jobTitle) {
        TaskDetailModalDialogView dialog = new TaskDetailModalDialogView();
        List<Field>               fields = dialog.getFields();

        assertNotNull(fields);

        CompoundSelectField assignees = null;

        for (Field f : fields) {
            if (f.getName().equals("assignees")) {
                assignees = (CompoundSelectField)f;
                break;
            }
        }

        assertNotNull("Did not see 'Auto-Assign by Job Titles' field", assignees);

        assignees.setValue(jobTitle);
    }

    @And("^I choose \"([^\"]*)\" schedule template on the Template Details admin page$")
    public void I_choose_schedule_template_on_the_Template_Details_admin_page(String templateName) {
        String msg = String.format("Did not see a template named '%s'", templateName);

        assertTrue(msg, TemplateDetailsView.chooseScheduleTemplate(templateName));
    }

    @And("^I click on the \"([^\"]*)\" task item on the Template Details admin page$")
    public void I_click_on_the_task_item_on_the_Template_Details_admin_page(String taskItemName) throws Throwable {
        String msg = String.format("Did not see a task named '%s' in the tree of tasks", taskItemName);

        assertTrue(msg, TemplateDetailsView.clickTaskItemLink(taskItemName));
    }
}
