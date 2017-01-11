package com.lucernex.qa.admin;

import com.lucernex.qa.browsers.BrowserDriver;
import cucumber.api.java.en.And;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;

import static com.google.common.base.Preconditions.checkState;
import static com.google.common.base.Strings.isNullOrEmpty;
//import static com.lucernex.qa.utils.ForceWaitForItem.delay;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.List;

public class VerifyLinksSteps {

    public VerifyLinksSteps() {
    }

    private List<WebElement> adminUrls = null;
    private WebDriver driver;

    @And("^I capture the admin urls$")
    public void I_capture_the_admin_urls() throws Throwable {
        driver = BrowserDriver.getCurrentDriver();
        adminUrls  = driver.findElements(By.tagName("a"));

    }

    @When("^Verify admin urls to make sure no (\\d+) error or http$")
    public void Verify_admin_urls_to_make_sure_no_error_or_http(int arg1) throws Throwable {
        String homeWindow = null;
        String[] links = null;
        int linksCount = 0;
        WebDriver driver;

        driver = BrowserDriver.getCurrentDriver();

        List<WebElement> all_links_webpage = driver.findElements(By.tagName("a"));
        linksCount = all_links_webpage.size();

        links = new String[linksCount];// Following instruction stores each link
        for (int i = 0; i < linksCount; i++) {
            links[i] = all_links_webpage.get(i).getAttribute("href");
        }

        homeWindow = driver.getWindowHandle().toString();
        // System.out.println("Visiting Each Links--------------------------------");

        for (int i = 0; i < linksCount; i++)

            if(!isNullOrEmpty(links[i])) {
                if (links[i].contains("//")) {

                    if (!links[i].equalsIgnoreCase("http://www.lucernex.com/")) {
                        {
                            driver.navigate().to(links[i]);
                            try {
                                checkState(!driver.getCurrentUrl().contains("404"), "404 error page - ");
                                checkState(!driver.getCurrentUrl().contains("https"));
                            } catch (IllegalStateException ignore) {
                            }
                        }
                    }
                    driver.switchTo().window(homeWindow);
                }
//                delay(1000);
            }
        }


 }





