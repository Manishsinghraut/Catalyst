package com.lucernex.qa.datatable;

/**
 * Reading data driven xls file.Navigating data test
 */
public interface DataTableInterface {
    /**
     * Returns the number of entries (rows) in this DataTable.
     *
     * @return the number of rows in this DataTable.
     */
    public int getRowCount();

    /**
     * Returns the number of variables (columns) in this DataTable.
     *
     * @return the number of columns in this DataTable.
     */
    public int getColumnCount();

    /**
     * Returns the name of this sheet.
     *
     * @return the name of this sheet.
     */
    public String getName();

    /**
     * Returns the column Index of the column titled 'colName.'
     *
     * @param colName - the name of the column
     * @return the index of the column titled 'colName' or null if it doesn't exist.
     */
    public int getColumnIndex(String colName);

    /**
     * Changes the current row to the row at row number 'newRowNum.'
     *
     * @param newRowIndex - the row index of the new row to set the current row to.
     */
    public void setCurrentRowIndex(int newRowIndex);

    /**
     * Returns the current row's index.
     *
     * @return the current row's index.
     */
    public int getCurrentRowIndex();
}
