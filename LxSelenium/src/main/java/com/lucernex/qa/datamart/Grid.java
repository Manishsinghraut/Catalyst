package com.lucernex.qa.datamart;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.ArrayList;
import java.util.List;

import static com.google.common.base.Strings.isNullOrEmpty;
import static org.junit.Assert.assertTrue;

/**
 * Represents a ext-js grid.
 */
public class Grid {
    private Paginator paginator;

    public Paginator getPaginator() {
        return paginator;
    }

    private List<String> columnHeaders;

    /**
     * Returns the list of column header labels.
     */
    public List<String> getColumnHeaders() {
        return columnHeaders;
    }

    private List<Row> rows;

    /**
     * Returns a list of Row instances which represent the grid's rows.
     */
    public List<Row> getRows() {
        return rows;
    }

    /**
     * Returns the number of rows in the grid.
     */
    public int getRowCount() {
        return rows.size();
    }

    /**
     * Select the specified row by clicking on it.
     *
     * @param row - grid row to select
     */
    public void clickRow(int row) {
        assertTrue(row >= 0);
        assertTrue(
            String.format(
                "Specified row %d is outside available rows %d", row, rows.size()
            ),
            row < rows.size()
        );

        // TODO: implement row click
    }

    protected Row createRow(WebElement row) {
        List<WebElement> cells = row.findElements(By.cssSelector("div.x-grid-cell-inner"));

        if (cells == null || cells.isEmpty()) {
            return null;
        }

        List<String> lst = new ArrayList<String>(cells.size());

        for (WebElement c : cells) {
            lst.add(c.getText());
        }

        return new Row(lst);
    }

    public void init(WebElement parent) {
        this.paginator = new Paginator(parent.findElement(By.cssSelector("div[id^=pagingtoolbar-]")));

        WebElement headerContainer = parent.findElement(By.cssSelector("div[id^=headercontainer-]"));

        List<WebElement> headerLabels = headerContainer.findElements(By.cssSelector("span.x-column-header-text"));

        columnHeaders = new ArrayList<String>(headerLabels.size());

        for (WebElement we : headerLabels) {
            String label = we.getText();

            if (isNullOrEmpty(label)) {
                columnHeaders.add("ID");
            } else {
                columnHeaders.add(label);
            }
        }

        WebElement gridDIV = parent.findElement(By.cssSelector("div[id^=gridview-]"));

        // If the grid is not empty, then extract its row values.
        if (!paginator.isEmpty()) {
            WebElement      table = gridDIV.findElement(By.tagName("table"));
            List<WebElement> rows = table.findElements(By.cssSelector("tr.x-grid-row"));

            this.rows = new ArrayList<Row>(rows.size());

            for (WebElement r : rows) {
                this.rows.add(createRow(r));
            }
        } else {
            this.rows = new ArrayList<Row>(1);
        }
    }

    public Grid(WebElement parent) {
        init(parent);
    }
}
