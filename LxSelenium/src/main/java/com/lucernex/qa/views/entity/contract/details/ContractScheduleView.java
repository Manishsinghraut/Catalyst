package com.lucernex.qa.views.entity.contract.details;

import com.lucernex.qa.views.entity.BaseScheduleView;
import com.lucernex.swagger.util.Credentials;

import java.net.URL;

public class ContractScheduleView extends BaseScheduleView {
    public ContractScheduleView(URL baseURL, Credentials credentials) {
        super("Contract", baseURL, credentials);
    }
}
