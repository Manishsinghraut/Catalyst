//////////////////////////////////////////////////////////////////////////////
// (c)2009 Lucernex, Inc.
//////////////////////////////////////////////////////////////////////////////
package com.lucernex.qa.data;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFFormulaEvaluator;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFFormulaEvaluator;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.*;
import java.math.BigInteger;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

import static com.google.common.base.Preconditions.checkState;
import static com.google.common.base.Strings.isNullOrEmpty;

/** Class to help with Excel file reads/writes */
public class ExcelHelper {
    private static final Logger logger = Logger.getLogger(ExcelHelper.class.getName());
    
    /**
     * @author sergeym
     *
     * SimpleDateFormat is not thread save so adding wrapper
     */
    static public class ThreadSafeSimpleDateFormat {

        private DateFormat df;

        public ThreadSafeSimpleDateFormat(String format) {
            this.df = new SimpleDateFormat(format);
        }

        public synchronized String format(Date date) {
            return df.format(date);
        }

        public synchronized Date parse(String string) throws ParseException {
            return df.parse(string);
        }
    }
    
	private static final ThreadSafeSimpleDateFormat sDateFormatter =
		new ThreadSafeSimpleDateFormat("MM/dd/yyyy");
	
	private static final ThreadSafeSimpleDateFormat sDateTimeFormatter = 
		new ThreadSafeSimpleDateFormat("MM/dd/yyyy hh:mm:ss a");

	
	/** These must match the values in DataFieldTypes (which aren't going to change..) */
	public static final int sTYPE_TEXT 			  = 1;
    public static final int sTYPE_NUMBER             = 3;
    public static final int sTYPE_DATE               = 4;
    public static final int sTYPE_TIME                = 22;
	
	private File excelFile;
	private Workbook workBook;
	private Map<String, NameInfo> nameToCell;
	private Map<String, ExcelSheet> nameToSheet = new HashMap<String, ExcelSheet>();
	
	public ExcelHelper(File excelFile) throws IOException {
		this.excelFile = excelFile;
		if (!excelFile.exists()) {
			throw new IOException("Unable to process file, file '" + excelFile.getCanonicalPath() + "' does not exist");
		}
 		// Open file, read contents.
		FileInputStream stream   = null;
		workBook = null;
		try {
			stream   = new FileInputStream(excelFile);
			workBook = new HSSFWorkbook(stream);
		} catch (Exception e) {
			// Try newer excel format
			if (stream != null) {
				try{
					stream.close();
				}catch(IOException ioEx){
					logger.log(Level.SEVERE, "Error occurred when closing the excel file " + excelFile.getCanonicalPath(), ioEx);
				}
			}
			stream   = new FileInputStream(excelFile);
			workBook = new XSSFWorkbook(stream);
		} finally {
			if (stream != null) {
				try{
					stream.close();
				}catch(IOException ioEx){
					logger.log(Level.SEVERE, "Error occurred when closing the excel file " + excelFile.getCanonicalPath(), ioEx);
				}
			}
		}
		nameToCell = parseNames();
	}
	
	public File getFile() {
		return excelFile;
	}
	public Workbook getWorkbook() {
		return workBook;
	}
	
	protected Map<String, ExcelSheet> getSheetMap() {
		return nameToSheet;
	}

	
	/** Load from a resource, e.g. junit test..*/
	public ExcelHelper(String excelResource) throws IOException {
 		// Open file, read contents.
		InputStream stream   = null;
		workBook = null;
		try {
	    	stream = 
	    		ExcelHelper.class.getClassLoader().getResourceAsStream(excelResource);
			workBook = new HSSFWorkbook(stream);
		} catch (Exception e) {
			// Try newer excel format
			if (stream != null) {
				try{
					stream.close();
				}catch(IOException ioEx){
					logger.log(Level.SEVERE, "Error occurred when closing the excel file " + excelResource, ioEx);;
				}
			}
	    	stream = 
	    		ExcelHelper.class.getClassLoader().getResourceAsStream(excelResource);
			workBook = new XSSFWorkbook(stream);
		} finally {
			if (stream != null) {
				try{
					stream.close();
				}catch(IOException ioEx){
					logger.log(Level.SEVERE, "Error occurred when closing the excel file " + excelResource, ioEx);;
				}
			}
		}
		nameToCell = parseNames();
	}
	
	public class ExcelSheet {
		protected final Sheet sheet;
		protected int headerRow = -1;
		protected final Map <String, Integer> colNameIndex = new HashMap<String, Integer>();
		String lastErrors = "";

        protected ExcelSheet(Sheet sheet) {
            this.sheet  = sheet;
        }

		public Sheet getSheet() {
			return sheet;
		}
		
		public void resetErrors() {
			lastErrors = "";
		}
		
		public String getErrorMessages() {
			return lastErrors;
		}
		
		public void addError(String msg) {
			if (lastErrors.length() > 0) {
				lastErrors += "<BR>";
			}
			lastErrors += msg;
		}
		
		/** Find desired sheet and header columns by required header columns.
		 *  Not all header columns need to be specified but all will be available for 
		 *  value lookups once this method is called.
		 *  @param reqdHeaderColumnNames - list of column names that should define header row.  At least one must be found
		 *                                 for method to be successful.
		 * */
		public int findHeaderRow(String[] reqdHeaderColumnNames)
		{
			if (reqdHeaderColumnNames != null) {
				for (String colName : reqdHeaderColumnNames) {
					// Stick nulls, the col indices when we find 'em
					colNameIndex.put(colName, null);
				}
			}
			
			Iterator<Row> rows = sheet.rowIterator ();
			
			while (headerRow == -1 && rows.hasNext ())	{
				Row row = rows.next();
				// once get a row its time to iterate through cells.
				Iterator<Cell> cells = row.cellIterator();
		
				while (cells.hasNext ()) {
					Cell cell = cells.next();
					if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
						// String cells might be a match.
						String val = cell.getStringCellValue ();
						if (colNameIndex.containsKey(val)) {
							// found it, set this as header row.
							setHeaderRow(cell.getRowIndex());
							return headerRow;
						}
					}
				}
			}
			return headerRow;
		}
		
		/** Get header row value (must call findHeaderRow() first)
		 * @return row
		 * */
		public int getHeaderRow() {
			return headerRow;
		}
		
		/** Find desired sheet and header columns by required header columns.
		 *  Not all header columns need to be specified but all will be available for 
		 *  value lookups once this method is called.
		 * */
		public ArrayList<String> getColumnHeaders()
		{
			ArrayList<String> colHeaders = new ArrayList<String>();
			if (headerRow  != -1 ) {
				Row row = sheet.getRow(headerRow);
				
				Iterator<Cell> cells = row.cellIterator();
				while (cells.hasNext ()) {
					Cell cell = cells.next();
					colHeaders.add(cell.getStringCellValue ());										
				}
			}
			return colHeaders;
		}		
		
		// zip through and save all cols as keys for this row
		private void setHeaderRow(int rowIndex) {
			headerRow = rowIndex;
			Row row = sheet.getRow(rowIndex);
									
			// once get a row its time to iterate through cells.
			Iterator<Cell> cells = row.cellIterator();
	
			while (cells.hasNext ()) {
				Cell cell = cells.next();
				if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
					// String cells act as headers
					String val = cell.getStringCellValue ();
					if (val != null) {
						val = val.trim();
						colNameIndex.put(val, new Integer(cell.getColumnIndex()));						
					}
				}
			}
		}
		
		/** Get value for cell in column
		 * @param columnName column Name
		 * @param row row number
		 * @return value (trimmed) or null (returns null instead of empty string).
		 * */
		public String getStringCellValue(String columnName, int row) {
			Object val = null;
			try {
				val = getCellValue(columnName, row, sTYPE_TEXT);
				if (val != null) {
					String ret = val.toString();
					ret = ret.trim();
					if (ret.length() > 0) {
						return ret;
					}
				}
			} catch (Exception e) {
				logger.log(Level.WARNING, "Failed to fetch cell value at row=" + (row + 1) + " column='" + columnName + "'", e);
				addError("Error fetching value at row " + (row+1) + ", column '" + columnName + "'");
			}
			return null;
		}
		
		/** Get Integer value for cell in column 
		 * @param columnName column Name
		 * @param row row number
		 * @return
		 */
		public Integer getIntegerCellValue(String columnName, int row) {
			Object val = null;
			try {
				val = getCellValue(columnName, row, sTYPE_NUMBER);
				if (val instanceof Double) {
					return ((Double)val).intValue();
				} else if (val instanceof String && !isNullOrEmpty((String)val)) {
					Integer retVal = Integer.parseInt((String)val);
					return retVal;
				}
			} catch (Exception e) {
				logger.log(Level.SEVERE, "Unable to parse row=" + (row + 1) + " column='" + columnName + "' as a Number", e);
				addError("Unable to parse row " + (row+1) + ", column '" + columnName + "' with val='" + val + "' as a Number");
			}
			return null;
		}
		
		/** Get Date value for cell in column 		 
		 * @param columnName column Name
		 * @param row row number
		 * @return datevalue
		 */
		public Date getDateCellValue(String columnName, int row) {
			Object val = null;
			try {
				val = getCellValue(columnName, row, sTYPE_DATE);
				if (val instanceof Date) {
					return (Date)val;
				} else if (val instanceof String) {
					try {
						return sDateFormatter.parse((String)val);
					} catch (Exception e) {
						try {
							// Code prior to 9.2.2.1b, do we need this style parse?
							// leaving in case..
							DateFormat df = DateFormat.getInstance();
							return df.parse((String)val);
						} catch (Exception ee) {}
					}
				}
			} catch (Exception e) {
				logger.log(Level.SEVERE, "Unable to parse row=" + (row + 1) + " column='" + columnName + "' as a Date", e);
				addError("Unable to parse row " + (row+1) + ", column '" + columnName + "' with val='" + val + "' as a Date");
			}
			return null;
		}
		
		
		
		/** Get Date/Time value for cell in column 		 
		 * @param columnName column Name
		 * @param row row number
		 * @return datevalue
		 */
		public Date getDatetimeCellValue(String columnName, int row) {
			Object val = null;
			try {
				val = getCellValue(columnName, row, sTYPE_TIME);
				if (val instanceof Date) {
					return (Date)val;
				} else if (val instanceof String) {
					try {
						return sDateTimeFormatter.parse((String)val);
					} catch (Exception e) {}
				}
			} catch (Exception e) {
				logger.log(Level.SEVERE, "Unable to parse row=" + (row + 1) + " column='" + columnName + "' as a Datetime", e);
				addError("Unable to parse row " + (row+1) + ", column '" + columnName + "' with val='" + val + "' as a Datetime");
			}
			return null;
		}	
		

		/**
		 * Get a cell value based on row, col, pos 
		 * @param row row
		 * @param colIndex col
		 * @return value
		 */		
		public Object getCellValue(int row, int colIndex, int desiredFieldType, String columnName) {
			Row hRow = sheet.getRow(row);
			if (hRow == null) {
				return null;
			}
			Cell cell = hRow.getCell(colIndex);
			if (cell == null) {
				return null;
			}
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
					//addError("May have failed to get correct value for '" + columnName + "' on row " + (row+1) + ", formulas not fully supported");
					// fall into numeric..
				case HSSFCell.CELL_TYPE_NUMERIC :
					if ( desiredFieldType == sTYPE_TEXT) {						
						DataFormatter formatter = new DataFormatter();
						String val = formatter.formatCellValue(cell);																		
						if (val != null) {
							return val.trim();
						} else {
							return null;
						}
					} 
					// first try for date
					try {
						if(	HSSFDateUtil.isCellDateFormatted(cell) ||
							HSSFDateUtil.isCellInternalDateFormatted(cell) ||
							desiredFieldType == sTYPE_DATE || 
							desiredFieldType == sTYPE_TIME) {
							
							Date date = cell.getDateCellValue();
							if ( desiredFieldType == sTYPE_DATE) {							
						        return sDateFormatter.format(date);
							} else if ( desiredFieldType == sTYPE_TIME) {																
								//get date						        
						        return sDateTimeFormatter.format(date);
						    }								
						}
					} catch (Exception e) {
						// ignore?
						logger.log(Level.SEVERE, "Unable to parse row " + (row + 1) + " column '" + columnName + "' as Date", e);
					}
					// treat as Number
					double dbl = cell.getNumericCellValue();					
					return new Double(dbl);
				
				case HSSFCell.CELL_TYPE_BLANK:
					return null;
				
				case HSSFCell.CELL_TYPE_STRING :
					// cell type string.
					String val = cell.getRichStringCellValue().getString();
					if (val != null) {
						return val.trim();
					}					
				case HSSFCell.CELL_TYPE_BOOLEAN:
					// cell type boolean.
					String bVal = Boolean.toString(cell.getBooleanCellValue());
					return bVal.trim();														
				default :
					logger.log(Level.SEVERE, "Unable to read spreadsheet value for row/col " + row + "/" + colIndex + " cell is unsupported type");
					addError("Unable to read spreadsheet value for row/col " + row + "/" + colIndex + " cell is unsupported type");
					return null;			
			}
		}				
		
		/** Get value for cell in column
		 *  If boType is specified and we have a specific boType prefixed column we use that one, else
		 *  we will use first column named columnName 
		 * 
		 * @param columnName column Name
		 * @param row row number
		 * @param columnName
		 * @param desiredFieldType
		 * @return cell value
		 */
		public Object getCellValue(String columnName, int row, int desiredFieldType) {
            checkState(colNameIndex.size() > 0, "You must call setup header rows first");

			Integer colIndex = null;			
			if (colIndex == null) {
				// Just try lookup by name, no boType prefix column found
				colIndex = colNameIndex.get(columnName);			
			}
			if (colIndex == null) {
				// don't have this col.
                // At this point we don't know if the column is required or not, let caller report errors.
				//addError("Failed to get value for '" + columnName + "', header column not defined in row " + (headerRow + 1));
				return null;
			}
			return getCellValue(row, colIndex, desiredFieldType, columnName);
			
		}

		/** Utility method to check if a row is Empty */
		public boolean isEmptyRow(int rowNum) throws Exception {
		     boolean isEmptyRow = true;
		     Row row= sheet.getRow(rowNum);
		     if ( row != null) {
		         for(int cellNum = row.getFirstCellNum(); cellNum < row.getLastCellNum(); cellNum++){
		            Cell cell = row.getCell(cellNum);
		            if(cell != null && cell.getCellType() != Cell.CELL_TYPE_BLANK && !isNullOrEmpty(cell.toString())) {
		            	isEmptyRow = false;
		            }    
		         }
		     }
		     return isEmptyRow;
		 }
		
		/** Utility method to get name of the sheet 
		 * @return name
		 */
		public String getSheetName() {
			return this.sheet.getSheetName();
		}
		
	}
	
	/** Save the file -- currently fails if exists (add flag for overwrite??)
	 * TODO: This method needs error etc... handling and return if used (currently only used for debugging).
	 */
	public void saveExcelDoc(File fOut) {
		String errMsg = null;
		if (fOut.exists()) {
			errMsg = "File " + fOut.getAbsolutePath() + " exists, save cancelled";
		} else {
			FileOutputStream out = null;
			try {
				out = new FileOutputStream(fOut);
				workBook.write(out);
			}catch(Exception e){
				errMsg = "Error writing excel file " + fOut.getAbsolutePath() + ": " + e.getMessage();
				
			} finally {
				if (out != null) {	
					try {
						out.close();
					}catch(IOException ioEx){
						errMsg = "Error occurred when closing the excel file " + fOut.getAbsolutePath();  
						logger.log(Level.SEVERE, errMsg, ioEx);
					}
				}
			}
		}
		if (errMsg != null) {
			throw new RuntimeException(errMsg);
		}
	}
	
	/** Assuming this spreadsheet has formulas in it, update the input values with those specified
	 *  and update result values for all keys found in resultVals.
     *
	 *  ### DEVELOPER NOTE ### If the value is a Number/Date/etc.. pass the correct type (i.e.
	 *  not string).  If you pass a String val for a numeric field that is part of a formula the 
	 *  formula will not work.
	 *  
	 * @param inputVals values to set by accessorName
	 * @param resultVals keys initialized for vals to read, update vals before returning.
	 */
	public String processFormulaData(Map<String, Object> inputVals, Map<String, Object> resultVals) {
		StringBuffer errors = new StringBuffer();
		
		// First set values.
		for (String key : inputVals.keySet()) {
			Object val = inputVals.get(key);
			NameInfo ni = nameToCell.get(key);
			if (ni == null || ni.cell == null) {
				errors.append("Unable to set spreadsheet value for '" + key + "', cell not found by that name<br>");
			} else {
				if (val instanceof String) {
					logger.log(Level.WARNING, "Non-number being input into excel sheet for " + key + "=" + val);
					ni.cell.setCellValue((String)val);
				} else if (val instanceof BigInteger) {
					ni.cell.setCellValue(((BigInteger)val).doubleValue());
				} else if (val instanceof Boolean) {
					ni.cell.setCellValue((Boolean)val);
				} else if (val instanceof Date) {
					ni.cell.setCellValue((Date)val);
				} else if (val instanceof Number) {
					ni.cell.setCellValue(((Number)val).doubleValue());
				} else {
					errors.append("Unable to set spreadsheet value for '" + key + "', cell is unsupported type=" + val.getClass().toString() + "<br>");
				}
			}
		}
		
		String retrieveErrors = retrieveValues(resultVals);
		if (retrieveErrors != null) {
			errors.append(retrieveErrors);
		}
		if (errors.length() > 0) {
			return errors.toString();
		}
		return null;
	}
	
	/** Get requested in this spreadsheet by name
	 * 
	 * @param resultVals keys initialized for vals to read, vals updated before returning.
	 */
	public String retrieveValues(Map<String, Object> resultVals) {
		StringBuffer errors = new StringBuffer();
		
		FormulaEvaluator evaluator = null;
		if (workBook instanceof HSSFWorkbook) {
			evaluator = new HSSFFormulaEvaluator((HSSFWorkbook)workBook);
			// Evaluate all formulas cause it seems like a good idea...
			HSSFFormulaEvaluator.evaluateAllFormulaCells((HSSFWorkbook) workBook);
		} else {
			// TODO: bobc - haven't verified/tested all XSSF code..
			evaluator = new XSSFFormulaEvaluator((XSSFWorkbook)workBook);
			// Evaluate all formulas cause it seems like a good idea...
			XSSFFormulaEvaluator.evaluateAllFormulaCells((XSSFWorkbook) workBook);
		}
		
		for (String key : resultVals.keySet()) {
			NameInfo ni = nameToCell.get(key);
			if (ni == null || ni.cell == null) {
				errors.append("Unable to read spreadsheet value for '" + key + "', cell not found by that name<br>");
			} else {
				Object val;
				
				switch (ni.cell.getCellType ()) {
					case HSSFCell.CELL_TYPE_NUMERIC :
						val = "" + ni.cell.getNumericCellValue();
						break;
					
					case HSSFCell.CELL_TYPE_BLANK:
						val = "";
						break;
					
					case HSSFCell.CELL_TYPE_FORMULA :
						//System.out.println ("Formula is: " + ni.cell.getCellFormula());
						CellValue cellValue = evaluator.evaluate(ni.cell);
						if (cellValue.getErrorValue() != 0) {
							errors.append("Error evaluating value for " + key + "<br>");
							val = null;
						} else {
							val = cellValue.getNumberValue();
						}
						break;
					
					case HSSFCell.CELL_TYPE_STRING :
						// cell type string.
						val = ni.cell.getRichStringCellValue ();
						break;
					
					default :
						errors.append("Unable to read spreadsheet value for '" + key + "', cell is unsupported type<br>");
						val = "";	
						break;
				}
				resultVals.put(key, val);
			}
		}
		
		if (errors.length() > 0) {
			return errors.toString();
		}
		return null;
	}
	
	private static class NameInfo {
		private final String sheet;
		private final int col;
		private final int row;
		private Cell cell;
		
		private NameInfo(String sheet, int row, int col) {
			this.sheet = sheet;
			this.col = col;
			this.row = row;
		}
		
		public String toString() {
			return sheet + "!" + "[" + row + "," + col + "]";
		}
	}
	
	private Map<String, NameInfo> parseNames() {
		int nameCount = workBook.getNumberOfNames();
		Map<String, NameInfo>ret = new HashMap<String, NameInfo>(nameCount);

		// First build up our names to row/col
		for(int nameIndex=0; nameIndex<nameCount; nameIndex++) {
			Name name = workBook.getNameAt(nameIndex);
			try {
				String[] vals = name.getRefersToFormula().split("!");
				String sheet = vals[0];
				String [] rc = vals[1].split("\\$");
				int row = Integer.parseInt(rc[2].trim()) - 1; // 0 based
				String col = rc[1]; 
				byte[] cb = col.toUpperCase().getBytes(); // are excel cols case sensitive?? don't deal with AA yet..
				int icol = cb[0];	
				icol -= 65; // subtract from 'A'=65
				NameInfo ni = new NameInfo(sheet, row, icol);
				ret.put(name.getNameName(), ni);
			} catch (Exception e) {
				//logger.debug("Skipping named item " + name.getNameName() + ", unable to parse reference");
			}
		} 
	
		// Now find cells.
		
		// For now we just deal with one sheet (easy to add support, just to lazy to do it right now...)
		Sheet sheet = workBook.getSheetAt(0);
		Iterator<Row> rows = sheet.rowIterator();
		
		while (rows.hasNext ())	{
			Row row = rows.next();
			int iRow = row.getRowNum();

			// once get a row its time to iterate through cells.
			Iterator<Cell> cells = row.cellIterator();
	
			while (cells.hasNext ()) {
				Cell cell = cells.next();
				int iCol = cell.getColumnIndex();
				
				// see if have this one.
				for (NameInfo temp : ret.values()) {
					if (temp.col == iCol && temp.row == iRow) {
						temp.cell = cell;
					}
				}
			}
		}
		return ret;
	}

	
	/*
	private int getFirstDataRow(HSSFSheet workSheet) {
		//----------------------------------------------------------------------
		// Look for the header.
		int       firstDataRow  = NOT_FOUND;
		int       rowCount      = workSheet.getFirstRowNum();
		final int lastRowNumber = workSheet.getLastRowNum();

		outer:while (rowCount < lastRowNumber) {
			HSSFRow headerRow = workSheet.getRow(rowCount++);
			if (headerRow == null) {
				continue;
			}
			for (short columnNum = 0; columnNum < 100; columnNum++) {
				HSSFCell headerCell = headerRow.getCell(columnNum);

				if (headerCell == null) {
					continue;
				}
				String headerCellValue = headerCell.getStringCellValue();

				for(String headerName : headerNames){
					if(headerName.equalsIgnoreCase(headerCellValue)){
						firstDataRow = rowCount;
						break outer;
					}
				}
			}
		}

		if(firstDataRow == NOT_FOUND){
			throw new LxInvalidParameterException("Report Group Spreadsheet doesn't have Data Rows.");
		}
		return firstDataRow;
	}
	*/
	
	/** Set header columns for creating a sample workbook.
	 *  @param sheetName - name of desired sheet or null if use first sheet.
	 *  @param Note - note to put at top of sheet
	 *  @param reqdHeaderColumnNames - list of header column names that are required (marked red).
	 *  @param optionalHeaderColumnNames - list of header column names that are optional. 
	 * */
	public void setHeaderColumns(String sheetName, String Note, String[] reqdHeaderColumnNames, String[] optionalHeaderColumnNames) {
		
	}
			
	/* Get sheet by name
	 * @param sheetName - name of sheet or null for first sheet.
	 * @return Sheet if found, else null
	 */
	public ExcelSheet getSheet(String sheetName, boolean useFirstIfNotFound) {
		// use null as key for null val.
		String key = "" + sheetName;
		ExcelSheet ExcelSheet = nameToSheet.get(key);
		if (ExcelSheet == null) {
			Sheet sheet = null;
			if (workBook != null) {
				if (sheetName == null) {
					sheet = workBook.getSheetAt(0);
				} else {
					sheet = workBook.getSheet(sheetName);
					if (sheet == null && useFirstIfNotFound) {
						sheet = workBook.getSheetAt(0);
					}
				}
			}
			if (sheet != null) {
				ExcelSheet = new ExcelSheet(sheet);
				nameToSheet.put(key, ExcelSheet);
			}
		}
		return ExcelSheet;
	}
}
