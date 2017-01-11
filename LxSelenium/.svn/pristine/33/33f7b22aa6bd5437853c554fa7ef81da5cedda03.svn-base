package com.lucernex.qa.datatable;

//////////////////////////////////////////////////////////////////////////////
//(c)2014 Lucernex, Inc.
//Author: Salome Marquez
//$Revision:  $
//////////////////////////////////////////////////////////////////////////////


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Hashtable;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

public class DataTableDriverPOI implements DataTableDriverInterface {
	private static Logger logger = 
		Logger.getLogger(DataTableDriverPOI.class.getName());

	/** Get a Cell value as Text / String */
	public int sTYPE_TEXT = 1;
	/** Get a Cell value as a Date */
	public int sTYPE_DATE = 1;
	
	private static final SimpleDateFormat sDateTimeFormatter = 
		new SimpleDateFormat("MM/dd/yyyy hh:mm:ss a");
	
    //private DataTableInterface currentTable;
    //private Hashtable<String, Sheet> sheetDictionary = new Hashtable<String, Sheet>();
    private DataTableInterface currentTable;
    private Hashtable<String, DataTableInterface> tableDictionary = new Hashtable<String, DataTableInterface>();
    private final String dataFilePath;
    private final Workbook workBook;


    /**
     * Creates a DataTableDriver by creating a FileInputStream to the data file path.
     *
     * @param dataFilePath - the system dependent file name (path).
     * @throws InvalidFormatException
     * @throws FileNotFoundException
     * @throws IOException
     */
    public DataTableDriverPOI(String dataFilePath) throws InvalidFormatException, FileNotFoundException, IOException {
    	this.dataFilePath = dataFilePath;
    	FileInputStream fIn = new FileInputStream(dataFilePath);
        this.workBook = WorkbookFactory.create(fIn);
        this.initData();
    }


    /**
     * Creates a new DataTableDriver from a File representing the data file.
     * This option allows for lower memory consumption.
     *
     * @param dataFile - the File that represents the data file to load data from
     * @throws IOException
     * @throws InvalidFormatException
     */
    public DataTableDriverPOI(File dataFile) throws InvalidFormatException, IOException {
        this.dataFilePath = dataFile.getAbsolutePath();
        this.workBook = WorkbookFactory.create(dataFile);
        this.initData();
    }

    private void initData() {
        //System.out.println("DataTableDriverPOI.initData()");
        this.parseDataTable();
        this.resetCurrentTable();
    }

    /**
     * Parses the Excel sheets into a hashtable of DataTables. Makes the look up of the column names eaiser.
     */
    private void parseDataTable() {
        int numOfSheets = this.workBook.getNumberOfSheets();
        DataTableInterface table;

        for (int i = 0; i < numOfSheets; i++) {
            table = new DataTablePOI(this.workBook.getSheetAt(i));
            this.tableDictionary.put(table.getName(), table);
        }
    }

    /* (non-Javadoc)
     * @see DataTable.DataTableDriverInterface#close()
     */
    @Override
    public void close() {
        // TODO Auto-generated method stub
    }

    /* (non-Javadoc)
     * @see DataTable.DataTableDriverInterface#getData(java.lang.String)
     */
    @Override
    public String getData(String colName) {
        return this.getData(colName, this.currentTable.getCurrentRowIndex());
    }

    /* (non-Javadoc)
     * @see DataTable.DataTableDriverInterface#getData(java.lang.String, int)
     */
    @Override
    public String getData(String colName, int rowIndex) {
        return this.getData(this.currentTable.getName(), colName, rowIndex);
    }

	/**
	 * Get a cell value based on row, col, pos
	 * @param cell - cell to get value for
	 * @param desiredType - sTYPE_TEXT, sTYPE_DATE etc.. 
	 * @return value (according to desiredType)
	 */		
	private Object getCellValue(Cell cell, int desiredType) {			
		if (cell == null) {
			return null;
		}
		Object retVal = null;
		int type = cell.getCellType();
		if (type == HSSFCell.CELL_TYPE_FORMULA) {
			// Get formula result type - do we need to evaluate first??
			type = cell.getCachedFormulaResultType();
		}
		switch (type) {
			case HSSFCell.CELL_TYPE_FORMULA :
				// Hmmm. no support yet for computing here - TODO:
				/*
				//System.out.println ("Formula is: " + ni.cell.getCellFormula());
				HSSFFormulaEvaluator.CellValue cellValue = evaluator.evaluate(ni.cell);
				if (cellValue.getErrorValue() != 0) {
					errors.append("Error evaluating value for " + key + "<br>");
					val = null;
				} else {
					val = cellValue.getNumberValue();
				}
				*/
				// fall into numeric..
			case HSSFCell.CELL_TYPE_NUMERIC :
				if ( desiredType == sTYPE_TEXT) {						
					DataFormatter formatter = new DataFormatter();						
					retVal = formatter.formatCellValue(cell);																		
				} else { 
					// check / handle date
					try {
						if(	HSSFDateUtil.isCellDateFormatted(cell) || 
							HSSFDateUtil.isCellInternalDateFormatted(cell) || 
							desiredType == sTYPE_DATE) {
							Date date = cell.getDateCellValue();
							retVal = date;
						} else {
							// treat as Number
							double dbl = cell.getNumericCellValue();					
							retVal = new Double(dbl);
						}
					} catch (Exception e) {
						logger.log(Level.WARNING, 
								"Row/Col = " + cell.getRowIndex() + "/" + cell.getColumnIndex() +
								" Unable to parse '" + cell.getRichStringCellValue().getString() + "' as Date", e);
					}
				}
				break;
			
			case HSSFCell.CELL_TYPE_BLANK:
				retVal = null;
				break;
			
			case HSSFCell.CELL_TYPE_STRING :
				// cell type string.
				retVal = cell.getRichStringCellValue().getString();
				break;
				
			case HSSFCell.CELL_TYPE_BOOLEAN:
				try {
					// cell type boolean.
					retVal = Boolean.valueOf(cell.getBooleanCellValue());
				} catch (Exception e) {
					logger.log(Level.WARNING, 
								"Row/Col = " + cell.getRowIndex() + "/" + cell.getColumnIndex() +
								" Unable to parse '" + cell.getRichStringCellValue().getString() + "' as Boolean", e);
				}
				break;
				
			default :
				logger.log(Level.WARNING, 
						"Row/Col = " + cell.getRowIndex() + "/" + cell.getColumnIndex() +
						" Unable to determine type for '" + cell.getRichStringCellValue().getString());
				retVal = null;
				break;
		}

		if (retVal instanceof String) {
			retVal = ((String) retVal).trim();
		} else if (desiredType == sTYPE_TEXT) {
			// Convert to string.
			if (retVal instanceof Date) {
				retVal = sDateTimeFormatter.format((Date) retVal);				
			} else if (retVal != null) {
				retVal = retVal.toString();
			}
		}
		return retVal;
	}				
	
    /* (non-Javadoc)
     * @see DataTable.DataTableDriverInterface#getData(java.lang.String, java.lang.String, int)
     */
    @Override
    public String getData(String tableName, String colName, int rowIndex) {
        //	Find the table
        DataTableInterface table = this.tableDictionary.get(tableName);
        //	Find the sheet
        Sheet mySheet = this.workBook.getSheet(table.getName());
        //	Find the row
        Row myRow = mySheet.getRow(rowIndex);
        //	Grab the cell from the row
        Cell myCell = myRow.getCell(table.getColumnIndex(colName));
        //set return cell as a string formatt
        try {
            //	Return the value of the cell as a string
            return (String)getCellValue(myCell, sTYPE_TEXT);
        } catch (NullPointerException e) {
            //  Return the empty string if null
            return "";
        }
    }

    /* (non-Javadoc)
     * @see DataTable.DataTableDriverInterface#getRowCount(java.lang.String)
     */
    @Override
    public int getRowCount(String tableName) {
        return this.tableDictionary.get(tableName).getRowCount();
    }

    /* (non-Javadoc)
     * @see DataTable.DataTableDriverInterface#getRowCount()
     */
    @Override
    public int getRowCount() {
        return this.currentTable.getRowCount();
    }

    /* (non-Javadoc)
     * @see DataTable.DataTableDriverInterface#setCurrentTable(java.lang.String)
     */
    @Override
    public void setCurrentTable(String newTableName) {
        this.currentTable = this.tableDictionary.get(newTableName);
        if (currentTable == null) {
        	throw new RuntimeException("Unable to find sheet named '" + newTableName + 
        								"' in file '" +	dataFilePath + "'");
        }
        this.currentTable.setCurrentRowIndex(1);    //	Row 1 is where the data starts. Row 0 is the column header
    }

    /* (non-Javadoc)
     * @see DataTable.DataTableDriverInterface#setCurrentRow(int)
     */
    @Override
    public void setCurrentRow(int newRowIndex) {
        this.currentTable.setCurrentRowIndex(newRowIndex);
    }

    /* (non-Javadoc)
     * @see DataTable.DataTableDriverInterface#resetCurrentTable()
     */
    @Override
    public void resetCurrentTable() {
        this.setCurrentTable(this.workBook.getSheetName(0));
    }
}