package com.lucernex.qa.iwms;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.CucumberContext;
import com.lucernex.qa.utils.ThreadPool;
import com.lucernex.swagger.domain.Task;
import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.interceptor.LoggingInInterceptor;
import org.apache.cxf.interceptor.LoggingOutInterceptor;
import org.apache.cxf.jaxrs.client.ClientConfiguration;
import org.apache.cxf.jaxrs.client.WebClient;

import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.logging.Logger;

import static org.junit.Assert.*;

/**
 * Client for IWMS Firm RESTful web-service.
 */
public class FirmClient {
    private static final Logger logger = Logger.getLogger(FirmClient.class.getName());

    // IWMS session cookie (used with WebClient).
    private javax.ws.rs.core.Cookie sessionCookie;

    // RESTful base URL.
    private URL baseURL = null;

    private URL getBaseURL() {
        if (baseURL == null) {
            URL iwmsURL = CucumberContext.getURL();

            assertNotNull(iwmsURL);

            int port = iwmsURL.getPort() == -1 ? iwmsURL.getDefaultPort() : iwmsURL.getPort();

            try {
                baseURL = new URL(iwmsURL.getProtocol(), iwmsURL.getHost(), port, "/rest");
            } catch (Exception e) {
                fail(e.getMessage());
                return null;
            }
        }

        return baseURL;
    }

    private WebClient getWebClient() throws Exception {
        org.openqa.selenium.Cookie c = BrowserDriver.getCurrentDriver().manage().getCookieNamed("JSESSIONID");

        assertNotNull("Required cookie 'JSESSIONID' not found!", c);

        sessionCookie = new javax.ws.rs.core.Cookie(c.getName(), c.getValue(), c.getPath(), c.getDomain());

        assertNotNull("IWMS session cookie is null", sessionCookie);

        URL baseURL = getBaseURL();

        assertNotNull(baseURL);

        WebClient webClient = WebClient.create(baseURL.toURI());

        webClient.cookie(sessionCookie);
        webClient.accept(MediaType.APPLICATION_XML_TYPE);
        webClient.type(MediaType.APPLICATION_XML_TYPE);
        webClient.type("multipart/form-data");
        webClient.path("/firm");

        return webClient;
    }

    private String getTaskURL(Response response) {
        assertNotNull(response);

        return (String)response.getMetadata().getFirst("Content-Location");
    }

    private void verifyHTTPStatusCode(Response response) {
        assertNotNull(response);

        int statusCode = response.getStatus();

        if (statusCode != Response.Status.ACCEPTED.getStatusCode()) {
            String msg;

            try {
                msg = IOUtils.readStringFromStream((InputStream) response.getEntity());
            } catch (IOException e) {
                msg = null;
            }

            if (msg != null && !msg.isEmpty()) {
                msg = msg + ", HTTP status code: " + statusCode;
            } else {
                msg = String.format("Attempt to start file import failed with HTTP status code: %d", statusCode);
            }

            fail(msg);
        }
    }

    /**
     * Import the specified file to IWMS via the RESTful web-service.
     *
     * @param file        - Lucernex formatted XML/Spreadsheet file to import
     * @param timeOut     - maximum number of seconds to wait for import task to finish
     * @param stopOnError - stop import upon 1st error encountered?
     *
     * @return Task that handled the import request
     */
    public Task importFile(File file, int timeOut, boolean stopOnError) throws Exception {
        assertNotNull("Required argument 'file' is null!", file);
        assertTrue(String.format("Specified file '%s' not found!", file.getAbsolutePath()), file.exists());

        WebClient wc = getWebClient();
        Response response;

        // Start the async import task in IWMS.
        response = wc.header("stopOnError", stopOnError).post(file);

        int statusCode = response.getStatus();

        logger.info("HTTP status code from POST of async task: " + statusCode);

        if (statusCode == Response.Status.UNAUTHORIZED.getStatusCode()) {
            fail("Attempt to start async import task failed using session cookie (UNAUTHORIZED)");
        }

        verifyHTTPStatusCode(response);

        String taskURL = getTaskURL(response);

        assertNotNull(taskURL);

        Future<Task> future = ThreadPool.submit(new ImportTaskWatcher(taskURL, sessionCookie, 2000));

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
     * Import the specified file to IWMS via the RESTful web-service.
     *
     * @param file        - Lucernex formatted XML/Spreadsheet file to import
     * @param timeOut     - maximum number of seconds to wait for import task to finish
     *
     * @return Task that handled the import request
     */
    public Task importFile(File file, int timeOut) throws Exception {
        return importFile(file, timeOut, false);
    }

    private boolean loggingEnabled = false;

    /**
     * Register logging interceptors which will surface the RESTful requests
     * and responses to the logger.
     */
    public void logConversation(WebClient webClient) {
        if (!loggingEnabled) {
            ClientConfiguration config = WebClient.getConfig(webClient);

            config.getOutInterceptors().add(new LoggingOutInterceptor());
            config.getInInterceptors().add(new LoggingInInterceptor());
            loggingEnabled = true;
        }
    }
}
