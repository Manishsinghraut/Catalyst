package com.lucernex.qa.utils;

import com.google.common.collect.Lists;
import com.lucernex.qa.browsers.BrowserType;
import com.lucernex.swagger.domain.BusinessObject;
import com.lucernex.swagger.util.Credentials;
import org.junit.Test;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import java.net.URL;
import java.text.DateFormat;
import java.util.List;

import static junit.framework.TestCase.assertNotNull;
import static junit.framework.TestCase.assertTrue;

public class CucumberContextTest {
    @Test
    public void getURL() {
        URL url = CucumberContext.getURL();

        assertNotNull(url);
    }

    @Test
    public void getBrowserType() {
        BrowserType bt = CucumberContext.getBrowserType();

        assertNotNull(bt);
    }

    @Test
    public void getCredentials() {
        Credentials c = CucumberContext.getCredentials();

        assertNotNull(c);
        assertNotNull(c.getFirmname());
        assertNotNull(c.getPassword());
        assertNotNull(c.getUsername());
    }

    @Test
    public void getSessionMember() throws Exception {
        BusinessObject member = CucumberContext.getSessionMember();

        assertNotNull(member);
    }

    @Test
    public void getSessionDateFormat() throws Exception {
        DateFormat df = CucumberContext.getSessionDateFormat();

        assertNotNull(df);
    }

    @Test
    public void isISOFormatted() throws Exception {
        List<String> examples = Lists.newArrayList(
            "2009-12T12:34",
            "2009",
            "2009-05-19",
            "2009-05-19",
            "20090519",
            "2009123",
            "2009-05",
            "2009-123",
            "2009-222",
            "2009-001",
            "2009-W01-1",
            "2009-W51-1",
            "2009-W511",
            "2009-W33",
            "2009W511",
            "2009-05-19",
            "2009-05-19 00:00",
            "2009-05-19 14",
            "2009-05-19 14:31",
            "2009-05-19 14:39:22",
            "2009-05-19T14:39Z",
            "2009-W21-2",
            "2009-W21-2T01:22",
            "2009-139",
            "2009-05-19 14:39:22-06:00",
            "2009-05-19 14:39:22+0600",
            "2009-05-19 14:39:22-01",
            "20090621T0545Z",
            "2007-04-06T00:00",
            "2007-04-05T24:00",
            "2010-02-18T16:23:48.5",
            "2010-02-18T16:23:48,444",
            "2010-02-18T16:23:48,3-06:00",
            "2010-02-18T16:23.4",
            "2010-02-18T16:23,25",
            "2010-02-18T16:23.33+0600",
            "2010-02-18T16.23334444",
            "2010-02-18T16,2283",
            "2009-05-19 143922.500",
            "2009-05-19 1439,55"
        );

        for (String d : examples) {
            assertTrue(CucumberContext.isISOFormatted(d));
        }

        //assertTrue(CucumberContext.isISOFormatted("2014-23-10T05:00:00.000Z"));
    }

/* Cannot do this test case without the use of selenium
    @Test
    public void switchUser() throws Exception {
        String username = "rootDev";

        CucumberContext.switchUser(username);
    }
    */

    @Test
    public void revertUser() {
        try {
            CucumberContext.revertUser();
        } catch (NotImplementedException nyet) {
            // TODO: remove this catch when method is implemented.
        }
    }
}
