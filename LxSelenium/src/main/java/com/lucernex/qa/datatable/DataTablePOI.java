package com.lucernex.qa.datatable;


import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;

import java.util.Hashtable;
import java.util.Iterator;

/**
 *
 */
public class DataTablePOI implements DataTableInterface {

    private Hashtable<String, Integer> headerDictionary = new Hashtable<String, Integer>();
    private Sheet mySheet;
    private int currentRowIndex = 1;
    //private Row		colHeader;

    public DataTablePOI(Sheet POIspreadSheet) {
        this.mySheet = POIspreadSheet;
        //this.colHeader	=	this.mySheet.getRow(0);
        this.makeHeaderDictionary();
    }

    private void makeHeaderDictionary() {
        //	Grab the column header
        Row colHeader = this.mySheet.getRow(0);
        //	Iterate through the top row, and put each value in the header dictionary
        Iterator<Cell> cellIT = colHeader.cellIterator();

        while (cellIT.hasNext()) {
            Cell myCell = cellIT.next();
            this.headerDictionary.put(myCell.getStringCellValue(), myCell.getColumnIndex());
        }
    }

    /* (non-Javadoc)
     * @see DataTable.DataTableInterface#getRowCount()
     */
    @Override
    public int getRowCount() {
        // TODO Auto-generated method stub
        return this.mySheet.getLastRowNum();
    }

    /* (non-Javadoc)
     * @see DataTable.DataTableInterface#getColumnCount()
     */
    @Override
    public int getColumnCount() {
        return this.headerDictionary.size();
    }

    /* (non-Javadoc)
     * @see DataTable.DataTableInterface#getName()
     */
    @Override
    public String getName() {
        return this.mySheet.getSheetName();
    }

    /* (non-Javadoc)
     * @see DataTable.DataTableInterface#getColumnIndex(java.lang.String)
     */
    @Override
    public int getColumnIndex(String colName) {

        return this.headerDictionary.get(colName);

        //Toan Notes....this catch if xls col header wrong name
    }

    /* (non-Javadoc)
     * @see DataTable.DataTableInterface#setCurrentRowIndex(int)
     */
    @Override
    public void setCurrentRowIndex(int newRowIndex) {
        this.currentRowIndex = newRowIndex;
    }

    /* (non-Javadoc)
     * @see DataTable.DataTableInterface#getCurrentRowIndex()
     */
    @Override
    public int getCurrentRowIndex() {
        return this.currentRowIndex;
    }
}
