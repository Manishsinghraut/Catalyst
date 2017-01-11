package com.lucernex.qa.iwms;

import com.lucernex.qa.utils.CucumberContext;
import com.lucernex.swagger.BusinessObjectClient;
import com.lucernex.swagger.domain.*;
import org.junit.Test;

import javax.json.Json;
import javax.json.JsonObject;
import java.util.List;

import static org.junit.Assert.*;

public class BusinessObjectClientTest {
    private BusinessObjectClient client = null;

    private BusinessObjectClient getClient() throws Exception {
        if (client == null) {
            client = new BusinessObjectClient(
                CucumberContext.getURL().toString(),
                CucumberContext.getCredentials()
            );
        }

        return client;
    }

    @Test
    public void findBusinessObjectLinksByType() throws Exception {
        List<BusinessObjectLink> links = getClient().findBusinessObjectLinksByType("Employer", "name,lxID");

        assertNotNull(links);
        assertTrue(links.size() > 0);
    }

    @Test
    public void findByID() throws Exception {
        List<BusinessObjectLink> links = getClient().findBusinessObjectLinksByType("Employer", "name,lxID");

        assertNotNull(links);
        assertTrue(links.size() > 0);

        Integer lxID = links.get(0).getLxID();

        BusinessObject employer = getClient().findByID("Employer", lxID.toString());

        assertNotNull(employer);

        JsonObject fields = employer.getFieldsAsJsonObject();

        assertNotNull(fields);
        assertTrue(fields.size() > 0);
    }

    @Test
    public void findMemberByFIQL() throws Exception {
        List<BusinessObject> members = getClient().findByFIQL(
                "Member",
                "LoginName==Edit Access",
                "DatePattern", "NumberPattern", "Language"
        );

        assertNotNull(members);
        assertTrue(members.size() > 0);

        BusinessObject member = members.get(0);
        JsonObject     fields = member.getFieldsAsJsonObject();

        assertNotNull(fields);
    }

    @Test
    public void findEmployerByFIQL() throws Exception {
        List<BusinessObject> employers = getClient().findByFIQL(
                "Employer",
                "EmployerName==Lucernex",
                "EmployerName", "Phone", "City"
        );

        assertNotNull(employers);
        assertTrue(employers.size() > 0);

        BusinessObject employer = employers.get(0);
        JsonObject       fields = employer.getFieldsAsJsonObject();

        assertNotNull(fields);
        assertEquals("Lucernex", fields.getString("EmployerName"));
        assertNotNull(fields.getString("Phone"));
        assertNotNull(fields.getString("City"));
    }

    private JsonObject createEmployerFields() {
        return Json.createObjectBuilder()
                   .add("EmployerName", "UnitTester")
                   .add("CompanyType", "Vendor")
                   .add("StreetAddress1", "820 Wild Lilac Circle")
                   .add("City", "San Marcos")
                   .add("PostalCode", "92078")
                   .build();
    }

    @Test
    public void create() throws Exception {
        BusinessObject bo = getClient().create("Employer", createEmployerFields());

        assertNotNull(bo.getLxID());

        // Clean up our mess.
        getClient().delete("Employer", bo.getLxID());
    }

    @Test
    public void update() throws Exception {
        BusinessObject orig = getClient().create("Employer", createEmployerFields());
        Integer        lxID = orig.getLxID();

        assertNotNull(lxID);

        try {
            BusinessObject delta = new BusinessObject("Employer");

            // Now see if we can update the StreetAddress1 field.
            delta.setLxID(lxID);
            delta.setFieldValue("StreetAddress1", "1111 Freeport Parkway");
            getClient().update(delta);

            BusinessObject existing = client.findByLxID("Employer", lxID);

            // Verify that our update worked.
            assertNotEquals(existing.getFieldValue("StreetAddress1"), orig.getFieldValue("StreetAddress1"));
        } finally {
            // Clean up our mess.
            getClient().delete("Employer", lxID);
        }
    }
}
