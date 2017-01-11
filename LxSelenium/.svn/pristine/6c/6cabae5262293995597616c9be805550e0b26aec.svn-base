package com.lucernex.qa.steps.iwms.contract.details.forms;

import com.lucernex.qa.views.iwms.contract.details.forms.FormsView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;

import java.util.List;
import java.util.logging.Logger;


/**
 * Created by RLE0239 on 10/21/2015.
 */
public class FormsSteps {
    private static final Logger logger = Logger.getLogger(FormsSteps.class.getName());

    @And("^I add following persons")
    public void I_add_following_persons(List<String> members) throws Throwable {
        FormsView.addPersons(members);
    }
}