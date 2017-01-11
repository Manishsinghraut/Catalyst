package com.lucernex.qa.steps.iwms;

import com.lucernex.qa.utils.EmailVerification;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;

import java.util.List;
import java.util.logging.Logger;


/**
 * Created by RLE0239 on 9/15/2015.
 */
public class EmailVerificationSteps {
    private static final Logger logger = Logger.getLogger(EmailVerificationSteps.class.getName());

    @And("^I login to web mail as \"([^\"]*)\" user and password \"([^\"]*)\"$")
    public void I_login_to_web_mail_as_user(String username, String password) throws Throwable {
        EmailVerification.launchAndLoginToApplication(username, password);
    }

    @And("^I login to web mail$")
    public void I_login_to_web_mail_as_user() throws Throwable {
        EmailVerification.launchAndLoginToApplication();
    }

    @And("^I login to web mail on existing window$")
    public void I_login_to_web_mail_as_useron_existing_window() throws Throwable {
        EmailVerification.launchAndLoginToApplicationOnExistingWindow();
    }

    @And("^I search for the mail using subject \"([^\"]*)\"$")
    public void I_search_for_the_mail_using_subject(String subject) throws Throwable {
        //wait for mail
        EmailVerification.searchMail(subject);
    }

    @And("^I check mail body for the following contents$")
    public void I_check_mail_body_for_the_following_contents(List<String> emailBody) throws Throwable {
        EmailVerification.verifyMail(emailBody);
    }

    @And("^I search the mail using subject \"([^\"]*)\"$")
    public void I_search_the_mail_using_subject(String subject) throws Throwable {
        EmailVerification.searchMail(subject);
    }
    @And("^I switch to lucernex application window$")
    public void I_switch_to_child_lucernex_application_window() throws Throwable {
        EmailVerification.switchToSecondWindow();
    }

    @And("^I click application link within the mail body$")
    public void I_click_application_link_within_the_mail_body() throws Throwable {
        EmailVerification.clickLink();
    }

    @And("^I verify application login page is displayed$")
    public void I_verify_application_login_page_is_displayed() throws Throwable {
        EmailVerification.loginPage();
    }

    @And("^I close lucernex window$")
    public void I_close_lucernex_window() throws Throwable {
        EmailVerification.closeLucernexWindow();
    }

    @And("^I close mail window$")
    public void I_close_mail_window() throws Throwable {
        EmailVerification.closeMailWindow();
    }

    @And("^I verify attachment exist \"([^\"]*)\" of type \"([^\"]*)\"$")
    public void I_verify_attachement(String attachmentName, String attachmentType) throws Throwable {
        EmailVerification.verifyAttachment(attachmentName, attachmentType);
    }

    @And("^I verify subject in the body \"([^\"]*)\"$")
    public void I_verify_subject(String subject) throws Throwable {
        EmailVerification.verifyBodySubject(subject);
    }
}