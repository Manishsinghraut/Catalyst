package com.lucernex.qa.iwms;

import com.google.common.io.CharStreams;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.iwms.domain.ImportDataResults;
import com.lucernex.qa.iwms.parsers.ErrorsHtmlParser;
import com.lucernex.qa.iwms.parsers.ImportDataParser;
import com.lucernex.swagger.domain.Task;

import org.w3c.tidy.Tidy;

import java.io.CharArrayWriter;
import java.io.File;
import java.io.StringReader;
import java.util.List;
import java.util.logging.Logger;

import static com.google.common.base.Strings.isNullOrEmpty;
import static junit.framework.TestCase.fail;
import static org.junit.Assert.assertNotNull;

public class ImportClient {
    private static final Logger logger = Logger.getLogger(ImportClient.class.getName());

    /**
     * Attempts to import a XML/Spreadsheet file.
     *
     * @param file        - file to import
     * @param stopOnError - stop executing on the 1st warning/error
     *
     * @return ImportDataResults instance representing the results of the import attempt
     */
    public static ImportDataResults importFile(File file, boolean stopOnError) throws Exception {
        String resultsSummary;
        ImportDataResults results;
        Exception exception = null;

        logger.info(String.format("Attempt at importing [%s]", file.getName()));

        FirmClient firmClient = new FirmClient();

        Task task = firmClient.importFile(file, 6000, stopOnError);

        assertNotNull("FirmClient did not return a Task instance", task);

        resultsSummary = task.getResultsSummary();

        assertNotNull("Import results summary is null", resultsSummary);

        results = CharStreams.readLines(
            new StringReader(resultsSummary),
            new ImportDataParser()
        );

        String htmlErrors = task.getHtmlErrors();

        if (!isNullOrEmpty(htmlErrors)) {
            Tidy htmlTidy = new Tidy();
            CharArrayWriter writer = new CharArrayWriter();

            htmlTidy.setShowWarnings(false);
            htmlTidy.setQuiet(true);
            htmlTidy.setIndentContent(true);
            htmlTidy.setPrintBodyOnly(true);
            htmlTidy.parse(new StringReader(htmlErrors), writer);

            List<String> errors = CharStreams.readLines(
                new StringReader(writer.toString()),
                new ErrorsHtmlParser()
            );

            if (errors != null && !errors.isEmpty()) {
                results.setErrors(errors);
            }
        }

        if (results.isSuccess()) {
            logger.info(String.format("File import was successful for file [%s]", file.getName()));
            results.setFinished(true);
            return results;
        }

        if (exception != null) {
            throw exception;
        } else if (results != null) {
            logger.info("Returning final results of failed import attempts.");
            results.setFinished(true);
            return results;
        } else {
            fail("Import did not return a ImportDataResults instance!");
            return null; // will never happen
        }
    }

    /**
     * Attempts to import a XML/Spreadsheet file and don't stop executing on the
     * 1st warning/error.
     *
     * @param file - file to import
     *
     * @return ImportDataResults instance representing the results of the import attempt
     */
    public static ImportDataResults importFile(File file) throws Exception {
        JSPClient jspClient = new JSPClient(BrowserDriver.getCurrentDriver());

        return jspClient.importFile(file, 30, false);
    }
}
