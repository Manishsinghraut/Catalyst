package com.lucernex.qa.steps.iwms.adminpages.companyadministration.managescheduletemplates;

import com.lucernex.qa.data.Field;
import com.lucernex.qa.data.HolidayCalendarFields;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.adminpages.companyadministration.managescheduletemplates.ScheduleTemplateView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.junit.Assert;

import java.util.List;

/**
 * Created by rle0239 on 06/29/2015.
 */
public class ScheduleTemplateSteps {

    @And("^I click \"([^\"]*)\" link of \"([^\"]*)\" in grid \"([^\"]*)\"$")
    public void I_click_grid_actions_link(String actions, String strItem, String gridID) throws Throwable {
        ScheduleTemplateView.gridActions(strItem, actions,gridID);
    }

    @Then("^I verify grid item \"([^\"]*)\" present is \"([^\"]*)\" in grid \"([^\"]*)\"$")
    public void I_verify_grid_item(String strItem, boolean present, String gridID) throws Throwable{
        ScheduleTemplateView.verifyGridItem(strItem, present,gridID);
    }

    @And("^I select template \"([^\"]*)\" from the list$")
    public void I_select_template_from_the_list(String arg1) throws Throwable {
        ScheduleTemplateView.selectTemplate(arg1);
    }

    @And("^I Enter the \"([^\"]*)\" Lead/Lag Days$")
    public void I_Enter_the_Lead_Lag_Days(String strLeadrLagDays) throws Throwable {
        ScheduleTemplateView.enterLeadrLagDays(strLeadrLagDays);
    }

    @And("^I verify Group and Task Should be added as predecessors for the task$")
    public void I_verify_Group_and_Task_Should_be_added_as_predecessors_for_the_task(List<Field> fields) {
        for (Field f : fields) {
            ScheduleTemplateView.verifyPredecessorsGroupTask(f.getName(), f.getValue());
        }
    }

    @And("^I verify the project schedule$")
    public void I_verify_the_project_schedule(List<Field> fields) {
        for (Field f : fields){
            ScheduleTemplateView.verifyProjectSchedule(f.getValue());
        }
    }

    @And("^(\\d+) bars of Weekends and the Holiday dates on the Gantt should show in a darker shade of Grey$")
    public void bars_of_Weekends_and_the_Holiday_dates_on_the_Gantt_should_show_in_a_darker_shade_of_Grey(int intCount) {
        ScheduleTemplateView.verifyGanttDarkerShadeOfGrey(intCount);
    }

    @And("^I verify holiday calendar sort order$")
    public void I_verify_holiday_calendar_sort_order(List <HolidayCalendarFields> HolidayCalendarFields){
        int intRowCount =1;
        for (HolidayCalendarFields f : HolidayCalendarFields) {
            ScheduleTemplateView.verifyHolidayCalender(intRowCount, f.getHolidayName(), f.getYear(), f.getMonth(), f.getDay());
            intRowCount++;
        }
    }

    @And("^I click on manage company update button$")
    public void I_click_on_manage_company_update_button() {
        ScheduleTemplateView.clickOnUpdateButton();
    }

    @And("^I verify Firm level Holiday calendar \"([^\"]*)\" should be reflected at Entity level crash schedule$")
    public void I_verify_Firm_level_Holiday_calendar_should_be_reflected_at_Entity_level_crash_schedule(String strCalendar) {
        ScheduleTemplateView.verifyCrashScheduleCalendar(strCalendar);
    }

    @And("^I enter task name \"([^\"]*)\"$")
    public void I_enter_task_name(String arg1) throws Throwable {
        ScheduleTemplateView.enterTaskName(arg1);
    }

    @And("^I click on \"([^\"]*)\" tab in schedule task pop up$")
    public void I_click_on_tab_in_schedule_task_pop_up(String arg1) throws Throwable {
        try {
            CommonMethods.waitTillDivisionLoads();
            ScheduleTemplateView.clickGridButtonWhenReady(arg1);
            SeleniumUtilities.Log.info("Clicked " + arg1 + " button");
        } catch (Exception Ex) {
            BaseView.takeScreenshot("Clicked " + arg1 + " button.png");
            System.out.println("Error :" + Ex.getMessage());
        }
    }

    @And("^I verify the extended yellow and blue bar$")
    public void I_verify_the_extended_yellow_and_blue_bar() throws Throwable {
        ScheduleTemplateView.verifyExtendedYellowAndBlueBar();
    }

    @And("^I add \"([^\"]*)\" comments$")
    public void I_add_comments(String arg1) throws Throwable {
       ScheduleTemplateView.enterComments(arg1);
    }

    @And("^I verify the following schedule tool tip values for the task \"([^\"]*)\"$")
    public void I_verify_the_following_schedule_tool_tip_values(String taskName, List<Field> values) throws Throwable {
        for(int i = 0;i<20;i++){
           int valueCount = ScheduleTemplateView.verifyToolTipValues(taskName,values);
            if (valueCount != values.size() && i==19) {
                BaseView.takeScreenshot("Tool tip not displayed exact values.png");
                Assert.fail("Tool tip not displayed exact values");
            }
        }
    }

    @And("^I verify the following schedule tool tip values for the task \"([^\"]*)\" on time line$")
    public void I_verify_the_following_schedule_tool_tip_values_on_time_line(String taskName, List<Field> values) throws Throwable {
        for(int i = 0;i<20;i++){
            int valueCount = ScheduleTemplateView.verifyToolTipValuesOnTimeLine(taskName,values);
            if (valueCount != values.size() && i==19) {
                BaseView.takeScreenshot("Tool tip not displayed exact values.png");
                Assert.fail("Tool tip not displayed exact values");
            }
        }
    }

    @And("^I verify the group \"([^\"]*)\" is Auto-Assign Job Titles is \"([^\"]*)\"$")
    public void I_verify_the_group_is_Auto_Assign_Job_Titles_is(String strGroup,String strAssign) throws Throwable {
        ScheduleTemplateView.  verifyScheduleGroupAssign( strGroup, strAssign);
    }

    @And("^I verify the Days After Start \"([^\"]*)\" of Name \"([^\"]*)\" on Template Details tab$")
    public void I_verify_the_Days_After_Start_of_Name_on_Template_Details_tab(String strDayAfterStart,String strName) throws Throwable {
       ScheduleTemplateView.verifyDaysAfterStart(strDayAfterStart,strName);
    }

    @And("^I verify the task name \"([^\"]*)\", type \"([^\"]*)\" and Lead/Lag Days \"([^\"]*)\" on Successors tab$")
    public void I_verify_the_task_name_type_and_Lead_Lag_Days_on_Successors_tab(String strTaskName,String strType,String strLeadLagDays) throws Throwable {
        ScheduleTemplateView.verifySuccessorsTabGrid( strTaskName, strType, strLeadLagDays);
    }

    @And("^I verify the task name \"([^\"]*)\", status \"([^\"]*)\", F/A Start is \"([^\"]*)\" pluse (\\d+) days,F/A End is \"([^\"]*)\" pluse (\\d+) days, F/A Duration \"([^\"]*)\", BL Start \"([^\"]*)\" and BL End \"([^\"]*)\"$")
    public void I_verify_the_task_name_status_F_A_Start_is_pluse_days_F_A_End_is_pluse_days_F_A_Duration_BL_Start_and_BL_End(String strTaskName, String strStatus, String strFAStartDate,int intFAStartDate, String strFAEndDate,int intFAEndDate, String strDuration,String strBLStartDate,String strBLEndDate) throws Throwable {
        ScheduleTemplateView.verifyScheduleGrid(strTaskName, strStatus, strFAStartDate, intFAStartDate, strFAEndDate, intFAEndDate, strDuration,strBLStartDate,strBLEndDate);
    }

    @And("^I verify Predecessor \"([^\"]*)\", Type \"([^\"]*)\" and Lead/Lag Days \"([^\"]*)\"$")
    public void I_verify_Predecessor_Type_and_Lead_Lag_Days(String strPredecessor, String strType, String strLeadLagDays) throws Throwable {
        ScheduleTemplateView.verifyPredecessorGrid(strPredecessor, strType, strLeadLagDays);
    }

    @And("^I verify the task name \"([^\"]*)\", status \"([^\"]*)\", F/A Start is \"([^\"]*)\" pluse (\\d+) days,F/A End is \"([^\"]*)\" pluse (\\d+) days, F/A Duration \"([^\"]*)\",Slack \"([^\"]*)\", BL Start \"([^\"]*)\" and BL End \"([^\"]*)\"$")
    public void I_verify_the_task_name_status_F_A_Start_is_pluse_days_F_A_End_is_pluse_days_F_A_Duration_Slack_BL_Start_and_BL_End(String strTaskName, String strStatus, String strFAStartDate, int intFAStartDate, String strFAEndDate, int intFAEndDate, String strDuration,String strSlack,String strBLStartDate,String strBLEndDate) throws Throwable {
        ScheduleTemplateView.verifyScheduleGrid(strTaskName, strStatus, strFAStartDate, intFAStartDate, strFAEndDate, intFAEndDate, strDuration,strSlack,strBLStartDate,strBLEndDate);
    }

    @And("^I verify the task name \"([^\"]*)\", status \"([^\"]*)\", % Done \"([^\"]*)\", F/A Start is \"([^\"]*)\" pluse (\\d+) days,F/A End is \"([^\"]*)\" pluse (\\d+) days,BL Start \"([^\"]*)\" and BL End \"([^\"]*)\"$")
    public void I_verify_the_task_name_status_Done_F_A_Start_is_pluse_days_F_A_End_is_pluse_days_BL_Start_and_BL_End(String strTaskName, String strStatus,String strDone, String strFAStartDate, int intFAStartDate, String strFAEndDate, int intFAEndDate, String strBLStartDate,String strBLEndDate) throws Throwable {
        ScheduleTemplateView.verifyScheduleGrid(strTaskName, strStatus,strDone, strFAStartDate, intFAStartDate, strFAEndDate, intFAEndDate, strBLStartDate,strBLEndDate);
    }

    @And("^I verify the task name \"([^\"]*)\", status \"([^\"]*)\", % Done \"([^\"]*)\", F/A Start is \"([^\"]*)\" pluse (\\d+) days,F/A End is \"([^\"]*)\" pluse (\\d+) days, F/A Duration \"([^\"]*)\", BL Start \"([^\"]*)\" and BL End \"([^\"]*)\"$")
    public void I_verify_the_task_name_status_Done_F_A_Start_is_pluse_days_F_A_End_is_pluse_days_F_A_Duration_BL_Start_and_BL_End(String strTaskName, String strStatus,String strDone, String strFAStartDate, int intFAStartDate, String strFAEndDate, int intFAEndDate, String strDuration, String strBLStartDate,String strBLEndDate) throws Throwable {
        ScheduleTemplateView.verifyScheduleGrid( strTaskName,  strStatus, strDone,  strFAStartDate,  intFAStartDate,  strFAEndDate,  intFAEndDate,  strDuration,  strBLStartDate, strBLEndDate);
    }

    @And("^I verify the task name \"([^\"]*)\", status \"([^\"]*)\", % Done \"([^\"]*)\", F/A Start is \"([^\"]*)\" pluse (\\d+) days,F/A End is \"([^\"]*)\" pluse (\\d+) days, F/A Duration \"([^\"]*)\", Slack \"([^\"]*)\", BL Start \"([^\"]*)\" pluse (\\d+) days and BL End \"([^\"]*)\" pluse (\\d+) days$")
    public void I_verify_the_task_name_status_Done_F_A_Start_is_pluse_days_F_A_End_is_pluse_days_F_A_Duration_Slack_BL_Start_pluse_days_and_BL_End_pluse_days(String strTaskName, String strStatus,String strDone, String strFAStartDate, int intFAStartDate, String strFAEndDate, int intFAEndDate, String strDuration, String strSlack,String strBLStartDate, int intBLStartDays,String strBLEndDate, int intBLEndDays) throws Throwable {
        ScheduleTemplateView.verifyScheduleGrid( strTaskName,  strStatus, strDone,  strFAStartDate,  intFAStartDate,  strFAEndDate,  intFAEndDate,  strDuration,  strSlack, strBLStartDate,  intBLStartDays, strBLEndDate,  intBLEndDays);
    }

    @And("^I verify the task name \"([^\"]*)\", status \"([^\"]*)\"$")
    public void I_verify_the_task_name_status(String strTaskName, String strStatus) throws Throwable {
        ScheduleTemplateView.verifyScheduleGrid(strTaskName,  strStatus);
    }

    @And("^I click on the save icon on the schedule grid$")
    public void I_click_on_the_save_icon_on_the_schedule_grid() throws Throwable {
        ScheduleTemplateView.clickOnSaveIcon();
    }
}