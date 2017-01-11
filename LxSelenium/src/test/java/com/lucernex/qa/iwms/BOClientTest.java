package com.lucernex.qa.iwms;

import com.lucernex.swagger.domain.BusinessObject;
import com.lucernex.swagger.domain.BusinessObjectLink;

import org.junit.Test;

import javax.json.Json;
import javax.json.JsonObject;

import java.util.List;

import static org.junit.Assert.*;

public class BOClientTest {
    private List<BusinessObjectLink> doFindBusinessObjectLinksByType() throws Exception {
        List<BusinessObjectLink> links = BOClient.findBusinessObjectLinksByType("Employer");

        assertNotNull(links);
        assertTrue(links.size() > 0);

        return links;
    }

    @Test
    public void findBusinessObjectLinksByType() throws Exception {
        doFindBusinessObjectLinksByType();
    }

    @Test
    public void findByID() throws Exception {
        List<BusinessObjectLink> links = doFindBusinessObjectLinksByType();
        Integer                   lxID = links.get(0).getLxID();

        BusinessObject employer = BOClient.findByLxID("Employer", lxID);

        assertNotNull(employer);

        JsonObject fields = employer.getFieldsAsJsonObject();

        assertNotNull(fields);
        assertTrue(fields.size() > 0);
    }

    @Test
    public void findByFIQL() throws Exception {
        List<BusinessObject> employers = BOClient.findByFIQL(
            "Employer",
            "EmployerName==Lucernex",
            "EmployerName", "Phone", "City"
        );

        assertNotNull(employers);
        assertEquals(1, employers.size());

        BusinessObject employer = employers.get(0);
        JsonObject       fields = employer.getFieldsAsJsonObject();

        assertNotNull(fields);
        assertEquals("Lucernex", fields.getString("EmployerName"));
        assertNotNull(fields.getString("Phone"));
        assertNotNull(fields.getString("City"));
    }

    @Test
    public void findSingleByFIQL() throws Exception {
        BusinessObject member = BOClient.findSingleByFIQL(
            "Member",
            "LoginName==rootDev",
            "MemberID", "MemberNameFirstLast", "Language", "DatePattern"
        );

        assertNotNull(member);

        JsonObject fields = member.getFieldsAsJsonObject();

        assertNotNull(fields);
        assertNotNull(fields.getString("Language"));
    }

    // An example of a JSON string that contains a set of Employer field values.
    private static final String EMPLOYER_JSON =
        "{\"EmployerName\":\"UnitTester\",\"CompanyType\":\"Vendor\",\"StreetAddress1\":\"820 Wild Lilac Circle\",\"City\":\"San Marcos\",\"PostalCode\":\"92078\"}";

    @Test
    public void create() throws Exception {
        BusinessObject bo = BOClient.create("Employer", EMPLOYER_JSON);

        assertNotNull(bo.getLxID());

        // Clean up our mess.
        BOClient.delete("Employer", bo.getLxID());
    }

    @Test
    public void update() throws Exception {
        BusinessObject orig = BOClient.create("Employer", EMPLOYER_JSON);
        Integer        lxID = orig.getLxID();

        assertNotNull(lxID);

        try {
            BusinessObject delta = new BusinessObject("Employer");

            // Now see if we can update the StreetAddress1 field.
            delta.setLxID(lxID);
            delta.setFieldValue("StreetAddress1", "1111 Freeport Parkway");
            BOClient.update(delta);

            BusinessObject existing = BOClient.findByLxID("Employer", lxID);

            // Verify that our update worked.
            assertNotEquals(existing.getFieldValue("StreetAddress1"), orig.getFieldValue("StreetAddress1"));
        } finally {
            // Clean up our mess.
            BOClient.delete("Employer", lxID);
        }
    }

    /**
     * Returns a JsonObject which defines a set of Employer fields.
     */
    private JsonObject createUpdatedEmployerFields() {
        return Json.createObjectBuilder()
                   .add("EmployerName",   "UnitTester")
                   .add("StreetAddress1", "1111 Freeport Parkway")
                   .build();
    }

    @Test
    public void createOrUpdate() throws Exception {
        // First call attempt should create the record.
        BusinessObject orig = BOClient.createOrUpdate("Employer", EMPLOYER_JSON);

        assertNotNull(orig.getLxID());

        // Second call attempt should update the record.
        BusinessObject updated = BOClient.createOrUpdate("Employer", createUpdatedEmployerFields());

        assertNotNull(updated);
        assertEquals(orig.getLxID(), updated.getLxID());

        // Verify that our update worked.
        assertNotEquals(orig.getFieldValue("StreetAddress1"), updated.getFieldValue("StreetAddress1"));

        // Clean up our mess.
        BOClient.delete("Employer", orig.getLxID());
    }
}
