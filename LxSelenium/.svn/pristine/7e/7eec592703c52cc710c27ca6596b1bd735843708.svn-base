package com.lucernex.qa.iwms;

import com.lucernex.qa.FileUtilities;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.iwms.domain.ImportDataResults;
import com.lucernex.qa.utils.CucumberContext;
import com.lucernex.qa.views.HomeView;
import com.lucernex.qa.views.LoginView;
import com.lucernex.swagger.util.Credentials;

import org.junit.BeforeClass;
import org.junit.Test;

import java.io.File;
import java.net.URL;
import java.util.Set;

import static org.junit.Assert.*;

public class ImportClientTest {
    private static final String SPREADSHEET = "src/test/resources/com/lucernex/qa/iwms/employer.xls";
    private static final String     RESTFUL = "src/test/resources/com/lucernex/qa/iwms/employer.xml";
    private static final String BAD_RESTFUL = "src/test/resources/com/lucernex/qa/iwms/bad-employer.xml";
    private static final String      LEGACY = "src/test/resources/com/lucernex/qa/iwms/form.xml";

    @BeforeClass
    public static void login() throws Throwable{
        URL url = CucumberContext.getURL();

        assertNotNull(url);
        BrowserDriver.loadPage(url);

        Credentials credentials = CucumberContext.getCredentials();

        assertNotNull(credentials);

        // Look for 1st IWMS authentication page.
        LoginView.verifyFirstPageDisplayed();

        // Enter username and firmname in 1st IWMS authentication page.
        LoginView.firstPageSubmit(
            credentials.getUsername(),
            credentials.getFirmname()
        );

        // Wait for 2nd IWMS authentication page.
        LoginView.verifySecondPageDisplayed();

        // Enter password into 2nd IWMS authentication page.
        LoginView.secondPageSubmit(credentials.getPassword());

        // Make sure we got logged in.
        HomeView.verifyFooterDisplayed();
    }

    @Test
    public void importSpreadsheet() throws Exception {
        // We delete the record just in case it already exists.
        BOClient.deleteByName("Employer", "UnitTester");

        File spreadsheet = new File(FileUtilities.getCWD(), SPREADSHEET);

        assertTrue(spreadsheet.exists());

        ImportDataResults results = ImportClient.importFile(spreadsheet, true);

        assertNotNull(results);
        assertTrue(results.isSuccess());

        Set<String> types = results.getObjectTypes();

        assertNotNull(types);
        assertEquals(1, types.size());

        Integer count = results.getCount("Employer", ImportDataResults.ResultsType.Creates);

        assertNotNull(count);
        assertEquals(Integer.valueOf(1), count);

        // Delete our newly created record.
        assertTrue(BOClient.deleteByName("Employer", "UnitTester"));
    }

    @Test
    public void importLegacyXML() throws Exception {
        File form = new File(FileUtilities.getCWD(), LEGACY);

        assertTrue(form.exists());

        ImportDataResults results = ImportClient.importFile(form, true);

        assertNotNull(results);
        assertTrue(results.isSuccess());
    }

    @Test
    public void importRESTfulXML() throws Exception {
        File form = new File(FileUtilities.getCWD(), RESTFUL);

        assertTrue(form.exists());

        ImportDataResults results = ImportClient.importFile(form, true);

        assertNotNull(results);
        assertTrue(results.isSuccess());
    }

    @Test
    public void importBadRESTfulXML() throws Exception {
        File form = new File(FileUtilities.getCWD(), BAD_RESTFUL);

        assertTrue(form.exists());

        ImportDataResults results = ImportClient.importFile(form, true);

        assertNotNull(results);
        assertFalse(results.isSuccess());
        //assertNotNull(results.getErrorsHtml());
    }
}
