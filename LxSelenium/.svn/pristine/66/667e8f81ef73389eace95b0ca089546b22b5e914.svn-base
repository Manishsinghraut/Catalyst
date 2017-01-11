package com.lucernex.qa.datatable;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Set;


public class DataTableModify implements DataTableModifyInterface {

    private Hashtable<String, Integer> tableDictionary1 = new Hashtable<String, Integer>();
    private Hashtable<String, Integer> tableDictionary2 = new Hashtable<String, Integer>();


    public DataTableModify() {

    }

    ;

    public void ModifyExcelSpreadSheetCellValue(String filename, String cellname, String newcellvalue) throws IOException {

        if (!cellname.isEmpty()) //only applied to entity type.
        {
            Hashtable<String, Integer> tmpHashMap = new Hashtable<String, Integer>();
            Cell setCell1 = null;
            Cell setCell2 = null;

            FileInputStream input_xlxs = new FileInputStream(filename);

            Workbook wb = new XSSFWorkbook(input_xlxs);

            Sheet mysheet = wb.getSheetAt(0);

            tmpHashMap = makeHeaderDictionary(mysheet, "importfilewithdata");

            //Assume there's always 2 rows of data in the import file
            setCell1 = mysheet.getRow((mysheet.getLastRowNum())).getCell(tmpHashMap.get(cellname));
            setCell2 = mysheet.getRow((mysheet.getLastRowNum()) - 1).getCell(tmpHashMap.get(cellname));

            setCell1.setCellValue(newcellvalue);
            setCell2.setCellValue(newcellvalue);
            //important to close InputStream
            input_xlxs.close();

            //Open FileOutputStream to write updates
            FileOutputStream output_file = new FileOutputStream(new File(filename));
            //write changes
            wb.write(output_file);
            //close the stream
            output_file.close();
        }

    }

    //public void setCellValue (Sheet curSheet,String colName){


    //	}

    public void equalMaps(String filename1, Hashtable<String, Integer> hashmap1, String filename2, Hashtable<String, Integer> hashmap2) {

	/*
		// Check if something is missing from mapB
		for(Map.Entry<String,Integer> entryMapA:hashmap1.entrySet())
		{
		    if(!hashmap2.containsKey(entryMapA.getKey()))
		        {
		            System.out.println(entryMapA.getKey() + " is missing");
		        }
		}

		// Check if something is new is in mapB
		for(Map.Entry<String,Integer> entryMapB: hashmap2.entrySet())
		{
		    if(! hashmap1.containsKey(entryMapB.getKey()))
		    {  
		        System.out.println(entryMapB.getKey() + " is new");
		    }
		}
	*/

        Set<String> keysA1 = new HashSet<String>(hashmap1.keySet());
        Set<String> keysA2 = new HashSet<String>(hashmap1.keySet());
        //Set<String>  keysB1 = new HashSet<String>(hashmap2.keySet());
        Set<String> keysB = new HashSet<String>(hashmap2.keySet());


        keysA1.removeAll(keysB);
        keysB.removeAll(keysA2);

        if (!keysB.isEmpty() || !keysA1.isEmpty()) {
            assertTrue(keysB.isEmpty());
            System.out.println("New in:" + filename1 + " ->: " + keysB);
            System.out.println("Missing in: " + filename2 + " ->: " + keysA1);
        }
        if (keysB.isEmpty() && keysA1.isEmpty())
            System.out.println("Compareed - Template is identical" + keysB);

        System.out.println("--------------------------------------");
    }


    private void assertTrue(boolean empty) {
        // TODO Auto-generated method stub

    }

    public void VerifyXlxsfiles(String filename1, String filename2) throws IOException, InvalidFormatException {

        FileInputStream input_xlxs1 = new FileInputStream(filename1);
        FileInputStream input_xlxs2 = new FileInputStream(filename2);

        // convert it into a POI object
        XSSFWorkbook my_xlsx_workbook1 = new XSSFWorkbook(input_xlxs1);
        XSSFWorkbook my_xlsx_workbook2 = new XSSFWorkbook(input_xlxs2);

        tableDictionary1 = makeHeaderDictionary(my_xlsx_workbook1.getSheetAt(0), "");
        tableDictionary2 = makeHeaderDictionary(my_xlsx_workbook2.getSheetAt(0), "");

        equalMaps(filename1, tableDictionary1, filename1, tableDictionary2);

    }

    public Hashtable<String, Integer> makeHeaderDictionary(Sheet spreadSheet, String fileType) {
        Row colHeader;

        Hashtable<String, Integer> retHashMap = new Hashtable<String, Integer>();

        if (fileType.isEmpty())
            colHeader = spreadSheet.getRow(spreadSheet.getLastRowNum());//read the title row of Template (no data) last row -1
        else
            colHeader = spreadSheet.getRow(spreadSheet.getLastRowNum() - 2);//read the title row of import file= last row -2

        Iterator<Cell> cellIT = colHeader.cellIterator();

        while (cellIT.hasNext()) {
            Cell myCell = cellIT.next();
            myCell.setCellType(1);//set to string format
            //System.out.println(myCell.getStringCellValue());
            retHashMap.put(myCell.getStringCellValue(), myCell.getColumnIndex());
        }

        return retHashMap;
    }


}// end of class
