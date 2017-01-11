package com.lucernex.qa;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.browsers.BrowserFactory;
import com.lucernex.qa.data.TemplateType;
import com.lucernex.qa.iwms.ImportClient;
import com.lucernex.qa.iwms.domain.ImportDataResults;
import com.lucernex.qa.utils.FileUtils;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.admin.ImportDataPageView;
import com.lucernex.qa.views.admin.SpreadsheetsPageView;

import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import junit.framework.Assert;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.io.File;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

import static com.google.common.base.Preconditions.checkArgument;
import static com.google.common.base.Preconditions.checkNotNull;
//import static com.lucernex.qa.utils.ForceWaitForItem.delay;
import static junit.framework.Assert.fail;
import static org.junit.Assert.assertTrue;

public class TemplateSteps {
    private static final Logger logger = Logger.getLogger(TemplateSteps.class.getName());

    private File downloadsDir = null;
    private TemplateType templateType = null;
    private File downloaded = null;
    private String dataFolder = null;
    private String dataFolderForExportConfig = null;

    @When("^I enter \"([^\"]*)\" into the template selector$")
    public void I_enter_into_the_template_selector(String template) throws Throwable {
        checkArgument(template != null, "Required argument 'template' is null!");

        templateType = TemplateType.fromString(template);

        SpreadsheetsPageView.chooseTemplate(templateType);

        String dir;

        try {
            dir = BrowserFactory.getBrowserDownloadsDir();
            checkNotNull(dir);
            downloadsDir = new File(dir);
        } catch (IOException e) {
            throw new IllegalStateException(e.getMessage());
        }
    }

    // Existing files in the firefox download directory.
    private Set<File> existing = new HashSet<File>();

    @And("^I click the download button$")
    public void I_click_the_download_button() throws Throwable {
        File[] files = downloadsDir.listFiles();

        if (files != null && files.length > 0) {
            for (File f : files) {
                existing.add(f);
            }
        }

        SpreadsheetsPageView.clickDownloadButton();
    }

    @Then("^IWMS downloads the specified spreadsheet template$")
    public void IWMS_downloads_the_specified_spreadsheet_template() throws Throwable {
        File[] files = downloadsDir.listFiles();
       // File downloaded = null;

        for (File f : files) {
            if (!existing.contains(f)) {
                downloaded = f;
            }
        }

        logger.info("Downloaded spreadsheet file: " + downloaded);
    }



    @When("^I download all templates to user location download location \"([^\"]*)\"$")
    public void I_download_all_templates_to_user_location_download_location(String templateFolderLocation) throws Throwable {
        //contractTemplatedownload (templateFolderLocation);
        getTemplateListThenDownload(templateFolderLocation);


         }

    public void selectContractTemplateList(String template) {
        templateType = TemplateType.fromString(template);
        SpreadsheetsPageView.clickContractList(templateType);

    }

    public void contractTemplatedownload (String tempFolder) throws Throwable {
        String savedFileType =".xlsx";


        WebElement contlist = BrowserDriver.getCurrentDriver().findElement(By.name("contractList"));
        List<WebElement> cl = contlist.findElements(By.tagName("option"));


        for(WebElement eleContract: cl) {
           System.out.println("contract template: "+eleContract.getText());

          // selectContractTemplateList(eleContract.getText());
//            delay(3000);
        }



    }

    public void getTemplateListThenDownload(String tempFolder) throws Throwable {
      //  boolean flag = false;
        String savedFileType = "";
        String  locationSaved ="";
        String tmp = null;


        FileUtils.createDirectory(tempFolder); //create if not exist

        WebElement sel = BrowserDriver.getCurrentDriver().findElement(By.name("handlerType"));
        List<WebElement> lists = sel.findElements(By.tagName("Option"));

        //System.out.println(element.getText());

        for (WebElement element : lists) {
            tmp = element.getText();

            System.out.println(tmp);
            I_enter_into_the_template_selector(tmp);

            if (tmp.equalsIgnoreCase("Contract Data")) {
               contractTemplatedownload(tempFolder + "\\" + tmp + savedFileType);//this function just for testing no down load or
            }
            else {
                savedFileType = tmp.equalsIgnoreCase("Check Payments")? ".xls": ".xlsx";

                SpreadsheetsPageView.clickDownloadButton();

                IWMS_downloads_the_specified_spreadsheet_template();

                locationSaved = tempFolder + "\\" + tmp + savedFileType;

                FileUtils.renameMoveTemplateFile(downloaded, locationSaved);
            }
        }


    }

    @Then("^I compare each file from \"([^\"]*)\" to baseline template folders \"([^\"]*)\"$")
    public void I_compare_each_file_from_to_baseline_template_folders(String templateFolderLoc, String baseLineTemplateLoc) throws Throwable {

        FileUtils.compareTwoTemplateFolder(templateFolderLoc,baseLineTemplateLoc);

    }

    @And("^I import following file name:$")
    public void I_import_following_file_name(List<String> files) throws Throwable {
        try {
            File dir = new File(FileUtilities.getCWD(), dataFolder);

            assertTrue(String.format("Specified directory '%s' not found", dir.getAbsolutePath()), dir.exists());

            for (String fileName : files) {
                logger.info("Importing " + fileName);

                File file = new File(dir, fileName);

                assertTrue(String.format("Specified file [%s] not found", file.getAbsolutePath()), file.exists());

                ImportDataResults results = ImportClient.importFile(file, false);
                if (results == null) {
                    fail("ImportClient.importFile() returned null results!");
                } else if (results.getErrors() != null && !results.getErrors().isEmpty()) {
                    StringBuilder msg = new StringBuilder();

                    msg.append("Import errors for file '");
                    msg.append(fileName);
                    msg.append("':\n");

                    for (String errorMsg : results.getErrors()) {
                        msg.append("\n");
                        msg.append(errorMsg);
                    }

                    logger.severe(msg.toString());
                    logger.info(msg.toString());
//                    fail("Import failed:\n" + msg.toString());
                }
            }
        } catch(Exception e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
            fail("File import failed");
        }
    }

    @When("^I used data files from \"([^\"]*)\"$")
    public void I_used_data_files_from(String dataDir) throws Throwable {

        dataFolder = dataDir;
    }

    @When("^I used data files from \"([^\"]*)\" for export configuration$")
    public void I_used_data_files_for_export_configuration(String dataDir) throws Throwable {
        dataFolder = getPathOfDirectory(dataDir);
    }

    public String getPathOfDirectory(String path) {
        logger.info(System.getProperty("user.dir"));
        String pathBuilding = System.getProperty("user.dir").replaceAll("ImportConfiguration","");
        pathBuilding = pathBuilding+path;
        logger.info(pathBuilding);
        return pathBuilding;
    }

    @And("^I Import the downloaded report \"([^\"]*)\"$")
    public void I_Import_the_downloaded_report(String arg1) throws Throwable {
        try {
            File dir = new File(FileUtilities.getCWD(), dataFolder);

            File file=FileUtilities.getTheNewestFile(dir, "xml");

            assertTrue(String.format("Specified directory '%s' not found", dir.getAbsolutePath()), dir.exists());

//            for (String fileName : files) {
//                logger.info("Importing " + fileName);
//
//                File file = new File(dir, fileName);

            assertTrue(String.format("Specified file [%s] not found", file.getAbsolutePath()), file.exists());

            ImportDataResults results = ImportClient.importFile(file, false);

            if (results == null) {
                fail("ImportClient.importFile() returned null results!");
            } else if (results.getErrors() != null && !results.getErrors().isEmpty()) {
                StringBuilder msg = new StringBuilder();

                msg.append("Import errors for file '");
                msg.append(file.getName());
                msg.append("':\n");

                for (String errorMsg : results.getErrors()) {
                    msg.append("\n");
                    msg.append(errorMsg);
                }

                logger.severe(msg.toString());
                logger.info(msg.toString());
//                    fail("Import failed:\n" + msg.toString());
            }
//            }
        } catch(Exception e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
            fail("File import failed");
        }
    }

    @And("^I import following file with continue option name:$")
    public void I_import_following_file_with_continue_option_name(List<String> files) throws Throwable {
        File dataDir = new File(FileUtilities.getCWD(), dataFolder);

        assertTrue(String.format("Specified directory '%s' not found", dataDir.getAbsolutePath()), dataDir.exists());

        for (String f : files) {
            File file = new File(dataDir, f);

            assertTrue(String.format("Specified file '%s' not found", file.getAbsolutePath()), file.exists());
            ImportDataPageView.clickContinueTillEndButton();
            ImportDataPageView.importOneFiles(file.getAbsolutePath());
        }
    }

    @And("^I import following files:$")
    public void I_import_following_files(List<String> files){
        try {
            File dir = new File(FileUtilities.getCWD(), dataFolder);

            assertTrue(String.format("Specified directory '%s' not found", dir.getAbsolutePath()), dir.exists());

            for (String fileName : files) {
                // Keep WebDriver session alive.
                BrowserDriver.getCurrentDriver().navigate().refresh();

                logger.info("Importing " + fileName);

                File file = new File(dir, fileName);

                assertTrue(String.format("Specified file [%s] not found", file.getAbsolutePath()), file.exists());

                ImportDataResults results = ImportClient.importFile(file, false);

                if (results == null) {
                    fail("ImportClient.importFile() returned null results!");
                } else if (results.getErrors() != null && !results.getErrors().isEmpty()) {
                    StringBuilder msg = new StringBuilder();

                    msg.append("Import errors for file '");
                    msg.append(fileName);
                    msg.append("':\n");

                    for (String errorMsg : results.getErrors()) {
                        msg.append("\n");
                        msg.append(errorMsg);
                    }

                    logger.severe(msg.toString());

                    fail("Import failed:\n" + msg.toString());
                }
            }
        } catch(Exception e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
            fail("File import failed");
        }
    }

    @And("^I import following file name and stop on first error:$")
    public void I_import_following_file_name_and_stop_on_first_error(List<String> files) throws Throwable {
        try {
            File dir = new File(FileUtilities.getCWD(), dataFolder);

            assertTrue(String.format("Specified directory '%s' not found", dir.getAbsolutePath()), dir.exists());

            for (String fileName : files) {
                logger.info("Importing " + fileName);

                File file = new File(dir, fileName);

                assertTrue(String.format("Specified file [%s] not found", file.getAbsolutePath()), file.exists());

                ImportDataResults results = ImportClient.importFile(file, true);
                if (results == null) {
                    fail("ImportClient.importFile() returned null results!");
                } else if (results.getErrors() != null && !results.getErrors().isEmpty()) {
                    StringBuilder msg = new StringBuilder();

                    msg.append("Import errors for file '");
                    msg.append(fileName);
                    msg.append("':\n");

                    for (String errorMsg : results.getErrors()) {
                        msg.append("\n");
                        msg.append(errorMsg);
                    }

                    logger.severe(msg.toString());
                    logger.info(msg.toString());
                }
            }
        } catch(Exception e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
            fail("File import failed");
        }
    }

    @And("^I import following file and returns error message \"([^\"]*)\":$")
    public void I_import_following_file_and_returns_error_message_(String strErrorMessage,List<String> files) throws Throwable {
        try {
            File dir = new File(FileUtilities.getCWD(), dataFolder);

            assertTrue(String.format("Specified directory '%s' not found", dir.getAbsolutePath()), dir.exists());

            for (String fileName : files) {
                logger.info("Importing " + fileName);

                File file = new File(dir, fileName);

                assertTrue(String.format("Specified file [%s] not found", file.getAbsolutePath()), file.exists());

                ImportDataResults results = ImportClient.importFile(file, true);
                Assert.assertTrue(results.getErrors().get(0).contains(strErrorMessage));
                logger.info(results.getErrors().get(0));

//                if (results == null) {
//                    fail("ImportClient.importFile() returned null results!");
//                } else if (results.getErrors() != null && !results.getErrors().isEmpty()) {
//                    StringBuilder msg = new StringBuilder();
//
//                    msg.append("Import errors for file '");
//                    msg.append(fileName);
//                    msg.append("':\n");
//
//                    for (String errorMsg : results.getErrors()) {
//                        msg.append("\n");
//                        msg.append(errorMsg);
//                    }
//
//                    logger.severe(msg.toString());
//                    logger.info(msg.toString());
//                }
            }
        } catch(Exception e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
            fail("File import failed");
        }
    }


    @And("^I import the following files:$")
    public void I_import_the_following_files(List<String> files){
        try {
            File dir = new File(dataFolder);
            assertTrue(String.format("Specified directory '%s' not found", dir.getAbsolutePath()), dir.exists());

            for (String fileName : files) {
                // Keep WebDriver session alive.
                BrowserDriver.getCurrentDriver().navigate().refresh();

                logger.info("Importing " + fileName);

                File file = new File(dir, fileName);

                assertTrue(String.format("Specified file [%s] not found", file.getAbsolutePath()), file.exists());

                ImportDataResults results = ImportClient.importFile(file, false);

                if (results == null) {
                    fail("ImportClient.importFile() returned null results!");
                } else if (results.getErrors() != null && !results.getErrors().isEmpty()) {
                    StringBuilder msg = new StringBuilder();

                    msg.append("Import errors for file '");
                    msg.append(fileName);
                    msg.append("':\n");

                    for (String errorMsg : results.getErrors()) {
                        msg.append("\n");
                        msg.append(errorMsg);
                    }

                    logger.severe(msg.toString());

//                    fail("Import failed:\n" + msg.toString());
                }
            }
        } catch(Exception e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
            fail("File import failed");
        }
    }

}
