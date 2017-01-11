package com.lucernex.qa.admin;

import com.lucernex.qa.browsers.BrowserFactory;
import com.lucernex.qa.utils.FileDownloader;
import com.lucernex.qa.views.admin.ManageDictionaryPageView;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

import java.io.File;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Logger;

import static com.google.common.base.Preconditions.checkNotNull;
import static junit.framework.Assert.assertNotNull;

/**
 * Created by sergeym on 4/27/2014.
 */
public class ManagerDictionarySteps {
    private static final Logger logger = Logger.getLogger(ManagerDictionarySteps.class.getName());

    private File downloadsDir = null;
    private File downloaded = null;
    // Existing files in the firefox download directory.
    private Set<File> existing = new HashSet<File>();


    @When("^I check Append Global Dictionary checkbox$")
    public void I_check_Append_Global_Dictionary_checkbox() throws Throwable {
        ManageDictionaryPageView.checkAppendGlobalCheckbox();

        String dir;

        try {
            dir = BrowserFactory.getBrowserDownloadsDir();
            checkNotNull(dir);
            downloadsDir = new File(dir);
        } catch (IOException e) {
            throw new IllegalStateException(e.getMessage());
        }
    }

    @And("^I click the Download Current Dictionary button$")
    public void I_click_the_Download_Current_Dictionary_button() throws Throwable {
//        File[] files = downloadsDir.listFiles();
//
//        if (files != null && files.length > 0) {
//            for (File f : files) {
//                existing.add(f);
//            }
//        }

//        ManageDictionaryPageView.clickDownloadButton();

        FileDownloader.fileDownloader("cssselector", "input[name='DownloadDictionary']");

    }

    @Then("^IWMS downloads current dictionary$")
    public void IWMS_downloads_current_dictionary() throws Throwable {
        File[] files = downloadsDir.listFiles();

        if (files != null) {
            for (File f : files) {
                if (!existing.contains(f)) {
                    downloaded = f;
                }
            }
        }
        logger.info("Downloaded dictionary file: " + downloaded);
        assertNotNull(downloaded);
    }
}
