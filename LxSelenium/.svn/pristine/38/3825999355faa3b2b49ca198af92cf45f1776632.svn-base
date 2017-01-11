package com.lucernex.qa.iwms;

import com.google.common.io.CharStreams;
import com.google.common.io.Closeables;
import com.google.common.io.LineProcessor;
import com.lucernex.qa.iwms.domain.ImportDataResults;
import com.lucernex.qa.iwms.parsers.ImportDataParser;
import com.lucernex.qa.iwms.parsers.LegacyImportDataParser;

import org.apache.cxf.jaxrs.client.WebClient;
import org.apache.log4j.Logger;

import javax.ws.rs.core.Cookie;
import javax.ws.rs.core.Response;

import java.io.*;
import java.net.URL;
import java.util.concurrent.Callable;

import static com.google.common.base.Preconditions.checkState;
import static junit.framework.TestCase.fail;

/**
 * Polls the IWMS import task to see if it finished.
 */
public class JSPImportPoller implements Callable<ImportDataResults> {
    private static Logger logger = Logger.getLogger(JSPImportPoller.class);

    private static int POLL_INTERVAL_DEFAULT = 5000;

    // Base URL to IWMS RESTful web-services.
    private URL baseURL;

    // Task polling interval (seconds).
    private int pollInterval;

    // Used to perform RESTful queries.
    private WebClient client;

    // Class of file we are importing.
    private FileClassifier.FileClass fileClass;

    public ImportDataResults call() throws Exception {
        logger.debug("Starting poll of import task");

        Response response;

        // Poll until task finishes execution.
        do {
            Thread.sleep(pollInterval);

            response = client.get();

            checkState(response != null);

            LineProcessor<ImportDataResults> lineProcessor = null;

            switch (fileClass) {
                case Legacy:
                    lineProcessor = new LegacyImportDataParser();
                    break;
                case Spreadsheet:
                case Restful:
                    lineProcessor = new ImportDataParser();
                    break;
                case Unknown:
                    fail("Cannot handle files that are of a unknown type!");
                    break;
            }

            InputStreamReader  in = new InputStreamReader((InputStream)response.getEntity());
            File             html = File.createTempFile("iwms", ".html");
            PrintStream       out = new PrintStream(html);

            try {
                @SuppressWarnings("deprecation")
                ImportDataResults results = CharStreams.readLines(in, lineProcessor);

                if (results.isFinished()) {
                    logger.error("HTML output: " + html.getAbsolutePath());
                    return results;
                } else {
                    html.delete(); // we only want the final result HTML file.
                }
            } finally {
                Closeables.closeQuietly(in);

                if (out != null) {
                    out.close();
                }
            }
        } while (true);
    }

    /**
     * Creates a JSP import task watcher given all field values.
     *
     * @param baseURL       - base URL to IWMS Messenger.jsp
     * @param sessionCookie - IWMS session cookie
     * @param pollInterval  - task polling interval in milliseconds
     * @param fileClass     - is the file a legacy file or something else?
     */
    public JSPImportPoller(URL baseURL, Cookie sessionCookie, int pollInterval, FileClassifier.FileClass fileClass) {
        this.pollInterval = pollInterval;
        this.client = WebClient.create(baseURL.toString());
        this.client.cookie(sessionCookie);
        this.client.path("admin/Messenger.jsp");
        this.client.query("formSubmit", "refresh");
        this.client.query("popupEdit", false);
        this.client.accept("text/html");
        this.fileClass = fileClass;

        /** If you want to see the RESTful conversation, then uncomment following:
         ClientConfiguration config = WebClient.getConfig(this.client);

         config.getOutInterceptors().add(new LoggingOutInterceptor());
         //config.getInInterceptors().add(new LoggingInInterceptor());
         /**/
    }
}
