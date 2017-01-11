package com.lucernex.qa.datatable;
//////////////////////////////////////////////////////////////////////////////
//(c)2014 Lucernex, Inc.
//Author: Salome Marquez
//$Revision:  $
//////////////////////////////////////////////////////////////////////////////

/**
 *
 */
public interface DataTableDriverInterface {


    public void close();

    /**
     * Returns a String representation of the data in the given table name, Column Name, and row number.
     *
     * @param tableName - the name of the table to read the data from.
     * @param colName   - the name of the column to read the data from.
     * @param rowIndex  - the row number to read the data from.
     * @return A String representation of the data in the given coordinates.
     */
    public String getData(String tableName, String colName, int rowIndex);

    /**
     * Returns a String representation of the data in the current table, with the given Column Name and row number.
     *
     * @param colName  - the name of the column to read the data from.
     * @param rowIndex - the row number to read the data from.
     * @return A String representation of the data in the given coordinates.
     */
    public String getData(String colName, int rowIndex);

    /**
     * Returns a String representation of the data in the current DataTable and on the DataTable's currently selected row,
     * in the given Column Name.
     *
     * @param colName - the name of the column to read the data from.
     * @return A String representation of the data that's in the given ColumnName and in the current DataTable's current row.
     */
    public String getData(String colName);

    /**
     * Returns the number of entries (rows) in the table with the given name.
     *
     * @param tableName - the name of the table to fetch the number of entries from.
     * @return the number of rows in the table with the given name.
     */
    public int getRowCount(String tableName);

    /**
     * Return the number of entries (rows) in the currently selected table.
     *
     * @return the number of rows in the currently selected table.
     */
    public int getRowCount();

    /**
     * Changes the currently selected table to a table with the given name, and set the new table's current row to 0.
     * Or, sets the currently selected table to null if there is no table with the given name. Still resets the current row
     * to 0.
     *
     * @param newTableName - the new table's name.
     */
    public void setCurrentTable(String newTableName);

    /**
     * Changes the DataTable's current row to newRow.
     *
     * @param newRowIndex - the new row index
     */
    public void setCurrentRow(int newRowIndex);

    /**
     * Resets the current DataTable to the first table in the DataTable map, and resets the new table's current row to 0.
     */
    public void resetCurrentTable();
}
