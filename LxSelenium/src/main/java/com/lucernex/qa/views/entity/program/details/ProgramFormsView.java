package com.lucernex.qa.views.entity.program.details;

import com.lucernex.qa.views.entity.BaseFormsView;
import com.lucernex.swagger.util.Credentials;

import java.net.URL;

public class ProgramFormsView extends BaseFormsView {
    public ProgramFormsView(URL baseURL, Credentials credentials) {
        super("Program", baseURL, credentials);
    }
}
