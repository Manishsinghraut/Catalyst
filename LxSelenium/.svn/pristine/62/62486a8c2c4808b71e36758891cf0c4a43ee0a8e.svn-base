package com.lucernex.qa.iwms;

import com.lucernex.qa.iwms.domain.ImportDataResults;
import com.lucernex.qa.utils.ThreadPool;
import junit.framework.TestCase;
import org.apache.cxf.jaxrs.client.WebClient;
import org.apache.http.HttpVersion;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.cookie.BasicClientCookie;
import org.apache.http.params.CoreProtocolPNames;
import org.apache.http.util.EntityUtils;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

import javax.ws.rs.core.MediaType;
import java.io.File;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

import static junit.framework.TestCase.fail;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

//import org.apache.http.entity.mime.MultipartEntityBuilder;

/**
 * Client of various RolloutManager JSPs which act as JSON web-services.
 */
public class JSPClient {
    // IWMS session cookie (used with WebClient).
    private javax.ws.rs.core.Cookie jaxrsCookie;

    // IWMS session cookie (used with HttpClient).
    private BasicClientCookie httpCookie;

    // Selenium browser automation.
    private WebDriver webDriver;

    // Base URL to JSPs.
    private URL baseURL;

    // Current page to which WebDriver is pointing.
    private URL currentPage;

    // Server's HTTP port.
    private int port;

    // Used to perform RESTful web-service queries.
    private WebClient webClient;

    /**
     * Attempt to import the specified file into IWMS via the Admin import page.
     *
     * @param file        - xml/xls file to import
     * @param timeOut     - maximum number of seconds to wait for import task to finish
     * @param stopOnError - stop executing on the 1st warning/error
     * @param fileClass   - class of file (e.g. 'Legacy')
     *
     * @return import processing results
     */
    @SuppressWarnings("deprecation")
    public ImportDataResults importFile(
        File file,
        int timeOut,
        boolean stopOnError,
        FileClassifier.FileClass fileClass
    ) throws Exception {
        assertNotNull(file);
        assertTrue(file.exists());

        DefaultHttpClient client = new DefaultHttpClient();

        client.getCookieStore().addCookie(httpCookie);
        client.getParams().setParameter(CoreProtocolPNames.PROTOCOL_VERSION, HttpVersion.HTTP_1_1);

        HttpPost post = new HttpPost(baseURL.toString() + "/admin/Messenger.jsp");

        MultipartEntityBuilder mb = MultipartEntityBuilder.create();

        mb.addBinaryBody("dataFile", file, ContentType.APPLICATION_XML, file.getName());
        mb.addTextBody("formSubmit", "import");
        mb.addTextBody("stopOnError", stopOnError ? "true" : "false");

        post.setEntity(mb.build());

        String response = EntityUtils.toString(client.execute(post).getEntity(), "UTF-8");

        // TODO: verify above response?

        client.getConnectionManager().shutdown();

        Future<ImportDataResults> future = ThreadPool.submit(
            new JSPImportPoller(baseURL, jaxrsCookie, 2, fileClass)
        );

        try {
            return future.get(timeOut, TimeUnit.SECONDS);
        } catch (InterruptedException e) {
            fail("Import task was interrupted!");
            return null;
        } catch (ExecutionException e) {
            fail(e.getMessage());
            return null;
        }
    }

    /**
     * Attempt to import the specified file into IWMS via the Admin import page.
     *
     * @param file        - xml/xls file to import
     * @param timeOut     - maximum number of seconds to wait for import task to finish
     * @param stopOnError - stop executing on the 1st warning/error
     *
     * @return import processing results
     */
    @SuppressWarnings("deprecation")
    public ImportDataResults importFile(File file, int timeOut, boolean stopOnError) throws Exception {
        FileClassifier.FileClass fileClass = FileClassifier.classify(file);

        TestCase.assertNotNull(String.format("Unable to classify the specified file '%s'", file.getName()), fileClass);

        return importFile(file, timeOut, stopOnError, fileClass);
    }

    /**
     * Tell IWMS to switch to the specified member (can only be done if the current
     * member has LxAdmin access rights.
     *
     * @param memberID - identifies the Member to which we want to switch
     *
     * @return First and last name of authenticated member
     */
    public String switchToMember(int memberID)
        throws JSONException, MalformedURLException
    {
        webClient.back(true);
        webClient.path("/admin/ContactEdit.jsp");
        webClient.query("formSubmit", "login");
        webClient.query("ajax", true);
        webClient.query("memID", memberID);
        webClient.accept(MediaType.APPLICATION_JSON_TYPE);
        webClient.type(MediaType.APPLICATION_FORM_URLENCODED_TYPE);

        String           json = webClient.post(null, String.class);
        JSONObject jsonObject = new JSONObject(json);
        String       redirUrl = (String)jsonObject.get("redirUrl");
        Boolean       success = (Boolean)jsonObject.get("success");

        assertNotNull(
            String.format("JSON response did not have required 'redirUrl' field: \n%s", json),
            redirUrl
        );
        assertNotNull(
            String.format("JSON response did not have required 'success' field: \n%s", json),
            success
        );
        assertTrue(
            "Switch of users was not successful, perhap you did not have LxAdmin access rights?",
            success
        );

        URL url = new URL(currentPage.getProtocol(), currentPage.getHost(), port, redirUrl);

        webDriver.get(url.toString());

        return webDriver.findElement(By.cssSelector("#footerHtml a")).getAttribute("title");
    }

    public JSPClient(WebDriver webDriver) throws MalformedURLException {
        assertNotNull("Required argument 'webDriver' is null!", webDriver);

        this.webDriver = webDriver;
        this.currentPage = new URL(webDriver.getCurrentUrl());
        this.port = currentPage.getPort() == -1 ? currentPage.getDefaultPort() : currentPage.getPort();

        URI  uri;

        try {
            // URL to base of JSPs.
            this.baseURL = new URL(currentPage.getProtocol(), currentPage.getHost(), port, "/RolloutManager");
            uri = this.baseURL.toURI();
        } catch (URISyntaxException e) {
            fail(e.getMessage());
            return;
        }

        org.openqa.selenium.Cookie c = webDriver.manage().getCookieNamed("JSESSIONID");

        assertNotNull("Required cookie 'JSESSIONID' not found!", c);

        // Clone cookie for several use cases.
        this.jaxrsCookie = new javax.ws.rs.core.Cookie(c.getName(), c.getValue(), c.getPath(), c.getDomain());
        this.httpCookie  = new BasicClientCookie(c.getName(), c.getValue());
        this.httpCookie.setDomain(c.getDomain());
        this.httpCookie.setPath(c.getPath());
        this.httpCookie.setExpiryDate(c.getExpiry());
        this.httpCookie.setSecure(c.isSecure());

        webClient = WebClient.create(uri.toString());
        webClient.cookie(this.jaxrsCookie);
    }
}
