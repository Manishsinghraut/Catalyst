package com.lucernex.qa.steps.iwms.project.details.schedule;

import com.google.common.collect.Ordering;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.adminpages.companyadministration.managescheduletemplates.ScheduleTemplateView;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import com.lucernex.qa.views.iwms.preserveglobalpages.PreserveGlobalPagesViews;
import com.lucernex.qa.views.iwms.project.details.schedule.ScheduleView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import junit.framework.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.PageFactory;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import static com.lucernex.qa.views.iwms.CommonMethods.setFields;


/**
 * Created by RLE0097 on 4/16/2015.
 */
public class ScheduleSteps {
    private static final Logger logger = Logger.getLogger(ScheduleSteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    @And("^I right click on task \"([^\"]*)\"$")
    public void I_right_click_on_task(String taskName) throws Throwable {
        ScheduleView.rightClickOnTask(taskName);
    }

    @And("^I right click on task \"([^\"]*)\" and perform action \"([^\"]*)\"$")
    public void I_right_click_on_task_and_perform_action(String taskName, String action) throws Throwable {
        ScheduleView.rightClickAndDoFirstLevelAction(taskName, action);

    }

    @And("^I add new task above \"([^\"]*)\" task$")
    public void I_add_new_task_above(String taskName) throws Throwable {
        ScheduleView.addNewTaskAbove(taskName);
    }

    @And("^I open new task information pop up of \"([^\"]*)\" task$")
    public void I_open_task_info_pop_up(String taskName) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.waitTillDivisionLoads();
        ScheduleView.openTaskInfoPopup(taskName);
    }

    @And("^I open new task information pop up of \"([^\"]*)\"$")
    public void I_open_task_info_pop_up_group(String taskName) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.waitTillDivisionLoads();
        ScheduleView.openTaskInfoPopupOfSecondElement(taskName);
    }


    @Given("^I double click on \"([^\"]*)\" task$")
    public void I_double_click_on_task_name(String strButton) throws Throwable {
        try {
//            CommonMethods.clickOnButton(strButton);
            CommonMethods.dblClickButton(strButton);
            logger.info("Clicked " + strButton);
        } catch (Exception Ex) {
            BaseView.takeScreenshot("Clicked " + strButton + ".png");
            logger.info("Error :" + Ex.getMessage());
        }
    }

    public void GoogleTooltip(String strDesc) throws Exception {
        Actions ToolTip1 = new Actions(BrowserDriver.getCurrentDriver());
        WebElement googleLogo = BrowserDriver.getCurrentDriver().findElement(By.xpath(".//span[./text()='" + strDesc + "']"));
        ToolTip1.moveToElement(googleLogo).clickAndHold(googleLogo).perform(); // Perform mouse hover action using 'clickAndHold' method
        String ToolTipText = googleLogo.getText(); // Get the value of Tooltip by getAttribute command
//        Assert.assertEquals(ToolTipText, "Google");
        System.out.println("Tooltip value is: " + ToolTipText);
    }

    @And("^I select Default Holiday Schedule \"([^\"]*)\"$")
    public void I_select_Default_Holiday_Schedule(String strHolidayCalender) throws Throwable {
        SeleniumUtil.getFrameIndex("name", "Program_DefaultHolidayScheduleID");
        setFields("Program_DefaultHolidayScheduleID", strHolidayCalender);
        SeleniumUtil.switchTodefaultContent();
    }

    @And("^I expand gantt chart$")
    public void I_expand_gantt_chart() throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        ScheduleView.expandGanttChart();
        CommonMethods.waitTillDivisionLoads();
    }

    @And("^I click Save Changes tool bar$")
    public void I_save_changes_tool_bar() throws Throwable {
        ScheduleView.clickSaveChangesToolBar();
        CommonMethods.waitTillDivisionLoads();
    }

    @And("^I verify the Baseline Start Date \"([^\"]*)\" and End \"([^\"]*)\" for task \"([^\"]*)\" should be modified successfully$")
    public void I_verify_the_Baseline_Start_Date_and_End_for_task_should_be_modified_successfully(String strTaskName, String strBLStartDate, String strBLEndDate) throws Throwable {
        ScheduleView.verifyBLDates(strTaskName, strBLStartDate, strBLEndDate);
    }

    @And("^I verify the lead lag days \"([^\"]*)\"$")
    public void I_verify_the_lead_lag_days(String strLeadLagDays) throws Throwable {
        ScheduleView.verifyLeadLagDays("Finish-To-Start", strLeadLagDays);
    }

    @And("^I click on the Apply Changes button$")
    public void I_click_on_the_Apply_Changes_button() throws Throwable {
        ScheduleView.applyChanges("Apply Changes");
    }

    @And("^I click and drag the bar graph all the way to the right to show more details for groups and tasks$")
    public void I_click_and_drag_the_bar_graph_all_the_way_to_the_right_to_show_more_details_for_groups_and_tasks() throws Throwable {
        ScheduleView.dragBarGraph();
    }

    @And("^I verify \"([^\"]*)\" task has to change the status will automatically change to \"([^\"]*)\"$")
    public void I_verify_task_has_to_change_the_status_will_automatically_change_to(String strTask, String strStatus) throws Throwable {
        ScheduleView.verifyTheStatusofTask(strTask, strStatus);
    }

    @And("^I double click the % Done field for \"([^\"]*)\" task to bring up in-line editing and enter \"([^\"]*)\" in Done field$")
    public void I_double_click_the_Done_field_for_task_to_bring_up_in_line_editing_and_enter_in_Done_field(String strTask, String strValue) throws Throwable {
        ScheduleView.doubleClickPercentageDoneCol(strTask, strValue);
    }

    @And("^I double click the F/A Start field for \"([^\"]*)\" task to bring up in-line editing and change the year to \"([^\"]*)\"$")
    public void I_double_click_the_F_A_Start_field_for_task_to_bring_up_in_line_editing_and_change_the_year_to(String strTask, String strFAStartDate) throws Throwable {
        ScheduleView.doubleClickFAStartField(strTask, strFAStartDate);
    }

    @And("^I verify \"([^\"]*)\" task has to change the year as \"([^\"]*)\" for both F/A Start and F/A End$")
    public void I_verify_task_has_to_change_the_year_as_for_both_F_A_Start_and_F_A_End(String strTask, String strFADate) throws Throwable {
        ScheduleView.verifyTheFAStartnEndDate(strTask, strFADate);
    }

    @And("^I double click the F/A End field for \"([^\"]*)\" task to bring up in-line editing and change the year to \"([^\"]*)\"$")
    public void I_double_click_the_F_A_End_field_for_task_to_bring_up_in_line_editing_and_change_the_year_to(String strTask, String strFAEndDate) throws Throwable {
        ScheduleView.doubleClickFAEndField(strTask, strFAEndDate);
    }

    @And("^I verify \"([^\"]*)\" task has to change the year as \"([^\"]*)\" for F/A End$")
    public void I_verify_task_has_to_change_the_year_as_for_F_A_End(String strTask, String strFADate) throws Throwable {
        ScheduleView.verifyTheEndDate(strTask, strFADate);
    }

    @And("^I double click the comments field for \"([^\"]*)\" task to bring up in-line editing and add \"([^\"]*)\"$")
    public void I_double_click_the_comments_field_for_task_to_bring_up_in_line_editing_and_add(String strTask, String strComment) throws Throwable {
        ScheduleView.doubleClickCommentField(strTask, strComment);

    }

    @And("^I verify \"([^\"]*)\" task has to populate the \"([^\"]*)\" comment successfully$")
    public void I_verify_task_has_to_populate_the_comment_successfully(String strTask, String strComment) throws Throwable {
        ScheduleView.verifyComment(strTask, strComment);
    }

    @And("^I click on Ok button from file upload popup window$")
    public void I_click_on_Ok_button_from_file_upload_popup_window() throws Throwable {
        ScheduleView.clickOnOkButton();
    }

    @And("^I click the download button next to the file name$")
    public void I_click_the_download_button_next_to_the_file_name() throws Throwable {
        ScheduleView.clickOnDownloadButton();
    }

    @And("^I click on file \"([^\"]*)\" link$")
    public void I_click_on_file_link(String strFileName) throws Throwable {
        ScheduleView.clickOnOkFileLink(strFileName);
    }

    @And("^I add the following \"([^\"]*)\" to the task \"([^\"]*)\"$")
    public void I_add_the_following_predecessor_to_the_task(String addAs, String task, List<String> predecessors) throws Throwable {
        for (String pred : predecessors) {
            CommonMethods.switchToVisibleFrame();
            CommonMethods.dblClickButton(task);
            CommonMethods.waitTillDivisionLoads();
            CommonMethods.clickGridButtonWhenReady(addAs);
            AllContractPagesView.waitTillDivisionLoads();
            CommonMethods.clickOnButton("Add new");
            ScheduleTemplateView.enterTaskName(pred);
            CommonMethods.clickOnButton("Ok");
            CommonMethods.waitTillDivisionLoads();
        }
    }

    @Then("^I verify the following task not present$")
    public void I_verify_the_following_text_not_present(List<String> text) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        ScheduleView.verifyTaskNotPresent(text);
    }

    @And("^I Right click on the (\\d+) \"([^\"]*)\" blue bar \"([^\"]*)\" task on the bar graph/timeline and click \"([^\"]*)\" to edit the task$")
    public void I_Right_click_on_the_blue_bar_task_on_the_bar_graph_timeline_and_click_to_edit_the_task(int intBlueBarRow, String strNth, String strTaskName, String strMenuOption) throws Throwable {
        ScheduleView.rightClickOnBlueBar(intBlueBarRow, strMenuOption);
    }

    @Then("^I verify the task \"([^\"]*)\" of F/A start date \"([^\"]*)\" ,F/A end date \"([^\"]*)\", BL start date \"([^\"]*)\" and BL end date \"([^\"]*)\" shall be reflected correctly on spreed sheet$")
    public void I_verify_the_task_of_F_A_start_date_F_A_end_date_BL_start_date_and_BL_end_date_shall_be_reflected_correctly_on_spreed_sheet(String strTaskName, String strFAStartDate, String strFAEndDate, String strBLStartDate, String strBLEndDate) throws Throwable {
        ScheduleView.verifySpreedSheetViewDates(strTaskName, strFAStartDate, strFAEndDate, strBLStartDate, strBLEndDate);
    }

    @And("^I see the following tasks invisible in collapsed mode in grid \"([^\"]*)\":$")
    public void iSeeTheFollowingTasksInvisibleInCollapsedModeInGrid(String gridId, List<String> textvalues) throws Throwable {
        ScheduleView.verifyRowsInCollapsedMode(gridId, textvalues);
    }

    @And("^I right click on task \"([^\"]*)\" and click on \"([^\"]*)\" then delete \"([^\"]*)\" dependency$")
    public void I_right_click_on_task_and_click_on_then_delete_dependency(String strTaskName, String strMoveMenuOption, String strMenuOptionLink) throws Throwable {
        ScheduleView.rightClickDeleteDependency(strTaskName, strMoveMenuOption, strMenuOptionLink);
    }

    @And("^I right click on task \"([^\"]*)\" and click on \"([^\"]*)\" then verify \"([^\"]*)\" dependency does not exist$")
    public void I_right_click_on_task_and_click_on_then_verify_dependency_does_not_exist(String strTaskName, String strMoveMenuOption, String strMenuOptionLink) throws Throwable {
        ScheduleView.rightClickVerifyDeleteDependency(strTaskName, strMoveMenuOption, strMenuOptionLink);
    }

    @And("^I verify \"([^\"]*)\" should not be displayed Predecessor tab$")
    public void I_verify_should_not_be_displayed_Predecessor_tab(String strTaskName) throws Throwable {
        ScheduleView.vrifyTaskNotDisplayed(strTaskName);
    }

    @And("^I verify \"([^\"]*)\" should be displayed Predecessor tab$")
    public void I_verify_should_be_displayed_Predecessor_tab(String strTaskName) throws Throwable {
        ScheduleView.vrifyTaskDisplayed(strTaskName);
    }

    @Given("^I double click on \"([^\"]*)\" task name$")
    public void I_double_click_on_task(String strButton) throws Throwable {
        ScheduleView.doubleClickOnTaskName(strButton);
    }

    @And("^I verify the following fields value on edit popup of a task$")
    public void I_verify_task_status(List<Field> fields) throws Throwable {
        ScheduleView.iVerifyTheFollowingFieldsValueOnEditPopupOfATask(fields);
    }

    @And("^I set task Status on edit popup of a task$")
    public void I_set_task_Status_on_edit_popup_of_a_task(List<Field> fields) throws Throwable {
        ScheduleView.iSetTaskStatusOnEditPopupOfATask(fields);
    }

    @And("^I verify \"([^\"]*)\" should be displayed Predecessor$")
    public void I_verify_should_be_displayed_Predecessor(String strTaskName) throws Throwable {
        ScheduleView.vrifyTaskDisplayed(strTaskName);
    }

    @Then("^I verify the task \"([^\"]*)\" of Status \"([^\"]*)\" , Done \"([^\"]*)\" , F/A start date \"([^\"]*)\" ,F/A end date \"([^\"]*)\", F/A Duration \"([^\"]*)\", BL start date \"([^\"]*)\" and BL end date \"([^\"]*)\" shall be reflected correctly on spreed sheet$")
    public void I_verify_the_task_of_Status_Done_F_A_start_date_F_A_end_date_F_A_Duration_BL_start_date_and_BL_end_date_shall_be_reflected_correctly_on_spreed_sheet(String strTaskName, String strStatus, String strDone, String strFAStartDate, String strFAEndDate, String strFADuration, String strBLStartDate, String strBLEndDate) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        ScheduleView.verifySpreedSheetViewStatusDates(strTaskName, strStatus, strDone, strFAStartDate, strFAEndDate, strFADuration, strBLStartDate, strBLEndDate);
    }

    @And("^I select \"([^\"]*)\" from Schedule Template dropdown list$")
    public void I_select_from_Schedule_Template_dropdown_list(String strScheduleTemplate) throws Throwable {
        ScheduleView.selectScheduleTemplate(strScheduleTemplate);
    }

    @And("^I select task status \"([^\"]*)\"$")
    public void I_select_task_status(String strTaskStatus) throws Throwable {
        ScheduleView.selectTaskStatus(strTaskStatus);
    }

    @And("^I verify that \"([^\"]*)\" entity exists under the name column with \"([^\"]*)\" \"([^\"]*)\" , \"([^\"]*)\" \"([^\"]*)\", \"([^\"]*)\" \"([^\"]*)\", \"([^\"]*)\" \"([^\"]*)\", \"([^\"]*)\" \"([^\"]*)\", \"([^\"]*)\" \"([^\"]*)\" for the fields$")
    public void I_verify_that_entity_exists_under_the_name_column_with_for_the_fields(String strEntityName, String strTask1FAStartDateCap, String strTask1FAStartDate, String strTaskFAEndDateCap, String strTaskFAEndDate, String strTask1FADurationCap, String strTask1FADuration, String strTask2FAStartDateCap, String strTask2FAStartDate, String Task2FAEndDateCap, String Task2FAEndDate, String Task2FADurationCap, String Task2FADuration) throws Throwable {
        ScheduleView.verifyTheReportGrid(strEntityName, strTask1FAStartDateCap, strTask1FAStartDate, strTaskFAEndDateCap, strTaskFAEndDate, strTask1FADurationCap, strTask1FADuration, strTask2FAStartDateCap, strTask2FAStartDate, Task2FAEndDateCap, Task2FAEndDate, Task2FADurationCap, Task2FADuration);
    }

    @And("^I click the date \"([^\"]*)\" for \"([^\"]*)\" field to open task information pop-up$")
    public void I_click_the_date_for_field_to_open_task_information_pop_up(String strtask1FAStartDate, String strtask1FAStartDateCap) throws Throwable {
        ScheduleView.task1FAStartDate(strtask1FAStartDate);
    }

    @And("^I verify the following 'options to ADD' for the task \"([^\"]*)\"$")
    public void I_verify_the_following_options_to_ADD_for_the_task(String arg1, List<String> options) throws Throwable {
        ScheduleView.optionsToADD(arg1, options);
    }

    @And("^I add new sub task for task \"([^\"]*)\"$")
    public void I_add_new_sub_task_for_task(String taskName) throws Throwable {
        ScheduleView.addNewSubTask(taskName);
    }

    @And("^I add new predecessor for task \"([^\"]*)\"$")
    public void I_add_predecessor_for_task_for_task(String taskName) throws Throwable {
        ScheduleView.addNewPredecessor(taskName);
    }

    @And("^I add new successor for task \"([^\"]*)\"$")
    public void I_add_successor_for_task_for_task(String taskName) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        ScheduleView.addNewSuccessor(taskName);
    }

    @And("^I verify the following tasks converted into a group$")
    public void I_verify_task_into_a_group(List<String> taskName) throws Throwable {
        for (String task : taskName) {
            ScheduleView.verifyTaskConvertedToGroup(task);
        }
    }

    @And("^I enter assignee name \"([^\"]*)\"$")
    public void I_enter_assignee_name(String arg1) throws Throwable {
        CommonMethods.clickButton("Add new");
        ScheduleView.enterAssigneeName(arg1);
    }

    @And("^I verify \"([^\"]*)\" should be displayed task bar$")
    public void I_verify_should_be_displayed_task_bar(String strTaskTip) throws Throwable {
        ScheduleView.verifyTaskTip(strTaskTip);
    }

    @And("^I verify F/A start date \"([^\"]*)\"$")
    public void I_verify_F_A_start_date(String strValue) throws Throwable {
        ScheduleView.verifyFACurrentDate("ActualStartDate", strValue);
    }

    @And("^I verify F/A end date \"([^\"]*)\"$")
    public void I_verify_F_A_end_date(String strValue) throws Throwable {
        ScheduleView.verifyFACurrentDate("ActualEndDate", strValue);
    }

    @And("^I verify the F/A Start Date \"([^\"]*)\" and End \"([^\"]*)\" for task \"([^\"]*)\"$")
    public void iVerifyTheFAStartDateAndEndForTask(String faStartdate, String faEndDate, String taskname) throws Throwable {
        ScheduleView.verifyFADates(taskname, faStartdate, faEndDate);
    }

    @Then("^I click on \"([^\"]*)\" tab in the popup window of edit task$")
    public void iClickOnTabInThePopupWindowOfEditTask(String tabname) throws Throwable {
        ScheduleView.clickTabInPopupOfEditTask(tabname);
    }

    @And("^I verify members are displayed in alphabetical order in the dropdown of edit task$")
    public void iVerifyMembersAreDisplayedInAlphabeticalOrderInTheDropdownOfEditTask() throws Throwable {

        WebElement element = BrowserDriver.getCurrentDriver().findElement(By.xpath("//div[contains(@class,'x-css-shadow')]/following-sibling::div[contains(@class,'x-window')]//div[starts-with(@id,'headercontainer')][1]//following-sibling::div//input[@role='combobox']"));
        Actions builder = new Actions(BrowserDriver.getCurrentDriver());
        builder.moveToElement(element).click().sendKeys(Keys.ARROW_DOWN);
        builder.perform();

        List<WebElement> elements = BrowserDriver.getCurrentDriver().findElements(By.cssSelector("ul[id^='boundlist']>li"));
        ArrayList<String> list = new ArrayList<String>();
        for (WebElement e : elements) {
            System.out.println(e.getText());
            list.add(e.getText());
        }
        boolean isSorted = Ordering.natural().isOrdered(list);

        if (isSorted) {
            logger.info("Members are displayed in alphabetical order");
        } else {
            BaseView.takeScreenshot("Members are not displayed in alphabetical order ");
            logger.info("Error : Members are not displayed in alphabetical order ");
            Assert.fail("Members are not displayed in alphabetical order ");
        }
    }

    @And("^I verify list of assignees for the \"([^\"]*)\"$")
    public void iVerifyListOfAssigneesForThe(String taskname, List<String> assignees) throws Throwable {
        ScheduleView.verifyListOfAssignee(taskname, assignees);
    }

    @And("^I select the following assignee name and remove from the task$")
    public void iSelectTheFollowingAssigneeNameAndRemoveFromTheTask(List<String> assignees) throws Throwable {
        ScheduleView.finduserAndremove(assignees);
    }

    @And("^I click on \"([^\"]*)\" button in the forms tab for given entity$")
    public void iClickOnButtonInTheFormsTabForGivenEntity(String button) throws Throwable {
        ScheduleView.clickOnbuttonofFormstab(button);
    }

    @And("^I select \"([^\"]*)\" from SelectFrom dropdown$")
    public void iSelectFromSelectFromDropdown(String selectvalue) throws Throwable {
        ScheduleView.selectForm(selectvalue);
    }

    @And("^I enter task type \"([^\"]*)\"$")
    public void I_enetr_task_type(String taskType) throws Throwable {
        ScheduleView.enterTaskType(taskType);
    }

    @And("^I enter lead lag days \"([^\"]*)\"$")
    public void I_enetr_lead_lag_days(String days) throws Throwable {
        ScheduleView.enterTaskLeadLagDays(days);
    }

    @Then("^I enter following details for the new task \"([^\"]*)\"$")
    public void iEnterFollowingDetailsForTheNewTask(String arg1, List<String> val) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        ScheduleTemplateView.enterTaskName(arg1);
        ScheduleView.enterDetailsOfTaskInSuccessorTab(val);
    }

    @Then("^I verify the following tasks in a page$")
    public void I_verify_menu_item_in_a_page(List<String> text) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        for (String f : text) {
            PreserveGlobalPagesViews.verifyText(f);
        }
    }

    @And("^I change the Forecast/Actual \"([^\"]*)\" to (\\d+) working days from todays date$")
    public void I_change_the_Forecast_Actual_to_working_days_from_todays_date(String strFADate, int intDays) throws Throwable {
        ScheduleView.setFADates(strFADate, intDays);
    }

    @Then("^I verify the task \"([^\"]*)\" of Status \"([^\"]*)\" , Done \"([^\"]*)\" , F/A start date \"([^\"]*)\" pluse (\\d+) working days ,F/A end date \"([^\"]*)\" pluse (\\d+) working days shall be reflected correctly on spreed sheet$")
    public void I_verify_the_task_of_Status_Done_F_A_start_date_pluse_working_days_F_A_end_date_pluse_working_days_shall_be_reflected_correctly_on_spreed_sheet(String strTaskName, String strStatus, String strDone, String strFAStartDate, int startDays, String strFAEndDate, int endDays) throws Throwable {
        ScheduleView.verifySpreedSheetViewStatusDates(strTaskName, strStatus, strDone, strFAStartDate, startDays, strFAEndDate, endDays);
    }

    @And("^I click on \"([^\"]*)\" tab of editing task pop-up window$")
    public void I_click_on_tab_of_editing_task_pop_up_window(String strTab) throws Throwable {
        ScheduleView.clickOnTab(strTab);
    }

    @And("^I click \"([^\"]*)\" link My activities window from dashboard$")
    public void I_click_link_My_activities_window_from_dashboard(String link) throws Throwable {
        ScheduleView.clickOnTaskFromMyActivitiesWindowFromDashboard(link);
    }

    @And("^I click on \"([^\"]*)\" present under colum number \"([^\"]*)\" for the \"([^\"]*)\"$")
    public void iClickOnPresentUnderColumNumberForThe(String value, String columnumber, String entityname) throws Throwable {
        ScheduleView.clickvaluefortheEntity(value, columnumber, entityname);
    }

    @And("^I verify there is no tasks under \"([^\"]*)\" tab$")
    public void iVerifyThereIsNoTasksUnderTab(String tabname) throws Throwable {
        ScheduleView.verifyThereIsNoTasks(tabname);
    }

    @And("^I close My activities window from dashboard$")
    public void iCloseMyActivitiesWindowFromDashboard() throws Throwable {
        ScheduleView.closeMyActivitiesWindow();
    }

    @And("^I select Match Lease and Fiscal Year Ends$")
    public void I_select_Match_Lease_and_Fiscal_Year_Ends() throws Throwable {
        ScheduleView.selectMatchLeaseFiscalYearEnds();
    }

    @And("^I verify \"([^\"]*)\" should be displayed Successors tab$")
    public void I_verify_should_be_displayed_Successors_tab(String strTaskName) throws Throwable {
        ScheduleView.vrifyTaskDisplayed(strTaskName);
    }

    @Then("^I verify the task \"([^\"]*)\" of slack \"([^\"]*)\" shall be reflected correctly on spreed sheet$")
    public void I_verify_the_task_of_slack_shall_be_reflected_correctly_on_spreed_sheet(String strTaskName, String strSlackDays) throws Throwable {
        ScheduleView.verifySlackDaysOnSpreedSheetView(strTaskName, strSlackDays);
    }

    @And("^I click on the \"([^\"]*)\" button on the gantt$")
    public void I_click_on_the_button_on_the_gantt(String arg1) throws Throwable {
        ScheduleView.clickOnHighlightCriticalPath();
    }

    @And("^I verify the last part of the schedule bars will start blinking in red while the rest of the schedule bars become blurred$")
    public void I_verify_the_last_part_of_the_schedule_bars_will_start_blinking_in_red_while_the_rest_of_the_schedule_bars_become_blurred() throws Throwable {
        ScheduleView.verifyBlinkingBar();
    }

    @And("^I click the \"([^\"]*)\" button on the gantt$")
    public void I_click_the_button_on_the_gantt(String strTimeSpan) throws Throwable {
        ScheduleView.clickOnTimeSpan(strTimeSpan);
    }

    @And("^I verify the date range on top of the schedule bars \"([^\"]*)\" and \"([^\"]*)\"$")
    public void I_verify_the_date_range_on_top_of_the_schedule_bars_and(String str1stScheduleBarDate, String str2ndScheduleBarDate) throws Throwable {
        ScheduleView.verifyScheduleBarDateRange(str1stScheduleBarDate, str2ndScheduleBarDate);
    }

    @And("^I right click on a task \"([^\"]*)\" and select menu option \"([^\"]*)\" to open task information pop-up$")
    public void I_right_click_on_a_task_and_select_menu_option_to_open_task_information_pop_up(String strTaskName, String stMenuOption) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        ScheduleView.openTaskInfoPopup(strTaskName, stMenuOption);
    }

    @And("^I verify the orange colored bars on the time line will move to the new dates$")
    public void I_verify_the_orange_colored_bars_on_the_time_line_will_move_to_the_new_dates() throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        ScheduleView.verifyOrangeColoredBars();
    }

    @And("^I verify all the orange bars in the timeline will disappear$")
    public void I_verify_all_the_orange_bars_in_the_timeline_will_disappear() throws Throwable {
        ScheduleView.verifyOrangeColoredBarsdisappears();
    }

    @And("^I enter \"([^\"]*)\" in search box for search a task in gantt chart grid$")
    public void I_enter_in_search_box_for_search_a_task_in_gantt_chart_grid(String strSearchTaskName) throws Throwable {
        ScheduleView.searchTask(strSearchTaskName);
    }

//    @And("^I move the cursor to \"([^\"]*)\" to display the sorting drop-down and select \"([^\"]*)\"$")
//    public void I_move_the_cursor_to_to_display_the_sorting_drop_down_and_select(String strSearchTaskName, String strSortingOption) throws Throwable {
//        ScheduleView.sortGanttChartGrid(strSearchTaskName, strSortingOption);
//    }

    @And("^I verify the following sorted \"([^\"]*)\" in \"([^\"]*)\"$")
    public void I_verify_the_following_sorted_in(String strField, String strSortedOption, List<String> strSortedFields) throws Throwable {
        int intTableCount = 0;
        for (String strSortedField : strSortedFields) {
            ScheduleView.verifySortedFields(strSortedField, intTableCount);
            intTableCount++;
        }
    }

    @And("^I click on the \"([^\"]*)\" button at the top$")
    public void I_click_on_the_button_at_the_top(String strZoomButton) throws Throwable {
        ScheduleView.clickOnZoomButton(strZoomButton);
    }

//    @And("^I verify Zoom out is clicked Month shall be displayed along with Weeks for the specific month$")
//    public void I_verify_Zoom_out_is_clicked_Month_shall_be_displayed_along_with_Weeks_for_the_specific_month() throws Throwable {
//        ScheduleView. verifyWeeksForTheSpecificMonth(106);
//    }


//    @And("^I verify Zoom out is clicked Quarters shall be displayed$")
//    public void I_verify_Zoom_out_is_clicked_Quarters_shall_be_displayed(List<String> strQurters) throws Throwable {
//        String qurters="";
//        for (String strQurter : strQurters) {
//            qurters=qurters.trim()+strQurter.trim();
//        }
//            ScheduleView.verifyTimeLine(qurters);
//    }

//    @And("^I verify Zoom out is clicked year shall be displayed with month$")
//    public void I_verify_Zoom_out_is_clicked_year_shall_be_displayed_with_month(List<String> strtimeLines) throws Throwable {
//        String timeLine="";
//        for (String strtimeLine : strtimeLines) {
//            timeLine=timeLine.trim()+strtimeLine.trim();
//        }
//        ScheduleView.verifyTimeLine(timeLine);
//    }

//    @And("^I verify Zoomed out to max shall displays years with five year span$")
//    public void I_verify_Zoomed_out_to_max_shall_displays_years_with_five_year_span(List<String> strtimeLines) throws Throwable {
//        String timeLine="";
//        for (String strtimeLine : strtimeLines) {
//            timeLine=timeLine.trim()+strtimeLine.trim();
//        }
//        ScheduleView.verifyTimeLine(timeLine);
//    }

    @And("^I clicking on Zoom to fit shall display the default view$")
    public void I_clicking_on_Zoom_to_fit_shall_display_the_default_view(List<String> strDates) throws Throwable {
        String strTopHeaderDates = "", strBottomHeaderDates = "";
        int intLineCount = 1;
        for (String strDate : strDates) {
            if (intLineCount == 1) {
                strTopHeaderDates = strTopHeaderDates.trim() + strDate.trim().replace("~", "\n");
            } else {
                strBottomHeaderDates = strBottomHeaderDates.trim() + strDate.trim().replace("~", "\n");
            }
            intLineCount++;
        }

        ScheduleView.verifyTopHeaderDates(strTopHeaderDates);
        ScheduleView.verifyBottomHeaderDates(strBottomHeaderDates);
    }

    @And("^I verify when Zoom in button is clicked Month shall be displayed along with Weeks for the specific month$")
    public void I_verify_when_Zoom_in_button_is_clicked_Month_shall_be_displayed_along_with_Weeks_for_the_specific_month(List<String> strDates) throws Throwable {
        String strTopHeaderDates = "", strBottomHeaderDates = "";
        int intLineCount = 1;
        for (String strDate : strDates) {
            if (intLineCount == 1) {
                strTopHeaderDates = strTopHeaderDates.trim() + strDate.trim().replace("~", "\n");
            } else {
                strBottomHeaderDates = strBottomHeaderDates.trim() + strDate.trim().replace("~", "\n");
            }
            intLineCount++;
        }

        ScheduleView.verifyTopHeaderDates(strTopHeaderDates);
        ScheduleView.verifyBottomHeaderDates(strBottomHeaderDates);
    }

    @And("^I verify when Zoom in button is clicked hours shall be displayed along with days for the specific month$")
    public void I_verify_when_Zoom_in_button_is_clicked_hours_shall_be_displayed_along_with_days_for_the_specific_month(List<String> strDates) throws Throwable {
        String strTopHeaderDates = "", strBottomHeaderDates = "";
        int intLineCount = 1;
        for (String strDate : strDates) {
            if (intLineCount == 1) {
                strTopHeaderDates = strTopHeaderDates.trim() + strDate.trim();
            } else {
                strBottomHeaderDates = strBottomHeaderDates.trim() + strDate.trim();
            }
            intLineCount++;
        }

        ScheduleView.verifyTopHeaderDates(strTopHeaderDates);
        ScheduleView.verifyBottomHeaderDates(strBottomHeaderDates);
    }

    @And("^I verify when Zoom in button is clicked minuts shall be displayed along with hours for the specific day$")
    public void I_verify_when_Zoom_in_button_is_clicked_minuts_shall_be_displayed_along_with_hours_for_the_specific_day(List<String> strDates) throws Throwable {
        String strTopHeaderDates = "", strBottomHeaderDates = "";
        int intLineCount = 1;
        for (String strDate : strDates) {
            if (intLineCount <= 3) {
                strTopHeaderDates = strTopHeaderDates.trim() + strDate.trim();
            } else {
                strBottomHeaderDates = strBottomHeaderDates.trim() + strDate.trim();
            }
            intLineCount++;
        }

        ScheduleView.verifyTopHeaderDates(strTopHeaderDates);
        ScheduleView.verifyBottomHeaderDates(strBottomHeaderDates);
    }

    @And("^I verify when Zoom in button is clicked seconds shall be displayed along with hours for the specific day$")
    public void I_verify_when_Zoom_in_button_is_clicked_seconds_shall_be_displayed_along_with_hours_for_the_specific_day(List<String> strDates) throws Throwable {
        String strTopHeaderDates = "", strBottomHeaderDates = "";
        int intLineCount = 1;
        for (String strDate : strDates) {
            if (intLineCount == 1) {
                strTopHeaderDates = strTopHeaderDates.trim() + strDate.trim();
            } else {
                strBottomHeaderDates = strBottomHeaderDates.trim() + strDate.trim();
            }
            intLineCount++;
        }

        ScheduleView.verifyTopHeaderDates(strTopHeaderDates);
        ScheduleView.verifyBottomHeaderDates(strBottomHeaderDates);
    }

    @And("^I verify the full screen of gantt chart schedule view$")
    public void I_verify_the_full_screen_of_gantt_chart_schedule_view() throws Throwable {
        ScheduleView.verifyGanttChartFullScreen();
    }

    @And("^I verify the defualt view of the gantt chart$")
    public void I_verify_the_defualt_view_of_the_gantt_chart() throws Throwable {
        ScheduleView.verifyDefualtGanttChartView();
    }

    @And("^I verify the defualt gantt chart view$")
    public void I_verify_the_defualt_gantt_chart_view(List<String> strDates) throws Throwable {
        String strTopHeaderDates = "", strBottomHeaderDates = "";
        int intLineCount = 1;
        for (String strDate : strDates) {
            if (intLineCount == 1) {
                strTopHeaderDates = strTopHeaderDates.trim() + strDate.trim().replace("~", "\n");
            } else {
                strBottomHeaderDates = strBottomHeaderDates.trim() + strDate.trim().replace("~", "\n");
            }
            intLineCount++;
        }

        ScheduleView.verifyTopHeaderDates(strTopHeaderDates);
        ScheduleView.verifyBottomHeaderDates(strBottomHeaderDates);
    }

    @And("^I verify when Zoom out button is clicked year shall be displayed along with Months$")
    public void I_verify_when_Zoom_out_button_is_clicked_year_shall_be_displayed_along_with_Months(List<String> strDates) throws Throwable {
        String strTopHeaderDates = "", strBottomHeaderDates = "";
        int intLineCount = 1;
        for (String strDate : strDates) {
            if (intLineCount == 1) {
                strTopHeaderDates = strTopHeaderDates.trim() + strDate.trim().replace("~", "\n");
            } else {
                strBottomHeaderDates = strBottomHeaderDates.trim() + strDate.trim().replace("~", "\n");
            }
            intLineCount++;
        }

        ScheduleView.verifyTopHeaderDates(strTopHeaderDates);
        ScheduleView.verifyBottomHeaderDates(strBottomHeaderDates);
    }

    @And("^I verify when Zoom out button is clicked year shall be displayed along with Quarters$")
    public void I_verify_when_Zoom_out_button_is_clicked_year_shall_be_displayed_along_with_Quarters(List<String> strDates) throws Throwable {
        String strTopHeaderDates = "", strBottomHeaderDates = "";
        int intLineCount = 1;
        for (String strDate : strDates) {
            if (intLineCount == 1) {
                strTopHeaderDates = strTopHeaderDates.trim() + strDate.trim().replace("~", "\n");
            } else {
                strBottomHeaderDates = strBottomHeaderDates.trim() + strDate.trim().replace("~", "\n");
            }
            intLineCount++;
        }

        ScheduleView.verifyTopHeaderDates(strTopHeaderDates);
        ScheduleView.verifyBottomHeaderDates(strBottomHeaderDates);
    }

    @And("^I verify Zoomed out to max shall displays years with five year span$")
    public void I_verify_Zoomed_out_to_max_shall_displays_years_with_five_year_span(List<String> strDates) throws Throwable {
        String strTopHeaderDates = "";
        for (String strDate : strDates) {
            strTopHeaderDates = strTopHeaderDates.trim() + strDate.trim().replace("~", "\n");
        }
        ScheduleView.verifyTopHeaderDates(strTopHeaderDates);
    }

    @And("^I verify when Zoom out button is clicked Month shall be displayed along with Weeks for the specific month$")
    public void I_verify_when_Zoom_out_button_is_clicked_Month_shall_be_displayed_along_with_Weeks_for_the_specific_month(List<String> strDates) throws Throwable {
        String strTopHeaderDates = "", strBottomHeaderDates = "";
        int intLineCount = 1;
        for (String strDate : strDates) {
            if (intLineCount == 1) {
                strTopHeaderDates = strTopHeaderDates.trim() + strDate.trim().replace("~", "\n");
            } else {
                strBottomHeaderDates = strBottomHeaderDates.trim() + strDate.trim().replace("~", "\n");
            }
            intLineCount++;
        }
        ScheduleView.verifyTopHeaderDates(strTopHeaderDates);
        ScheduleView.verifyBottomHeaderDates(strBottomHeaderDates);
    }

    @And("^I move the cursor to \"([^\"]*)\" to display the sorting drop-down and select \"([^\"]*)\" from grid \"([^\"]*)\"$")
    public void I_move_the_cursor_to_to_display_the_sorting_drop_down_and_select_from_grid(String strHeader, String strSortOrder, String strGridID) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        AllContractPagesView.sortColumn(strGridID, strHeader, strSortOrder);
    }

    @And("^I move the cursor to the following headers in the grid \"([^\"]*)\" view downward arrow$")
    public void I_move_the_cursor_to_to_display_the_sorting_drop_down_and_select_from_grid(String strGridID, List<String> headers) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        for (String header : headers) {
            ScheduleView.verifyDownwardArrowInHeaders(strGridID, header);
        }
    }

    @And("^I drag the vertical split bar to right$")
    public void I_drag_the_vertical_split_bar_to_right_corner() throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        ScheduleView.dragVerticalSplitBarToRight();
        CommonMethods.waitTillDivisionLoads();
    }

    @And("^I verify the following menu items exist for column header \"([^\"]*)\" in the grid  \"([^\"]*)\"$")
    public void I_verify_the_following_menu_items_exist_for_the_header(String header, String gridID, List<String> menuItems) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        ScheduleView.verifyColumns(gridID, header, "Columns", menuItems);
    }

    @And("^I select the following menu items exist for column header \"([^\"]*)\" in the grid  \"([^\"]*)\"$")
    public void I_select_the_following_menu_items_exist_for_the_header(String header, String gridID, List<String> menuItems) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        ScheduleView.selectColumns(gridID, header, "Columns", menuItems);
    }

    @And("^I deselect the following menu items exist for column header \"([^\"]*)\" in the grid  \"([^\"]*)\"$")
    public void I_deselect_the_following_menu_items_exist_for_the_header(String header, String gridID, List<String> menuItems) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        ScheduleView.deselectColumns(gridID, header, "Columns", menuItems);

    }

    @And("^I deselect the following header items exist for column header \"([^\"]*)\" in the grid \"([^\"]*)\"$")
    public void I_deselect_the_following_header_items_exist_for_the_header(String header, String gridID, List<String> menuItems) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        ScheduleView.deselectColumnHeaders(gridID, header, "Columns", menuItems);
    }

    @And("^I verify the following headers not present in grid \"([^\"]*)\"$")
    public void I_verify_the_following_headers_not_present(String gridID, List<String> headers) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        ScheduleView.verifyHeaderInVisibleAfterDeselectingColumn(gridID, headers);
    }

    @And("^I verify the following headers present in grid \"([^\"]*)\"$")
    public void I_verify_the_following_headers_present(String gridID, List<String> headers) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        ScheduleView.verifyHeaderVisibleAfterSelectingColumn(gridID, headers);
    }

    @And("^I open document upload window$")
    public void I_open_document_upload_window() throws Throwable {
        ScheduleView.openDocumentUploadWindow();
    }

    @When("^I select the following folders$")
    public void I_select_the_following(List<String> folderName) {
        SeleniumUtil.switchTodefaultContent();
        for (String f : folderName) {
            ScheduleView.selectFoldersInDocumentUploadWindow(f);
        }
    }

    @And("^I verify blue bar \"([^\"]*)\" at position \"([^\"]*)\"$")
    public void I_verify_blue_bar_at_position(String optionPresentOrNot, Integer position) throws Throwable {
        ScheduleView.verifyBlueBarPresentOrNot(position, optionPresentOrNot);
    }

    @And("^I verify that \"([^\"]*)\" tab grid is blank and no items exist$")
    public void I_verify_that_tab_grid_is_blank_and_no_items_exist(String arg1) throws Throwable {
        ScheduleView.verifyBlankGridTab();
    }

    @And("^I click and drag the end of the first blue bar Task (\\d+) bubble downwards till the beginning of the second blue bar Task (\\d+) just below and connect the two bubbles together$")
    public void I_click_and_drag_the_end_of_the_first_blue_bar_Task_bubble_downwards_till_the_beginning_of_the_second_blue_bar_Task_just_below_and_connect_the_two_bubbles_together(int arg1, int arg2) throws Throwable {
        ScheduleView.dragandDropBubble();
    }

    @And("^I verify The second blue bar Task (\\d+) will move down the timeline and will now start at the end of Task (\\d+) January (\\d+)nd$")
    public void I_verify_The_second_blue_bar_Task_will_move_down_the_timeline_and_will_now_start_at_the_end_of_Task_January_nd(int arg1, int arg2, int arg3) throws Throwable {
        ScheduleView.verifyBlueBarPostion();
    }

    @And("^I click and drag the last blue bar Task (\\d+) and move it one day in the past$")
    public void I_click_and_drag_the_last_blue_bar_Task_and_move_it_one_day_in_the_past(int arg1) throws Throwable {
        ScheduleView.dragandDropBluebar();
    }

    @And("^I Hover over the start of the last blue bar task (\\d+) and drag the task to match the blue bar before it$")
    public void I_Hover_over_the_start_of_the_last_blue_bar_task_and_drag_the_task_to_match_the_blue_bar_before_it(int arg1) throws Throwable {
        ScheduleView.dragandDropStartBluebartoBegin();
    }

    @And("^I drag the end of the blue bar to extend to Jan (\\d+)$")
    public void I_drag_the_end_of_the_blue_bar_to_extend_to_Jan(int arg1) throws Throwable {
        ScheduleView.dragEndOfLastBluebartoExtend();
    }

    @Then("^I verify the task \"([^\"]*)\" of Status \"([^\"]*)\" , Done \"([^\"]*)\" , F/A start date \"([^\"]*)\" ,F/A end date \"([^\"]*)\", F/A Duration \"([^\"]*)\", BL start date \"([^\"]*)\" and BL end date \"([^\"]*)\" shall be reflected correctly on the spreed sheet$")
    public void I_verify_the_task_of_Status_Done_F_A_start_date_F_A_end_date_F_A_Duration_BL_start_date_and_BL_end_date_shall_be_reflected_correctly_on_the_spreed_sheet(String strTaskName, String strStatus, String strDone, String strFAStartDate, String strFAEndDate, String strFADuration, String strBLStartDate, String strBLEndDate) throws Throwable {
        ScheduleView.verifySpreedSheetViewStatusDates(1, strTaskName, strStatus, strDone, strFAStartDate, strFAEndDate, strFADuration, strBLStartDate, strBLEndDate);
    }

    @And("^I verify the task \"([^\"]*)\" will be populated in the grid with \"([^\"]*)\" as the type$")
    public void I_verify_the_task_will_be_populated_in_the_grid_with_as_the_type(String strTaskName, String strType) throws Throwable {
        ScheduleView.verifyTaskType(strTaskName, strType);
    }

    @And("^I right click on the (\\d+)\"([^\"]*)\" blue bar in the gantt associated to task \"([^\"]*)\" and select menu option \"([^\"]*)\" to open task information pop-up$")
    public void I_right_click_on_the_blue_bar_in_the_gantt_associated_to_task_and_select_menu_option_to_open_task_information_pop_up(int intRowNo, String strRowName, String strTaskName, String strOption) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        ScheduleView.openTaskInfoPopup(intRowNo, strRowName, strTaskName, strOption);
    }

    @And("^I verify the second blue bar will start after the first blue bar$")
    public void I_verify_the_second_blue_bar_will_start_after_the_first_blue_bar() throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        ScheduleView.blueBarPotion(2, "left: " + ScheduleView.getPositionOfTask("03 Jan") + "px;");
        //ScheduleView.blueBarPotion(2, "left: 356px;");
    }

    @And("^I verify the fourth Blue bar will start after the Third blue bar$")
    public void I_verify_the_fourth_Blue_bar_will_start_after_the_Third_blue_bar() throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        ScheduleView.blueBarPotion(4, "left: " + ScheduleView.getPositionOfTask("07 Jan") + "px;");
        //ScheduleView.blueBarPotion(4, "left: 640px;");
    }

    @Then("^I verify the task \"([^\"]*)\" of Assignees \"([^\"]*)\" shall be reflected correctly on the spreed sheet$")
    public void I_verify_the_task_of_Assignees_shall_be_reflected_correctly_on_the_spreed_sheet(String strTaskName, String strAssignees) throws Throwable {
        ScheduleView.verifySpreedSheetViewAssignees(1, strTaskName, strAssignees);
    }

    @And("^I right click on a task \"([^\"]*)\" and select menu option \"([^\"]*)\" to delete the task$")
    public void I_right_click_on_a_task_and_select_menu_option_to_delete_the_task(String strTaskName, String stMenuOption) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        ScheduleView.openTaskInfoPopup(strTaskName, stMenuOption);
    }

    @Then("^I verify the task \"([^\"]*)\" does not exist in the spreed sheet$")
    public void I_verify_the_task_does_not_exist_in_the_spreed_sheet(String strTaskName) throws Throwable {
        ScheduleView.verifyInSpreedSheetViewTaskName(strTaskName);
    }

    @And("^I verify the following headers not present in frame grid \"([^\"]*)\"$")
    public void I_verify_the_following_headers_not_present_in_frame_grid(String gridID, List<String> headers) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        CommonMethods.switchToVisibleFrame();
        CommonMethods.waitTillDivisionLoads();
        ScheduleView.verifyHeaderIsInVisibleAfterDeselectingColumn(gridID, headers);
    }

    @Then("^I verify the following assignees present in Edit task information pop up of entity \"([^\"]*)\"$")
    public void I_verify_the_following_assignees_present_in_Edit_task_information_pop_up_of_entity(String entity, List<String> assignees) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        ScheduleView.verifyAssigneesInEditTaskPopup(entity, assignees);
    }

    @Then("^I verify the following assignees not present in Edit task information pop up of entity \"([^\"]*)\"$")
    public void I_verify_the_following_assignees_not_present_in_Edit_task_information_pop_up_of_entity(String entity, List<String> assignees) throws Throwable {
        CommonMethods.waitTillDivisionLoads();
        ScheduleView.verifyAssigneesInEditTaskPopupNotPresent(entity, assignees);
    }

    @And("^I add the following task on \"([^\"]*)\" tab to the \"([^\"]*)\" task$")
    public void I_add_the_following_task_on_tab_to_the_task(String addAs, String task, List<String> predecessors) throws Throwable {
        CommonMethods.switchToVisibleFrame();
        CommonMethods.dblClickButton(task);
        for (String pred : predecessors) {
            CommonMethods.waitTillDivisionLoads();
            CommonMethods.clickGridButtonWhenReady(addAs);
            AllContractPagesView.waitTillDivisionLoads();
            CommonMethods.clickOnButton("Add new");
            ScheduleTemplateView.enterTaskName(pred);
        }
        CommonMethods.clickOnButton("Ok");
        CommonMethods.waitTillDivisionLoads();
    }

    @And("^I click on the button contains text \"([^\"]*)\"$")
    public void I_click_on_the_button_contains_text_(String button) throws Throwable {
        ScheduleView.clickOnbuttonofFormstab(button);
    }
}