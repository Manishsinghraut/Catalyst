package com.lucernex.qa.datamart;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.google.common.base.Strings.isNullOrEmpty;

/**
 * Represents a grid paginator.
 */
public class Paginator {
    private WebElement firstPageBtn;
    private WebElement prevPageBtn;
    private WebElement nextPageBtn;
    private WebElement lastPageBtn;
    private WebElement refreshBtn;
    private WebElement currentPageFld;
    private WebElement displayingLbl;

    public void clickFirstPageButton() {
        firstPageBtn.click();
    }

    public void clickPreviousPageButton() {
        prevPageBtn.click();
    }

    public void clickNextPageButton() {
        nextPageBtn.click();
    }

    public void clickLastPageButton() {
        lastPageBtn.click();
    }

    public void clickRefreshButton() {
        refreshBtn.click();
    }

    public String getCurrentPage() {
        return currentPageFld.getText();
    }

    public void setCurrentPage(int page) {
        currentPageFld.sendKeys(Integer.toString(page));
    }

    /**
     * Returns true if the paginated grid is currently empty.
     */
    public boolean isEmpty() {
        String displaying = displayingLbl.getText();

        if (isNullOrEmpty(displaying)) {
            return true;
        }

        if (displaying.startsWith("No")) {
            return true;
        }

        return false;
    }

    // Displaying 1 - 3 of 3
    private Pattern displayingRE = Pattern.compile("(\\d+)\\s+-\\s+(\\d+)\\s+of\\s+(\\d+)");

    /**
     * Returns page offset (0 being 1st row).
     */
    public int getPageOffset() {
        String displaying = displayingLbl.getText();

        if (isNullOrEmpty(displaying)) {
            return 0;
        }

        if (displaying.startsWith("No")) {
            return 0;
        }

        Matcher m = displayingRE.matcher(displaying);

        if (m.find()) {
            String offset = m.group(1);

            if (isNullOrEmpty(offset)) {
                return 0;
            } else {
                return Integer.parseInt(offset) - 1;
            }
        }

        return 0;
    }

    /**
     * Returns the total number of paginated rows available.
     */
    public int getTotalRows() {
        String displaying = displayingLbl.getText();

        if (isNullOrEmpty(displaying)) {
            return 0;
        }

        if (displaying.startsWith("No")) {
            return 0;
        }

        Matcher m = displayingRE.matcher(displaying);

        if (m.find()) {
            String total = m.group(3);

            if (isNullOrEmpty(total)) {
                return 0;
            } else {
                return Integer.parseInt(total);
            }
        }

        return 0;
    }

    public Paginator(WebElement parent) {
        firstPageBtn   = parent.findElement(By.cssSelector("button[data-qtip='First Page']"));
        prevPageBtn    = parent.findElement(By.cssSelector("button[data-qtip='Previous Page']"));
        nextPageBtn    = parent.findElement(By.cssSelector("button[data-qtip='Next Page']"));
        lastPageBtn    = parent.findElement(By.cssSelector("button[data-qtip='Last Page']"));
        refreshBtn     = parent.findElement(By.cssSelector("button[data-qtip=Refresh]"));
        currentPageFld = parent.findElement(By.cssSelector("div[id^=numberfield-] input[name=inputItem]"));

        List<WebElement> lst = parent.findElements(By.cssSelector("div.x-toolbar-text"));

        // There are multiple <div> elements of class x-toolbar-text and we want the last.
        if (lst != null) {
            displayingLbl = lst.get(lst.size() - 1);
        }
    }
}
