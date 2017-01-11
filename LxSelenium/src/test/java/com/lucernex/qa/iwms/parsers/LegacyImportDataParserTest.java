package com.lucernex.qa.iwms.parsers;

import com.google.common.io.CharStreams;
import com.google.common.io.Files;
import com.lucernex.qa.FileUtilities;
import com.lucernex.qa.iwms.domain.ImportDataResults;
import com.lucernex.qa.iwms.parsers.LegacyImportDataParser;

import org.junit.Test;

import java.io.File;
import java.nio.charset.Charset;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

public class LegacyImportDataParserTest {
    @Test
    public void test() throws Exception {
        File file = new File(
            FileUtilities.getCWD(),
            "src/test/resources/com/lucernex/qa/iwms/parsers/Import-Legacy-success.html"
        );

        assertTrue(file.exists());

        @SuppressWarnings("deprecation")
        ImportDataResults results = CharStreams.readLines(
                Files.asCharSource(file, Charset.defaultCharset()),
                new LegacyImportDataParser()
        );

        assertNotNull(results);
        assertTrue(results.isSuccess());
        System.out.println(results);
    }
}
