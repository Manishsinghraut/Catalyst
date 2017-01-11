package com.lucernex.qa.views.entity.program.details;

import com.lucernex.qa.views.entity.BaseDocumentsView;
import com.lucernex.swagger.util.Credentials;

import java.net.URL;

public class ProgramDocumentsView extends BaseDocumentsView {
    public ProgramDocumentsView(URL baseURL, Credentials credentials) {
        super("Program", baseURL, credentials);
    }
}
