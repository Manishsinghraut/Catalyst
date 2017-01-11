package com.lucernex.qa.views.entity.contract.details;

import com.lucernex.qa.views.entity.BaseMembersView;
import com.lucernex.swagger.util.Credentials;

import java.net.URL;

public class ContractMembersView extends BaseMembersView {
    public ContractMembersView(URL baseURL, Credentials credentials) {
        super("Contract", baseURL, credentials);
    }
}
