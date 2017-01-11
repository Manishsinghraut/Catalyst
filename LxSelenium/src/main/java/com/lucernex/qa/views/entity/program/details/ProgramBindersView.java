package com.lucernex.qa.views.entity.program.details;

import com.lucernex.qa.views.entity.BaseBindersView;
import com.lucernex.swagger.util.Credentials;

import java.net.URL;

public class ProgramBindersView extends BaseBindersView {
    public ProgramBindersView(URL baseURL, Credentials credentials) {
        super("Program", baseURL, credentials);
    }
}
