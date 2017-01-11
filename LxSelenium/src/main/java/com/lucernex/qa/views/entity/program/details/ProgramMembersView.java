package com.lucernex.qa.views.entity.program.details;

import com.lucernex.qa.views.entity.BaseMembersView;
import com.lucernex.swagger.util.Credentials;

import java.net.URL;

public class ProgramMembersView extends BaseMembersView {
    public ProgramMembersView(URL baseURL, Credentials credentials) {
        super("Program", baseURL, credentials);
    }
}
