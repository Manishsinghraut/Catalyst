package com.lucernex.qa.utils;

import com.google.common.collect.ImmutableList;
import com.google.common.io.Closeables;
import com.google.common.io.Files;
import com.lucernex.qa.data.ExcelHelper;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.util.Date;

import static junit.framework.Assert.assertTrue;

public class Spreadsheet {
    // Set of IWMS spreadsheet columns that are common to all IWMS generated
    // spreadsheet templates.
    private static final String COLNAME_UNIQUEID = "Entity Unique ID";
    private static final String     COLNAME_PEID = "Project Entity ID";
    private static final String   COLNAME_PENAME = "Entity Name";
    private static final String   COLNAME_PETYPE = "Entity Type";
    private static final String  COLNAME_ROWTYPE = "RowType";
    private static final String COLNAME_CLIENTID = "ClientID";
    private static final String[] COLNAME_COMMON = {
        COLNAME_UNIQUEID,
        COLNAME_PEID,
        COLNAME_PENAME,
        COLNAME_PETYPE,
        COLNAME_ROWTYPE,
        COLNAME_CLIENTID
    };

    // Data type of a sheet cell value.
    public enum Type {
        TEXT(ExcelHelper.sTYPE_TEXT),
        NUMBER(ExcelHelper.sTYPE_NUMBER),
        DATE(ExcelHelper.sTYPE_DATE),
        TIME(ExcelHelper.sTYPE_TIME);

        private int id;

        public int getId() {
            return id;
        }

        private Type(final int id) {
            this.id = id;
        }
    };

    // We will delegate select operations to the ExcelHelper class when supported.
    private ExcelHelper delegate;

    // IWMS spreadsheet file.
    private File file;

    // The one and only sheet expected from the Excel workbook.
    private ExcelHelper.ExcelSheet sheet;

    // Sheet row that contains the column headers.
    private int headerRow;

    // Spreadsheet row where data rows start (one based).
    private int dataRow;

    /**
     * Returns the sheet row which contains the column headers (zero based
     * row index).
     */
    public int getHeaderRow() {
        return headerRow;
    }

    /**
     * Returns the sheet row which contains the first data row (zero based
     * row index).
     */
    public int getDataRow() {
        return dataRow;
    }

    public class UpdateCellValue extends AbstractVisitor {
        private org.apache.poi.ss.usermodel.Cell cell;

        public void visit(Boolean value) {
            cell.setCellFormula(value.toString());
        }

        public void visit(Date value) {
            cell.setCellValue(value);
        }

        public void visit(Integer value) {
            cell.setCellValue(value);
        }

        public void visit(Double value) {
            cell.setCellValue(value);
        }

        public void visit(String value) {
            cell.setCellValue(value);
        }

        public void setValue(org.apache.poi.ss.usermodel.Cell cell, Object value) throws Throwable {
            this.cell = cell;

            try {
                dispatch(value);
            } catch (VisitException ve) {
                throw ve.getTargetException();
            }
        }
    }

    private static UpdateCellValue updateCellValue;

    /**
     * Sets the value of the specified cell to the provided value in a type
     * sensitive manner.
     *
     * @param cell  - cell to update
     * @param value - new cell value
     */
    private void setValue(org.apache.poi.ss.usermodel.Cell cell, Object value) throws Throwable {
        if (updateCellValue == null) {
            updateCellValue = new UpdateCellValue();
        }

        synchronized (updateCellValue) {
            updateCellValue.setValue(cell, value);
        }
    }

    private void print(org.apache.poi.ss.usermodel.Row row) {

        for (org.apache.poi.ss.usermodel.Cell c : row) {
            System.out.println("cell: " + c.getColumnIndex());

            switch (c.getCellType()) {
                case org.apache.poi.ss.usermodel.Cell.CELL_TYPE_BLANK:
                    System.out.println("blank");
                    break;
                case org.apache.poi.ss.usermodel.Cell.CELL_TYPE_BOOLEAN:
                    boolean b = c.getBooleanCellValue();
                    System.out.println("boolean: " + b);
                    break;
                case org.apache.poi.ss.usermodel.Cell.CELL_TYPE_ERROR:
                    System.out.println("error");
                    break;
                case org.apache.poi.ss.usermodel.Cell.CELL_TYPE_FORMULA:
                    //System.out.println("formula: " + formulaEvaluator.evaluateFormulaCell(c));
                    System.out.println("formula: " + c.getCellFormula());
                    break;
                case org.apache.poi.ss.usermodel.Cell.CELL_TYPE_NUMERIC:
                    double number = c.getNumericCellValue();
                    System.out.println("number: " + number);
                    break;
                case org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING:
                    String string = c.getStringCellValue();
                    System.out.println("string: " + string);
                    break;
            }
        }
    }

    /**
     * Returns a list of the sheet's column header names.
     */
    public ImmutableList<String> getColumnHeaders() {
        return ImmutableList.copyOf(sheet.getColumnHeaders());
    }

    /**
     * Returns the sheet's name.
     */
    public String getSheetName() {
        return this.sheet.getSheetName();
    }

    /**
     * Returns the sheet from the Excel workbook.
     */
    public Sheet getSheet() {
        return this.sheet.getSheet();
    }

    /**
     * Returns sheet's cell value (as a string) at a specified column and row.
     *
     * @param columnName - name of the column of interest
     * @param row        - row within sheet
     */
    public String getStringCellValue(String columnName, int row) {
        return sheet.getStringCellValue(columnName, row);
    }

    /**
     * Returns sheet's cell value (as an integer) at a specified column and row.
     *
     * @param columnName - name of the column of interest
     * @param row        - row within sheet
     */
    public Integer getIntegerCellValue(String columnName, int row) {
        return sheet.getIntegerCellValue(columnName, row);
    }

    /**
     * Returns sheet's cell value (as a date) at a specified column and row.
     *
     * @param columnName - name of the column of interest
     * @param row        - row within sheet
     */
    public Date getDateCellValue(String columnName, int row) {
        return sheet.getDateCellValue(columnName, row);
    }

    /**
     * Returns sheet's cell value (as a date with time) at a specified column and row.
     *
     * @param columnName - name of the column of interest
     * @param row        - row within sheet
     */
    public Date getDatetimeCellValue(String columnName, int row) {
        return sheet.getDatetimeCellValue(columnName, row);
    }

    /**
     * Returns sheet's cell value at a specified row and column converting it to
     * the desired data type.
     *
     * @param columnName  - name of the column of interest
     * @param row         - row within sheet
     * @param desiredType - desired data type to return
     */
    public Object getCellValue(String columnName, int row, Type desiredType) {
        return sheet.getCellValue(columnName, row, desiredType.getId());
    }

    /**
     * Returns sheet's cell value at a specified row and column converting it to
     * the desired data type.
     *
     * @param row         - row containing the desired cell
     * @param column      - column containing the desired cell
     * @param desiredType - desired data type to return
     */
    public Object getCellValue(int row, int column, Type desiredType) {
        return sheet.getCellValue(row, column, desiredType.getId(), "N/A");
    }

    /**
     * Returns true if the specified row has no cell values.
     *
     * @param row - row to inquire about
     */
    public boolean isEmptyRow(int row) throws Exception {
        return sheet.isEmptyRow(row);
    }

    public static String getFileSuffix(File file) {
        if (file == null) {
            return null;
        }

        int dot = file.getName().lastIndexOf('.');

        assertTrue(String.format("File '%s' does not have a file suffix!", file.getName()), dot > -1);

        String suffix = file.getName().substring(dot);

        if (suffix.equalsIgnoreCase(".xls")) {
            return ".xls";
        } else if (suffix.equalsIgnoreCase(suffix)) {
            return ".xlsx";
        } else {
            String msg = String.format(
                "File '%s' is not of a support type ['xls','xlsx]!",
                file.getName()
            );

            throw new IllegalStateException(msg);
        }
    }

    private Sheet getSheet(File spreadsheet, FileInputStream inputStream) throws IOException {
        String suffix = getFileSuffix(spreadsheet);

        if (suffix.equals(".xlsx")) {
            XSSFWorkbook book = new XSSFWorkbook(inputStream);
            XSSFSheet   sheet = book.getSheetAt(0);

            return sheet;
        } else {
            HSSFWorkbook book = new HSSFWorkbook(inputStream);
            HSSFSheet   sheet = book.getSheetAt(0);

            return sheet;
        }
    }

    private Sheet createSheet(String suffix, String sheetName) {
        if (suffix.equals(".xlsx")) {
            XSSFWorkbook book = new XSSFWorkbook();
            XSSFSheet   sheet = book.createSheet(sheetName);

            return sheet;
        } else {
            HSSFWorkbook book = new HSSFWorkbook();
            HSSFSheet   sheet = book.createSheet(sheetName);

            return sheet;
        }
    }

    /**
     * Save current spreadsheet to specified file.
     *
     * @param file - target spreadsheet file
     */
    public void saveAs(File file) throws IOException, ParseException {
        String  inSuffix = getFileSuffix(this.file);
        String outSuffix = getFileSuffix(file);

        // Make a copy of the existing spreadsheet file potentially converting
        // the spreadsheet file type (e.g. xls to xlsx).
        if (inSuffix.equals(outSuffix)) {
            Files.copy(this.file, file);
        } else if (outSuffix.equals(".xls")) {
            FormatConverter.xlsx_to_xls(this.file, file);
        } else {
            FormatConverter.xls_to_xlsx(this.file, file);
        }

        FileInputStream in = new FileInputStream(file);
        Sheet sheet;

        // Fetch the sheet from the new spreadsheet file.
        try {
            sheet = getSheet(file, in);
        } finally {
            Closeables.close(in, true);
        }

        /**
        int dataRows = this.getRowCount();

        // Delete data rows from output spreadsheet.
        for (int i = 0; i < dataRows; i++) {
            int  lastRow = sheet.getLastRowNum();
            org.apache.poi.ss.usermodel.Row row = sheet.getRow(lastRow);

            if (row != null) {
                sheet.removeRow(row);
            }
        }
*/

        // Add data rows to output spreadsheet from in memory spreadsheet.
        /*
        for (int i = 0; i < dataRows; i++) {
            Row srcRow = this.getRow(i);

            if (srcRow != null) {
                org.apache.poi.ss.usermodel.Row rowDst = sheet.createRow(sheet.getLastRowNum() + 1);

                for (int j = 0; j < srcRow.getCells().size(); j++) {
                    com.lucernex.qa.data.Cell        srcCell = srcRow.getCells().get(j);
                    Object                             value = srcCell.getValue();
                    org.apache.poi.ss.usermodel.Cell cellDst = rowDst.createCell(j);

                    if (value != null) {
                        try {
                            setValue(cellDst, value);
                        } catch (Throwable t) {
                            throw new IOException(t.getMessage());
                        }
                    }
                }
            }
        }
*/
        FileOutputStream out = new FileOutputStream(file);

        // Write spreadsheet changes to new spreadsheet file.
        try {
            sheet.getWorkbook().write(out);
        } finally {
            Closeables.close(out, true);
        }
    }

    /**
     * Updates the specified spreadsheet file.
     */
    public void update() throws IOException {
        if (file == null || !file.exists()) {
            String msg = "Spreadsheet file not specified or does not exist!";

            throw new IllegalStateException(msg);
        }

        FileInputStream inputStream = new FileInputStream(file);

        try {
            Sheet sheet = getSheet(file, inputStream);

            // TODO: implement
        } finally {
            Closeables.close(inputStream, true);
        }
    }
    /**
     * Create instance given the spreadsheet file.
     *
     * @param spreadsheet - file containing an IWMS spreadsheet
     */
    public Spreadsheet(File spreadsheet) throws IOException {
        this.delegate  = new ExcelHelper(spreadsheet);
        this.file      = spreadsheet;
        this.sheet     = this.delegate.getSheet("whatever", true);
        this.headerRow = this.sheet.findHeaderRow(COLNAME_COMMON);
        this.dataRow   = this.headerRow + 2;
    }
}
