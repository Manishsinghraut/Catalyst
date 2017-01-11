package com.lucernex.qa.datamart;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import static com.google.common.base.Strings.isNullOrEmpty;
import static junit.framework.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

/**
 * Represents a grid cell which has one or more Action links.
 */
public class ActionsCell {
    private final WebDriver driver;

    private Map<String,WebElement> name2link = new HashMap<String, WebElement>();

    /**
     * Returns the set of Action names in the grid cell.
     */
    public Set<String> getActions() {
        return name2link.keySet();
    }

    /**
     * Click on the specified action link.
     *
     * @param action - name of desired action
     * @return true if specified action exists
     */
    public boolean clickAction(String action) {
        WebElement link = name2link.get(action);

        if (link != null) {
            link.click();
            return true;
        }

        return false;
    }

    public ActionsCell(WebDriver driver, WebElement parent) {
        this.driver = driver;

        List<WebElement> links = parent.findElements(By.tagName("img"));

        assertNotNull(links);
        assertTrue(links.size() > 0);

        for (WebElement l : links) {
            String qtip = l.getAttribute("data-qtip");

            if (!isNullOrEmpty(qtip)) {
                name2link.put(qtip, l);
            }
        }
    }
}
