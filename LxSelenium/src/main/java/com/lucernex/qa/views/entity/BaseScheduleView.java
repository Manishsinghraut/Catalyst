package com.lucernex.qa.views.entity;

import com.lucernex.swagger.util.Credentials;

import java.net.URL;

public class BaseScheduleView extends BaseEntityPage {
    public BaseScheduleView(String recordType, URL baseURL, Credentials credentials) {
        super(recordType, baseURL, credentials);
    }
}
