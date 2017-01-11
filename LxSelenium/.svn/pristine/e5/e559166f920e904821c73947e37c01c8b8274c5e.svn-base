package com.lucernex.qa.iwms.parsers;

import com.google.common.io.CharStreams;
import com.lucernex.qa.FileUtilities;
import com.lucernex.qa.iwms.parsers.ErrorsHtmlParser;

import org.junit.Test;
import org.w3c.tidy.Tidy;

import java.io.CharArrayWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.StringReader;
import java.util.List;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

public class ErrorsHtmlParserTest {
    @Test
    public void failures() throws Exception {
        File file = new File(
            FileUtilities.getCWD(),
            "src/test/resources/com/lucernex/qa/iwms/parsers/ErrorsHtml.html"
        );

        assertTrue(file.exists());

        Tidy htmlTidy = new Tidy();

        htmlTidy.setIndentContent(true);
        htmlTidy.setPrintBodyOnly(true);

        CharArrayWriter writer = new CharArrayWriter();

        htmlTidy.parse(new FileInputStream(file), writer);

        List<String> errors = CharStreams.readLines(
            new StringReader(writer.toString()),
            new ErrorsHtmlParser()
        );

        assertNotNull(errors);
        System.out.println(errors);
    }
}
