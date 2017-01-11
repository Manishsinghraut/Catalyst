package com.lucernex.qa.views.entity;

import com.lucernex.swagger.util.Credentials;

import java.net.URL;

public class BaseDocumentsView extends BaseEntityPage {
    public BaseDocumentsView(String recordType, URL baseURL, Credentials credentials) {
      super(recordType, baseURL, credentials);
    }
}
