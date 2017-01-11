package com.lucernex.qa.iwms.parsers;

import com.google.common.io.CharStreams;
import com.google.common.io.Files;
import com.lucernex.qa.FileUtilities;
import com.lucernex.qa.iwms.domain.ImportDataResults;
import com.lucernex.qa.iwms.parsers.ImportDataParser;

import org.junit.Test;

import java.io.File;
import java.nio.charset.Charset;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

public class ImportDataParserTest {
    @Test
    public void testNextGen() throws Exception {
        File file = new File(
            FileUtilities.getCWD(),
            "src/test/resources/com/lucernex/qa/iwms/parsers/Import-Restful-success.html"
        );

        assertTrue(file.exists());

        @SuppressWarnings("deprecation")
        ImportDataResults results = CharStreams.readLines(
            Files.asCharSource(file, Charset.defaultCharset()),
            new ImportDataParser()
        );

        assertNotNull(results);
        assertTrue(results.isSuccess());
        System.out.println(results);
    }

    @Test
    public void testLegacy() throws Exception {
        File file = new File(
            FileUtilities.getCWD(),
            "src/test/resources/com/lucernex/qa/iwms/parsers/Import-Legacy-failure.html"
        );

        assertTrue(file.exists());

        @SuppressWarnings("deprecation")
        ImportDataResults results = CharStreams.readLines(
            Files.asCharSource(file, Charset.defaultCharset()),
            new ImportDataParser()
        );

        assertNotNull(results);
        assertEquals(3, results.getObjectTypes().size());
    }
}
