package com.lucernex.qa.views.entity;

import com.lucernex.qa.iwms.BOClient;
import com.lucernex.swagger.domain.BusinessObject;
import com.lucernex.swagger.domain.Field;
import com.lucernex.swagger.util.Credentials;

import java.net.URL;
import java.util.Set;
import java.util.TreeSet;

import static com.google.common.base.Preconditions.checkNotNull;
import static org.junit.Assert.fail;

public class BaseEntityPage {
    // IWMS record type (e.g. 'Contract').
    private String recordType;

    // Used to provide meta data about the specified record type.
    private BusinessObject example = null;

    private BusinessObject getExample() {
        if (example == null) {
            try {
                example = BOClient.getClient().createTransientBusinessObject(recordType);
            } catch (Exception e) {
                fail(e.getMessage());
            }
        }

        return example;
    }

    /**
     * Returns the set of field names that define the specified record type.
     */
    public Set<String> getFieldNames() {
        BusinessObject bo = getExample();
        Set<String> names = new TreeSet<String>();

        for (Field f : bo.getFields()) {
            names.add(f.getName());
        }

        return names;
    }

    /**
     * Returns the data type of the specified field.
     *
     * @param fieldName - identifies the field to inquire about
     */
    public Class<?> getFieldType(String fieldName) {
        BusinessObject bo = getExample();
        Field           f = bo.getField(fieldName);

        checkNotNull(f, "Field '%s' is unknown to record '%s'", fieldName, bo.getType());

        return f.getType();
    }

    public String getRecordType() {
        return recordType;
    }

    public BaseEntityPage(String recordType, URL baseURL, Credentials credentials) {
        this.recordType = recordType;
    }
}
