package com.lucernex.qa.views.entity.program.details;

import com.lucernex.qa.views.entity.BaseBudgetView;
import com.lucernex.swagger.util.Credentials;

import java.net.URL;

public class ProgramBudgetView extends BaseBudgetView {
    public ProgramBudgetView(URL baseURL, Credentials credentials) {
        super("Program", baseURL, credentials);
    }
}
