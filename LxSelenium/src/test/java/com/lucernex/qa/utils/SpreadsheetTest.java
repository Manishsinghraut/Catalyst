package com.lucernex.qa.utils;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.junit.Test;

import java.io.File;
import java.util.List;

import static junit.framework.Assert.assertNotNull;
import static junit.framework.Assert.assertNull;
import static junit.framework.TestCase.assertEquals;
import static junit.framework.TestCase.assertTrue;

public class SpreadsheetTest {
    private static File EMPLOYER_TEMPLATE = new File("Data/Templatedownload/TemplateBaseLine/Employer.xlsx");

    @Test
    public void testSpreadsheetTemplate() throws Exception {
        assertTrue(EMPLOYER_TEMPLATE.exists());

        Spreadsheet       ss = new Spreadsheet(EMPLOYER_TEMPLATE);
        List<String> columns = ss.getColumnHeaders();

        assertNotNull(columns);

        assertEquals("Employer", ss.getSheetName());

        Sheet sheet = ss.getSheet();

        assertNotNull(sheet);

        int headerRow = ss.getHeaderRow();
        int dataRow   = ss.getDataRow();

        assertTrue(dataRow > headerRow);

        Row row = sheet.getRow(dataRow);

        assertNull("Spreadsheet has a data row which is unexpected!", row);
    }

    private static File EMPLOYER_WITH_DATA = new File("Data/ImportDataFiles/02 Employer.xlsx");

    @Test
    public void testSpreadsheetWithDataRows() throws Exception {
        assertTrue(EMPLOYER_WITH_DATA.exists());

        Spreadsheet       ss = new Spreadsheet(EMPLOYER_WITH_DATA);
        List<String> columns = ss.getColumnHeaders();

        assertNotNull(columns);

        assertEquals("Employer", ss.getSheetName());

        Sheet sheet = ss.getSheet();

        assertNotNull(sheet);

        int headerRow = ss.getHeaderRow();
        int dataRow   = ss.getDataRow();

        assertTrue(dataRow > headerRow);

        for (int row = dataRow; row < sheet.getLastRowNum(); row++) {
            for (String column : columns) {
                String value = (String)ss.getCellValue(column, row, Spreadsheet.Type.TEXT);

                //System.out.format("%s: %s\n", column, value);
            }

            //System.out.println();
        }
    }
}
