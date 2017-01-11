package com.lucernex.qa.utils;

import com.google.common.collect.Iterables;
import com.google.common.io.Files;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import junit.framework.Assert;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.openqa.selenium.*;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import static org.eclipse.persistence.jpa.jpql.Assert.fail;
import static org.junit.Assert.assertNotNull;

public class EmailVerification {

    //public static String mainWindowHandle;
    public static Set<String> emailWindow;
    public static String emailWindowHandle;
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    private static class BrowserCleanup implements Runnable {
        private WebDriver driver;

        public BrowserCleanup(WebDriver driver) {
            this.driver = driver;
        }

        public void run() {
            try {
                for (int i = emailWindow.toArray().length; i > 1; i--) {
                    try {
                        driver.switchTo().window(emailWindow.toArray()[i].toString());
                        driver.close();
                    } catch (Exception e) {
                    }
                }
                driver.switchTo().window(BaseView.mainWindowHandle);
            } catch (Exception e) {
                BaseView.takeScreenshot("BrowserNotFound.png");
            }
        }
    }

    public static void openNewWindow() {
          /*WebDriver driver = BrowserFactory.createBrowser(getBrowserType());
            Runtime.getRuntime().addShutdownHook(new Thread(new BrowserCleanup(driver)));
            return driver;*/
        /*((JavascriptExecutor) BrowserDriver.getCurrentDriver()).executeScript("window.open();");*/
        BrowserDriver.getCurrentDriver().findElement(By.xpath("//body")).sendKeys(Keys.CONTROL + "n");
    }

    private static final ThreadLocal<WebDriver> driver = new ThreadLocal<WebDriver>() {
        protected WebDriver initialValue() {

            //Opening a new window from same driver session
            Set<String> mainWindow = BrowserDriver.getCurrentDriver().getWindowHandles();
            BaseView.mainWindowHandle = ((String) mainWindow.toArray()[0]);
            openNewWindow();
            emailWindow = BrowserDriver.getCurrentDriver().getWindowHandles();
            if (emailWindow.toArray().length > 1) {
                emailWindowHandle = ((String) emailWindow.toArray()[1]);
                BaseView.mainWindowHandle = ((String) emailWindow.toArray()[0]);
                BrowserDriver.getCurrentDriver().switchTo().window(emailWindowHandle);
            } else {
                System.out.println("No new window is opened from existing session");
                fail("No new window is opened from existing session");
            }
            Runtime.getRuntime().addShutdownHook(new Thread(new BrowserCleanup(BrowserDriver.getCurrentDriver())));
            return BrowserDriver.getCurrentDriver().switchTo().window(emailWindowHandle);
        }
    };

    private static final ThreadLocal<WebDriver> driverSameWindow = new ThreadLocal<WebDriver>() {
        protected WebDriver initialValue() {
            Set<String> mainWindow = BrowserDriver.getCurrentDriver().getWindowHandles();
            BaseView.mainWindowHandle = ((String) mainWindow.toArray()[0]);
            Runtime.getRuntime().addShutdownHook(new Thread(new BrowserCleanup(BrowserDriver.getCurrentDriver())));
            return BrowserDriver.getCurrentDriver().switchTo().window(BaseView.mainWindowHandle);
        }
    };

    public static void launchBrowser() {
        driver.get().manage().timeouts().implicitlyWait(2, TimeUnit.MINUTES);
        driver.get().manage().window().maximize();
//        driver.get().get("https://login.microsoftonline.com");
        driver.get().get("https://outlook.office.com/owa/?");
    }

    public static void launchBrowserOnExistingWindow() {
        driverSameWindow.get().get("https://login.microsoftonline.com");
    }

    public static void login(String username, String password) {

        try {
            int count = 0;
            BrowserDriver.getCurrentDriver().findElement(By.id("cred_userid_inputtext")).sendKeys(username);
            BrowserDriver.getCurrentDriver().findElement(By.id("cred_password_inputtext")).sendKeys(password);
            do {
                count++;
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 30);
                wait.until(ExpectedConditions.elementToBeClickable(BrowserDriver.getCurrentDriver().findElement(By.id("cred_sign_in_button"))));
                BaseView.pushShortTimeout();
                //Still checking stability that is why added sleep
                Thread.sleep(5000);
                BrowserDriver.getCurrentDriver().findElement(By.id("cred_sign_in_button")).click();
            }
            while (BrowserDriver.getCurrentDriver().findElements(By.id("cred_sign_in_button")).size() > 0 && count < 5);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to click sign in button.png");
            fail("Unable to click sign in button " + e.getMessage());
        } finally {
            BaseView.popDefaultTimeout();
        }
    }

    public static void searchMail(String subject) {

        if (subject.contains("[CURRENT DATE]")) {
            subject = subject.replace("[CURRENT DATE]", SeleniumUtil.addDaystoCurrentDate(0));
        }

        if (BrowserDriver.getCurrentDriver().findElements(By.id("ShellMail_link_text")).size() > 0) {
//            BrowserDriver.getCurrentDriver().findElement(By.id("ShellMail_link_text")).click();
            try {
                SeleniumUtil.click("id", "ShellMail_link_text", SeleniumUtilities.OBJWAITTIMEOUT);
            }catch (Exception e){
            }

            //BaseView.switchToSecondWindow();
            BaseView.switchToFirstWindowToClose();
            BaseView.switchToFirstWindow();
        }

        openMailAndVerifyTheContents(subject);
    }

    public static void verifyMail(List<String> emailBody) {
        for (String text : emailBody) {
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 30);
            try {
                wait.until(ExpectedConditions.textToBePresentInElementLocated(By.cssSelector(".allowTextSelection.scrollContainer"), text));
            } catch (Exception e) {
                takeScreenshot("Unable to find mail body.png");
                fail("Unable to find a mail with body contains text: " + text);
            }
        }
    }

    public static void clickLink() {
        try {
            BrowserDriver.getCurrentDriver().findElement(By.cssSelector(".allowTextSelection.scrollContainer a[href^='https:']")).click();
        } catch (Exception e) {
            takeScreenshot("Unable to click link in the mail body.png");
            fail("Unable to click link in the mail body: ");
        }
    }

    public static void launchAndLoginToApplication(String username, String password) {
        launchBrowser();
        login(username, password);
    }

    public static void launchAndLoginToApplication() {
        launchBrowser();
        login();
    }

    public static void launchAndLoginToApplicationOnExistingWindow() {
        launchBrowserOnExistingWindow();
        login();
    }


    public static void takeScreenshot(File imageFile) throws IOException {
        TakesScreenshot ts = (TakesScreenshot) BrowserDriver.getCurrentDriver();
        File src = ts.getScreenshotAs(OutputType.FILE);
        Files.copy(src, imageFile);
    }

    public static void takeScreenshot(String filename) {
        File dir = new File("target/screenshots");
        dir.mkdirs();
        SimpleDateFormat sdf = new SimpleDateFormat("ddMMyyyy_hhmmss");
        Date curDate = new Date();
        String strDate = sdf.format(curDate);
        filename = filename.replace(".png", "");
        filename = filename + strDate + ".png";

        File file = new File(dir, filename);

        try {
            takeScreenshot(file);
            System.out.format("Wrote screen shot to '%s'", file.getAbsolutePath());
        } catch (IOException e) {
            System.out.format("Unable to write screen shot to '%s': %s", file.getAbsolutePath(), e.getMessage());
        }
    }

    public static void switchToSecondWindow() {
        for (int i = 0; i < 1000; i++) {
            if (BrowserDriver.getCurrentDriver().getWindowHandles().size() > 0) {
                break;
            }
        }

        Set<String> windowHandles = BrowserDriver.getCurrentDriver().getWindowHandles();
        if (CollectionUtils.isNotEmpty(windowHandles)) {
            BaseView.mainWindowHandle = Iterables.get(windowHandles, 0, null);
            String secondWindowHandle = Iterables.get(windowHandles, 2, null);

            if (StringUtils.isNotEmpty(secondWindowHandle)) {
                BrowserDriver.getCurrentDriver().switchTo().window(secondWindowHandle);
            } else {
                System.out.println("There is no second browser window found");
            }
        }
    }

    public static void closeLucernexWindow() {
        for (int i = 0; i < 1000; i++) {
            if (BrowserDriver.getCurrentDriver().getWindowHandles().size() > 0) {
                break;
            }
        }
        Set<String> windowHandles = BrowserDriver.getCurrentDriver().getWindowHandles();
        if (CollectionUtils.isNotEmpty(windowHandles)) {
            BaseView.mainWindowHandle = Iterables.get(windowHandles, 0, null);
            String secondWindowHandle = Iterables.get(windowHandles, 2, null);

            if (StringUtils.isNotEmpty(secondWindowHandle)) {
                BrowserDriver.getCurrentDriver().switchTo().window(secondWindowHandle);
            } else {
                System.out.println("There is no second browser window found");
            }
        }
        BrowserDriver.getCurrentDriver().close();
    }

    public static void closeMailWindow() {
        for (int i = 0; i < 1000; i++) {
            if (BrowserDriver.getCurrentDriver().getWindowHandles().size() > 0) {
                break;
            }
        }
        Set<String> windowHandles = BrowserDriver.getCurrentDriver().getWindowHandles();
        if (CollectionUtils.isNotEmpty(windowHandles)) {
            BaseView.mainWindowHandle = Iterables.get(windowHandles, 0, null);
            String secondWindowHandle = Iterables.get(windowHandles, 1, null);

            if (StringUtils.isNotEmpty(secondWindowHandle)) {
                BrowserDriver.getCurrentDriver().switchTo().window(secondWindowHandle);
            } else {
                System.out.println("There is no second browser window found");
            }
        }
        BrowserDriver.getCurrentDriver().close();
    }

    public static void loginPage() {
        WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 30);
        try {
            wait.until(ExpectedConditions.titleIs("Lucernex IWMS"));
            wait.until(ExpectedConditions.presenceOfElementLocated(By.name("authLoginName")));
            wait.until(ExpectedConditions.presenceOfElementLocated(By.name("authLoginFirmName")));
        } catch (Exception e) {
            takeScreenshot("Link is not redirected to application.png");
            fail("Error info : Link is not redirected to application " + e.getMessage());
        }
    }

    public static void openMailAndVerifyTheContents(String subject) {
        WebElement expectedMail = null;
        List<WebElement> mails = BrowserDriver.getCurrentDriver().findElements(By.cssSelector(".lvHighlightAllClass.lvHighlightSubjectClass"));
        assertNotNull("Unread Mails are not present in the inbox", mails);
        for (WebElement mail : mails) {
            if (mail.getText().contains(subject)) {
                expectedMail = mail;
                break;
            }
        }
        assertNotNull("Expected mail is not received", expectedMail);
        try {
            int count = 0;
            do {
                count++;
                BaseView.pushShortTimeout();
                try {
                    expectedMail.click();
                    expectedMail.click();
                } catch (Exception e) {
                }

                //SeleniumUtil.click("cssselector","*[title='Delete (Del)']",2);
            }
            while (!(BrowserDriver.getCurrentDriver().findElements(By.cssSelector(".allowTextSelection.scrollContainer")).size() > 0) && count < 5);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to open mail.png");
            fail("Unable to open mail " + subject + e.getMessage());
        } finally {
            BaseView.popDefaultTimeout();
        }
    }

    public static void verifyAttachment(String name, String type) {
        WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 10);
        try {
            wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("div[aria-label*='1 attachment'] span[title*='." + type + "'][title*='" + name + "']")));
        } catch (Exception e) {
            takeScreenshot("Link is not redirected to application.png");
            fail("Error info : Link is not redirected to application " + e.getMessage());
        }
    }

    public static void login() {

        try {
            int count = 0;
            try {
                BrowserDriver.getCurrentDriver().findElement(By.id("cred_userid_inputtext")).sendKeys("svcQA@lucernex.com");
                BrowserDriver.getCurrentDriver().findElement(By.id("cred_password_inputtext")).sendKeys("Zsb5lFs0u");
            } catch (Exception e) {
            }
            do {
                count++;
                WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 30);
                wait.until(ExpectedConditions.elementToBeClickable(BrowserDriver.getCurrentDriver().findElement(By.id("cred_sign_in_button"))));
                BaseView.pushShortTimeout();
                //Still checking stability that is why added sleep
                Thread.sleep(5000);
                BrowserDriver.getCurrentDriver().findElement(By.id("cred_sign_in_button")).click();
            } while (BrowserDriver.getCurrentDriver().findElements(By.id("cred_sign_in_button")).size() > 0 && count < 5);
        } catch (Exception e) {
            BaseView.takeScreenshot("Unable to click sign in button.png");
            //fail("Unable to click sign in button " + e.getMessage());
        } finally {
            BaseView.popDefaultTimeout();
        }
    }

    public static void launchLatestDownloadedFile() throws Throwable {
        BrowserDriver.getCurrentDriver().manage().timeouts().implicitlyWait(2, TimeUnit.MINUTES);
        BrowserDriver.getCurrentDriver().manage().window().maximize();
        BrowserDriver.getCurrentDriver().get(System.getProperty("user.dir") + "\\target\\DownloadFiles\\" + CommonMethods.getLatestDownloadedFile());
        SeleniumUtil.handleUnexpectedAlerts();
    }

    public static void closelaunchLatestDownloadedFile() throws Throwable {
        BrowserDriver.getCurrentDriver().close();
    }

    public static void verifyBodySubject(String subject) throws Throwable {
        if (!SeleniumUtil.waitForElementContainText("cssselector", ".rpHighlightAllClass.rpHighlightSubjectClass", subject)) {
            fail("Error: expected subject not present" + "expected " + subject + ": Actual" +
                    AllContractPagesView.getTextAndByPassException(SeleniumUtil.getElement("cssselector", ".rpHighlightAllClass.rpHighlightSubjectClass", 1)));
        }
    }
}


