package com.lucernex.qa.views.entity.program.details;

import com.lucernex.qa.views.entity.BaseWorkFlowView;
import com.lucernex.swagger.util.Credentials;

import java.net.URL;

public class ProgramWorkFlowView extends BaseWorkFlowView {
    public ProgramWorkFlowView(URL baseURL, Credentials credentials) {
        super("Program", baseURL, credentials);
    }
}
