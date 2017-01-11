package com.lucernex.qa.steps.iwms.site.details.summary;

import com.lucernex.qa.utils.EmailVerification;
import com.lucernex.qa.views.iwms.parcel.ParcelSummaryView;
import com.lucernex.qa.views.iwms.site.details.summary.SiteSurveyView;
import cucumber.api.java.en.And;

import java.util.logging.Logger;


/**
 * Created by RLE0239 on 9/15/2015.
 */
public class SiteSurveySteps {
    private static final Logger logger = Logger.getLogger(SiteSurveySteps.class.getName());

    @And("^I fetch entity ID from report for entity \"([^\"]*)\"$")
    public void I_fetch_entity_ID_from_report(String entityName) throws Throwable {
        SiteSurveyView.getEntityIDFromReport(entityName);
    }

    @And("^I fetch entity ID from report under header \"([^\"]*)\" for entity \"([^\"]*)\"$")
    public void I_fetch_entity_ID_from_report(String header, String entityName) throws Throwable {
        SiteSurveyView.getEntityIDFromReportForParticularColumn(header,entityName);
    }

    @And("^I fetch current date$")
    public void I_fetch_current_date() throws Throwable {
        SiteSurveyView.fetchCurrentDate();
    }
}