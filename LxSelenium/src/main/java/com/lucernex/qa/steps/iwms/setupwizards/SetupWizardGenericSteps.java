package com.lucernex.qa.steps.iwms.setupwizards;

import com.lucernex.qa.views.setupwizards.SetupWizardGenericView;
import cucumber.api.java.en.And;

import java.util.logging.Logger;


/**
 * Created by RLE0097 on 4/16/2015.
 */
public class SetupWizardGenericSteps {
    private static final Logger logger = Logger.getLogger(SetupWizardGenericSteps.class.getName());

    @And("^I select an option \"([^\"]*)\" from folder template list$")
    public void I_select_an_option_from_folder_template_list(String folderTemplate) throws Throwable {
        SetupWizardGenericView.selectFolderTemplateFromList(folderTemplate);
    }

    @And("^I select an option \"([^\"]*)\" from template list$")
    public void I_select_an_option_from_template_list(String template) throws Throwable {
        SetupWizardGenericView.selectTemplateFromList(template);
    }

    @And("^I select portfolio \"([^\"]*)\" from Create Organization Chart by duplicating Organization Chart list$")
    public void I_select_portfolio_from_list(String portfolio) throws Throwable {
        SetupWizardGenericView.selectPortfolioFromList(portfolio);
    }

    @And("^I select \"([^\"]*)\" from project folder template list$")
    public void I_select_an_option_from_project_folder_template_list(String template) throws Throwable {
        SetupWizardGenericView.selectProjectTemplate(template);
    }

    @And("^I select \"([^\"]*)\" from program folder template list$")
    public void I_select_an_option_from_program_folder_template_list(String template) throws Throwable {
        SetupWizardGenericView.selectProgramTemplate(template);
    }

    @And("^I select \"([^\"]*)\" from project schedule template list$")
    public void I_select_an_option_from_project_schedule_template_list(String template) throws Throwable {
        SetupWizardGenericView.selectProjectTemplate(template);
    }

    @And("^I select \"([^\"]*)\" from program schedule template list$")
    public void I_select_an_option_from_program_schedule_template_list(String template) throws Throwable {
        SetupWizardGenericView.selectProgramTemplate(template);
    }

    @And("^I check \"([^\"]*)\" facility checkbox in the grid$")
    public void I_check_project_facility_in_the_grid(String project) throws Throwable {
        SetupWizardGenericView.checkProject(project);
    }

    @And("^I delete incomplete setup wizard if exist$")
    public void I_delete_incomplete_setup_wizard() throws Throwable {
        SetupWizardGenericView.deleteIncompleteWizard();
    }
}