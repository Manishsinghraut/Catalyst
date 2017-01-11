package com.lucernex.qa.views.entity;

import com.lucernex.swagger.util.Credentials;

import java.net.URL;

public class BaseBindersView extends BaseEntityPage {
    public BaseBindersView(String recordType, URL baseURL, Credentials credentials) {
       super(recordType, baseURL, credentials);
    }
}
