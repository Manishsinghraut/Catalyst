package com.lucernex.qa.utils;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.*;
import java.net.URISyntaxException;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Set;

import static com.lucernex.qa.FileUtilities.getCWD;
import static com.lucernex.qa.utils.ForceWaitForItem.delay;
import static org.junit.Assert.assertTrue;

public class FileUtils {


    private static Hashtable<String, Integer> tableDictionary1 = new Hashtable<String, Integer>();
    private static Hashtable<String, Integer> tableDictionary2 = new Hashtable<String, Integer>();


    public static File getFile(String filename) throws URISyntaxException {
        File file = new File(filename);
        if (!file.exists()){
        	file = new File(FileUtils.class.getClassLoader().getResource(filename).toURI());
        }
        return (file != null && file.exists() ? file : null);
    }


    public static String getImportDataFilesDir() throws IOException {
        File dataDir = new File(getCWD(), "ImportDataFiles");

        if (!dataDir.exists()) {
            String msg = String.format("Required directory '%s' not found!", dataDir.getAbsolutePath());

            throw new IllegalStateException(msg);
        }

        return (new File(dataDir, "ImportDataFiles")).getCanonicalPath();
    }


    /*
     * Copy to new file to different location and delete the original file
     *
   */
    public static void copyFile(File fromFileInfo,String toFileInfo) throws FileNotFoundException, IOException
    {
        FileInputStream  input  = null;
        FileOutputStream output = null;
        try  {
            output = new FileOutputStream( toFileInfo );		// open this first, in case we don't have write permissions
            input =  new FileInputStream( fromFileInfo );

            final int NO_OFFSET = 0;
            int       length;
            byte[]    buffer = new byte[10240];
            while ((length = input.read(buffer)) != -1) {
                output.write(buffer, NO_OFFSET, length);
            }

        } finally {
            if (input != null) {
                input.close();
            }
            if (output != null)  {
                output.flush();
                output.getFD().sync();
                output.close();

            }

        }

    }
    //rename and move template download files to new location with prop name
    public static void renameMoveTemplateFile(File fromFile,String toFile) throws FileNotFoundException, IOException, InterruptedException {

        //createDirectory(toFile);
        deleteFile(toFile); //delete old file
        moveFile(fromFile,toFile);
        delay(4 * 1000);//wait to copy over
    }


    // Folder locaion One: here new templae download
    //Folder location Two: where store template base line
    //compare one file at time
    public static void compareTwoTemplateFolder (String folder1, String folder2) throws IOException, InvalidFormatException {

        for (File file : listFiles(folder1)) {

            if (file.isFile()) {
                System.out.println(file.getAbsolutePath() + "---> comparing");
                VerifyXlxsfiles(folder1 + "\\" + file.getName(), folder2 + "\\" + file.getName());

            }
        }


    }
    public static void moveFile(File fromFile,String toFile) throws FileNotFoundException, IOException {

        try{

            File toFileName   = new File(toFile);
            fromFile.renameTo(toFileName);

        }catch(Exception e){
            e.printStackTrace();
        }
    }


    public static void deleteFile(String deleteFileName) throws FileNotFoundException, IOException {
        File deleteFile = new File(deleteFileName);

        deleteFileName = deleteFile.getPath();

        if (deleteFile.isDirectory()) {
            throw new IOException(
                    "File delete of directory \"" + deleteFileName + "\" failed.");
        }

        if (deleteFile.exists()) {
            deleteFile.delete();
        }
    }


    public static void createDirectory(String createDirectoryName) {

        File dir = new File(createDirectoryName);
        if (!dir.exists())
            dir.mkdir();
    }

    public static void deleteDirectory(String deleteDirectoryName) throws FileNotFoundException, IOException {
        File deleteDirectory = new File(deleteDirectoryName);
        deleteDirectory.delete();

    }

    public static File[] listFiles(String directoryName) {

        File directory = new File(directoryName);

        File[] fList = directory.listFiles();

        return fList;

    }


    public static void equalMaps(String filename1, Hashtable<String, Integer> hashmap1, String filename2, Hashtable<String, Integer> hashmap2) {

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
            System.out.println("Compared - Template is identical" + keysB);

        System.out.println("--------------------------------------");
    }

    public static void VerifyXlxsfiles(String filename1, String filename2) throws IOException, InvalidFormatException {

            FileInputStream input_xlxs1 = new FileInputStream(filename1);
            FileInputStream input_xlxs2 = new FileInputStream(filename2);

            // convert it into a POI object
            XSSFWorkbook my_xlsx_workbook1 = new XSSFWorkbook(input_xlxs1);
            XSSFWorkbook my_xlsx_workbook2 = new XSSFWorkbook(input_xlxs2);


            tableDictionary1 = makeHeaderDictionary(my_xlsx_workbook1.getSheetAt(0), "");
            tableDictionary2 = makeHeaderDictionary(my_xlsx_workbook2.getSheetAt(0), "");

            equalMaps(filename1, tableDictionary1, filename1, tableDictionary2);
    }


    public static Hashtable<String, Integer> makeHeaderDictionary(Sheet spreadSheet, String fileType) {
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

    public static String readFileContent(String strFilePath){
        String content = "";
        try {
            BufferedReader in = new BufferedReader(new FileReader(strFilePath));
            String str;
            while ((str = in.readLine()) != null) {
                content +=str;
            }
            in.close();
        } catch (IOException e) {
        }
        return content;
    }

}
