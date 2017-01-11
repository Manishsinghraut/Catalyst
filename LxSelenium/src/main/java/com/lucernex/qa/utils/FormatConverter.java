package com.lucernex.qa.utils;

import com.google.common.io.Closeables;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.*;
import java.util.Iterator;

import static com.google.common.base.Preconditions.checkArgument;
import static junit.framework.Assert.assertTrue;

public class FormatConverter {
    private static void copyWorkbook(Workbook src, Workbook dst) {
        int   sheetCnt = src.getNumberOfSheets();

        for (int i = 0; i < sheetCnt; i++) {
            Sheet           sIn = src.getSheetAt(0);
            Sheet          sOut = dst.createSheet(sIn.getSheetName());
            Iterator<Row> rowIt = sIn.rowIterator();

            while (rowIt.hasNext()) {
                Row rowIn = rowIt.next();
                Row rowOut = sOut.createRow(rowIn.getRowNum());

                Iterator<Cell> cellIt = rowIn.cellIterator();

                while (cellIt.hasNext()) {
                    Cell  cellIn = cellIt.next();
                    Cell cellOut = rowOut.createCell(
                            cellIn.getColumnIndex(),
                            cellIn.getCellType()
                    );

                    switch (cellIn.getCellType()) {
                        case Cell.CELL_TYPE_BLANK:
                            break;

                        case Cell.CELL_TYPE_BOOLEAN:
                            cellOut.setCellValue(cellIn.getBooleanCellValue());
                            break;

                        case Cell.CELL_TYPE_ERROR:
                            cellOut.setCellValue(cellIn.getErrorCellValue());
                            break;

                        case Cell.CELL_TYPE_FORMULA:
                            cellOut.setCellFormula(cellIn.getCellFormula());
                            break;

                        case Cell.CELL_TYPE_NUMERIC:
                            cellOut.setCellValue(cellIn.getNumericCellValue());
                            break;

                        case Cell.CELL_TYPE_STRING:
                            cellOut.setCellValue(cellIn.getStringCellValue());
                            break;
                    }

                    {
                        CellStyle styleIn = cellIn.getCellStyle();
                        CellStyle styleOut = cellOut.getCellStyle();
                        styleOut.setDataFormat(styleIn.getDataFormat());
                    }

                    cellOut.setCellComment(cellIn.getCellComment());
                }
            }
        }
    }

    public static void xls_to_xlsx(File src, File dst) throws IOException {
        checkArgument(src != null, "Required argument 'src' is null!");
        checkArgument(dst != null, "Required argument 'dst' is null!");

        String srcSuffix = Spreadsheet.getFileSuffix(src);

        assertTrue(
            String.format("File '%s' does not have expected '.xls' suffix!", src.getAbsolutePath()),
            srcSuffix.equals(".xls")
        );

        String dstSuffix = Spreadsheet.getFileSuffix(dst);

        assertTrue(
                String.format("File '%s' does not have expected '.xlsx' suffix!", dst.getAbsolutePath()),
                dstSuffix.equals(".xlsx")
        );
        
        if (dst.exists()) {
            dst.delete();
        }

        InputStream in = new BufferedInputStream(new FileInputStream(src));

        try {
            Workbook srcWB = new HSSFWorkbook(in);
            Workbook dstWB = new XSSFWorkbook();

            copyWorkbook(srcWB, dstWB);

            OutputStream out = new BufferedOutputStream(new FileOutputStream(dst));

            try {
                dstWB.write(out);
            } finally {
                Closeables.close(out, true);
            }
        } finally {
            Closeables.close(in, true);
        }
    }

    public static void xlsx_to_xls(File src, File dst) throws IOException {
        checkArgument(src != null, "Required argument 'src' is null!");
        checkArgument(dst != null, "Required argument 'dst' is null!");

        String srcSuffix = Spreadsheet.getFileSuffix(src);

        assertTrue(
                String.format("File '%s' does not have expected '.xlsx' suffix!", src.getAbsolutePath()),
                srcSuffix.equals(".xlsx")
        );

        String dstSuffix = Spreadsheet.getFileSuffix(dst);

        assertTrue(
                String.format("File '%s' does not have expected '.xls' suffix!", dst.getAbsolutePath()),
                dstSuffix.equals(".xls")
        );

        if (dst.exists()) {
            dst.delete();
        }

        InputStream in = new BufferedInputStream(new FileInputStream(src));

        try {
            Workbook srcWB = new XSSFWorkbook(in);
            Workbook dstWB = new HSSFWorkbook();

            copyWorkbook(srcWB, dstWB);

            OutputStream out = new BufferedOutputStream(new FileOutputStream(dst));

            try {
                dstWB.write(out);
            } finally {
                Closeables.close(out, true);
            }
        } finally {
            Closeables.close(in, true);
        }
    }
}
