package com.lucernex.qa.steps.iwms.Portfolio.OrgChart;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.data.TypeFields;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.portfolio.orgchart.OrgChartView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import junit.framework.Assert;
//import org.eclipse.jetty.util.log.Log;
import org.openqa.selenium.By;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.util.List;
import java.util.logging.Logger;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;


/**
 * Created by RLE0097 on 4/22/2015.
 */
public class OrgChartSteps {
    private static final Logger logger = Logger.getLogger(OrgChartSteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    @Then("^I verify 'Org Chart Migration Success' message after referencing portfolio \"([^\"]*)\"'s org chart to \"([^\"]*)\" portfolio$")
    public void I_verify_org_chart_success_msg_to_reference_other_portfolio(String referenced, String used) throws Throwable {
        OrgChartView.orgChartMigrationSuccess(referenced,used);
    }

    @Then("^I verify Org Chart Migration Success message after referencing portfolio \"([^\"]*)\"'s org chart to \"([^\"]*)\" portfolio$")
    public void I_verify_org_chart_success_msg_to_reference_other_portfolio_msg(String referenced, String used) throws Throwable {
        OrgChartView.orgChartMigrationSuccessMsg(referenced,used);
    }

    @Then("^I verify 'Org Chart Migration Success' message after restoring portfolio \"([^\"]*)\"'s org chart to original")
    public void I_verify_org_chart_success_msg_to_restore_original_org_chart(String used) throws Throwable {
        OrgChartView.orgChartMigrationSuccessToRestoreOriginal(used);
    }

    @And("^I expand \"([^\"]*)\" region tree$")
    public void I_expand_region_tree(String regionName) throws Throwable {
        OrgChartView.expandRegionTree(regionName);
    }

    @And("^I expand \"([^\"]*)\" sub region in \"([^\"]*)\" region tree$")
    public void I_expand_sub_region_tree(String subRegionName, String regionName) throws Throwable {
        this.I_expand_region_tree(regionName);
        OrgChartView.expandSubRegionTree(subRegionName);
    }

    @Then("^I verify \"([^\"]*)\" market in org chart$")
    public void I_verify_market_in_org_chart(String strMarket) throws Throwable {
        OrgChartView.verifyMarketInSubRegion(strMarket);
    }


    @Then("^I verify deleted market \"([^\"]*)\" not present in \"([^\"]*)\" sub region in org chart$")
    public void I_verify_deleted_market_in_org_chart(String market, String subRegion) throws Throwable {
        OrgChartView.verifyDeletedMarket(market,subRegion);
    }

    @Then("^I verify deleted market \"([^\"]*)\" not present in \"([^\"]*)\" region in org chart$")
    public void I_verify_deleted_market_in_region_org_chart(String market, String region) throws Throwable {
        OrgChartView.verifyDeletedMarketInRegion(market,region);
    }

    @Then("^I verify entity type \"([^\"]*)\"$")
    public void I_verify_entity_type(String used) throws Throwable {
        OrgChartView.verifyEntityType(used);
    }

@Then("^I verify horizontally organized regions \"([^\"]*)\"$")
    public void I_verify_horizontally_organized_regions(String regions) throws Throwable {
    OrgChartView.verifyHorizontallyOrganizedRegion(regions);
    }

    @Then("^I verify vertically organized regions \"([^\"]*)\"$")
    public void I_verify_vertically_organized_regions( String regions) throws Throwable {
        OrgChartView.verifyVerticallyOrganizedRegion(regions);
    }

    @And("^I click add link to add member \"([^\"]*)\"$")
    public void I_click_add_link_to_add_member(String member)throws Throwable {
        OrgChartView.clickAddLink(member);
    }

    @And("^I click delete link corresponding to member \"([^\"]*)\"$")
    public void I_click_delete_link_corresponding_to_member(String member) throws Throwable {
        OrgChartView.clickDeleteLink(member);
    }

    @And("^I verify I'm at Org chart page$")
    public void I_verify_at_org_chart_page() throws Throwable {
        OrgChartView.switchToOrgChartFrame();
    }

    @And("^I verify I'm at Move Org chart page$")
    public void I_verify_at_move_org_chart_page() throws Throwable {
        OrgChartView.switchToMoveOrgChartFrame();
    }

    @And("^I verify I'm at Restore Org chart page$")
    public void I_verify_at_restore_org_chart_page() throws Throwable {
        OrgChartView.switchToRestoreOrgChartFrame();
    }

    @Then("^I verify members in \"([^\"]*)\" org chart$")
    public void I_verify_managers_and_members_in_org_chart(String strChart,List<Field> fields) throws Throwable {
        try {
            OrgChartView.switchToOrgChartFrame();
            for (Field f : fields) {
                OrgChartView.verifyManagersAndMembersInOrgChart(strChart, f.getName(), f.getValue());
            }
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            BaseView.takeScreenshot("OrgChart.png");
            logger.info("Error :" + e.getMessage());
            Assert.fail(e.getMessage());
        }
    }

    @Then("^I verify members in \"([^\"]*)\" org chart not present$")
    public void I_verify_managers_and_members_in_org_chart_not_present(String strChart,List<Field> fields) throws Throwable {
        try {
            OrgChartView.switchToOrgChartFrame();
            for (Field f : fields) {
                OrgChartView.verifyManagersAndMembersInOrgChartNotPresent(strChart, f.getName(), f.getValue());
            }
            SeleniumUtil.switchTodefaultContent();
        } catch (Exception e) {
            BaseView.takeScreenshot("OrgChart.png");
            logger.info("Error :" + e.getMessage());
            Assert.fail(e.getMessage());
        }
    }

    @And("^I click \"([^\"]*)\" link corresponding \"([^\"]*)\" region$")
    public void I_click_link_corresponding_to_region(String link,String region) throws Throwable {
        OrgChartView.clickActions(region, link);
    }

    @And("^I click \"([^\"]*)\" link corresponding \"([^\"]*)\" sub region$")
    public void I_click_link_corresponding_to_sub_region(String link,String region) throws Throwable {
        OrgChartView.clickActions(region, link);
    }

    @And("^I fetch market count in org chart$")
    public void I_fetch_market_count_in_org_chart() throws Throwable {
        OrgChartView.setMarketCount();
    }

    @And("^I verify market is deleted$")
    public void I_verify_market_is_deleted() throws Throwable {
        assertEquals(OrgChartView.marketCount,OrgChartView.getMarketCount());
        logger.info("Market is deleted");
    }

    @And("^I verify market is added$")
    public void I_verify_market_is_added() throws Throwable {
        assertEquals(OrgChartView.marketCount+1,OrgChartView.getMarketCount());
        logger.info("Market is added");
    }

    @And("^I click \"([^\"]*)\" link corresponding to member \"([^\"]*)\"$")
    public void I_click_action_link_corresponding_to_member(String action, String member) throws Throwable {
        OrgChartView.clickActionLinkCorrespondingToMember(member, action);
    }

    @And("^I expand \"([^\"]*)\" region list$")
    public void I_expand_region(String regionName) throws Throwable {
        OrgChartView.expandRegionTreeUpdated(regionName);
    }

    @And("^I expand \"([^\"]*)\" sub region list in \"([^\"]*)\" region$")
    public void I_expand_sub_region(String subRegionName, String regionName) throws Throwable {
        this.I_expand_region(regionName);
        OrgChartView.expandSubRegionTreeUpdated(subRegionName);
    }

    @And("^I verify the \"([^\"]*)\" region of managers \"([^\"]*)\"$")
    public void I_verify_the_region_of_managers(String strRegion,String strManager) throws Throwable {
        OrgChartView.verifyRegionManager(strRegion,strManager);
    }

    @And("^I verify the \"([^\"]*)\" region of member \"([^\"]*)\"$")
    public void I_verify_the_region_of_member(String strRegion,String strManager) throws Throwable {
        OrgChartView.verifyRegionMember(strRegion,strManager);
    }

    @And("^I expand \"([^\"]*)\" region list and verify the member \"([^\"]*)\"$")
    public void I_expand_region_list_and_verify_the_member(String strRegionName,String strMember) throws Throwable {
        OrgChartView.expandRegionTreeAndVerifyTheMember(strRegionName, strMember);
    }

    @And("^I expand \"([^\"]*)\" region list and verify the \"([^\"]*)\"$")
    public void I_expand_region_list_and_verify_the(String strRegionName, String strLinks) throws Throwable {
        OrgChartView. expandRegionTreeAndVerifyTheLinks(strRegionName, strLinks);
    }
}