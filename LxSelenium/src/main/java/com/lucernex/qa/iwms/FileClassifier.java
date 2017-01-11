package com.lucernex.qa.iwms;

import org.xml.sax.Attributes;
import org.xml.sax.helpers.DefaultHandler;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import java.io.File;

public class FileClassifier extends DefaultHandler {
    // Class of file.
    public enum FileClass {Legacy, Spreadsheet, Restful, Unknown};

    // A XML tag that is known to be from a RESTful XML file.
    private static final String restfulTag = "LxERP";

    // XML tags that are known to be legacy tags.
    private static final String[] oldTags = new String[] {"pagelayouts", "reportgroupdatas","forms"};

    // Relatively expensive to create.
    private static final SAXParserFactory factory = SAXParserFactory.newInstance();

    private int numTagsChecked = 0;
    private FileClass fileClass = FileClass.Unknown;

    public void startElement(
        String namespaceURI,
        String    localName,
        String        qName,
        Attributes     atts
    ) {
        numTagsChecked ++;
        qName = qName.toLowerCase();

        if (qName.endsWith("lxerp")) {
            for (int idx=0; idx < atts.getLength(); idx++) {
                String  qn = atts.getQName(idx);
                if (qn != null && qn.toLowerCase().startsWith("xmlns")) {
                    String val = atts.getValue(idx);
                    if ("http://iwms.lucernex.com/messaging".equals(val)) {
                        fileClass = FileClass.Legacy;
                        throw new RuntimeException("Done checking");
                    }
                }
            }
        }

        for (String tag : oldTags) {
            if (qName.equals(tag) || (qName.endsWith(":" + tag))) {
                fileClass = FileClass.Legacy;
                throw new RuntimeException("Done checking");
            }
        }

        if (restfulTag.equalsIgnoreCase(qName)) {
            fileClass = FileClass.Restful;
            throw new RuntimeException("Done checking");
        }
    }

    /**
     * Classifies a file as a Legacy XML, Spreadsheet, or RESTful XML.
     */
    public static FileClass classify(File file) throws Exception {
        if (file == null) {
            return FileClass.Unknown;
        }

        if (file.getName().endsWith(".xls") || file.getName().endsWith(".xlsx")) {
            return FileClass.Spreadsheet;
        }

        FileClassifier fc = new FileClassifier();

        try {
            SAXParser saxParser = factory.newSAXParser();
            saxParser.parse(file, fc);
        } catch (RuntimeException e) {
            // eat, perhaps done checking
            // We throw this to end the parse, found tag we were looking for.
        } catch (Exception e) {
            // Hmmm... invalid xml - message as such
            if (fc.numTagsChecked == 0) {
                throw new Exception(String.format("Unable to parse XML file '%s'", file.getName()), e);
            }
        }

        return fc.fileClass;
    }
}
