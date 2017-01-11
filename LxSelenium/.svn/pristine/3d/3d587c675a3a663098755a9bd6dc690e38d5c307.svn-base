package com.lucernex.qa.views.components;

import com.lucernex.qa.browsers.BrowserDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

/**
 * Represents an Ext.grid.Panel widget instance.
 */
public class GridPanelView {
    private String id = null; // Value of Ext.grid.Panel.id widget property.

    /**
     * Returns a list of WebElement instances that are the DOM representation of
     * rows in the ext-js Grid.
     */
    public List<WebElement> getGridRows() {
        return BrowserDriver.getCurrentDriver().findElements(
            By.cssSelector(String.format("div#%s tr[class*='x-grid-row']", id))
        );
    }

    /**
     * Returns the index (0 is 1st column) of the grid column that matches the
     * specified column name or -1 if not found.
     *
     * @param columnName - name of desired grid column
     */
    private int findColumnIndex(String columnName) {
        List<String> columnNames = getGridColumnNames();

        assertNotNull(columnNames);

        for (int i = 0; i < columnNames.size(); i++) {
            if (columnNames.get(i).equals(columnName)) {
                return i;
            }
        }

        return -1;
    }

    /**
     * Returns the index (0 is 1st row) of the grid row that has the specified
     * value in the identified column or -1 if not found.
     *
     * @param columnName - name of desired grid column
     * @param cellValue  - expected cell value
     */
    public int findGridRowWithCellValue(String columnName, String cellValue) {
        int column = findColumnIndex(columnName);

        assertTrue(column >= 0);

        List<WebElement> rows = getGridRows();

        assertNotNull(rows);

        for (int i = 0; i < rows.size(); i++) {
            List<WebElement> cells = rows.get(i).findElements(By.cssSelector("div[class*='x-grid-cell-inner']"));

            assertNotNull(cells);
            assertTrue(column < cells.size());

            if (!cells.isEmpty()) {
                WebElement cell = cells.get(column);

                if (cellValue.equals(cell.getText())) {
                    return i;
                }
            }
        }

        return -1;
    }

    /**
     * Returns a list of WebElement instances that are the DOM representation of
     * grid cells in the specified row.
     *
     * @param gridRow - desired row in grid (0 is 1st row)
     */
    public List<WebElement> getGridCells(int gridRow) {
        List<WebElement> rows = getGridRows();

        assertNotNull(rows);

        if (gridRow < 0) {
            throw new IllegalArgumentException("Argument gridRow: " + gridRow + " cannot be a negative value.");
        }

        if (gridRow >= rows.size()) {
            String msg = String.format("Argument gridRow: %d exceeds number of rows in grid %d", gridRow, rows.size());

            throw new IllegalArgumentException(msg);
        }

        WebElement row = rows.get(gridRow);

        return row.findElements(
            By.cssSelector("div[class*='x-grid-cell-inner']")
        );
    }

    /**
     * Clicks on the link in the specified cell.
     *
     * @param gridRow    - desired row in grid (0 is 1st row)
     * @param columnName - desired grid column
     *
     * @return true if there was a link in the specified cell otherwise false
     */
    public boolean clickCellLink(int gridRow, String columnName) {
        List<WebElement> cells = getGridCells(gridRow);

        if (cells == null || cells.isEmpty()) {
            return false;
        } else {
            int gridColumn = findColumnIndex(columnName);

            assertTrue(gridColumn > -1);
            assertTrue(gridColumn <= cells.size());

            WebElement cell = cells.get(gridColumn);
            WebElement link = cell.findElement(By.cssSelector("a"));

            assertNotNull(link);

            link.click();
            return true;
        }
    }

    private List<String> columnNames = null;

    /**
     * Returns a list of grid column names (not the user oriented names but
     * instead the ext-js model names).
     */
    public List<String> getGridColumnNames() {
        if (columnNames == null) {
            StringBuilder js = new StringBuilder();

            js.append("return (function() {");
            js.append("  var names = [];");
            js.append("  var columns = Ext.ComponentQuery.query('gridpanel#");
            js.append(id);
            js.append(" gridcolumn');");
            js.append("  for (var i = 0; i < columns.length; i++) {");
            js.append("    names[i] = columns[i].config.dataIndex");
            js.append("  }");
            js.append("  return names;");
            js.append("})();");

            columnNames = (List<String>) BrowserDriver.executeScript(js.toString());
        }

        return columnNames;
    }

    /**
     * Returns the grid cell value.
     *
     * @param rowNumber  - desired grid row (0 is 1st row)
     * @param columnName - desired grid column
     */
    public String getGridCellValue(int rowNumber, String columnName) throws InterruptedException {
        return null;
    }

    /**
     * Creates an instance given the DOM ID of the element that was specified
     * as the renderTo DOM element for the Ext.grid.Panel widget instance.
     *
     * @param tag - DOM tag that was specified in renderTo (e.g. "div")
     * @param renderTo - DOM ID of element that was specified in renderTo
     */
    public GridPanelView(String tag, String renderTo) {
        assertNotNull("Required argument 'tag' is null",      tag);
        assertNotNull("Required argument 'renderTo' is null", renderTo);

        WebElement grid = BrowserDriver.getCurrentDriver().findElement(
            By.cssSelector(String.format("%s#%s > div[class*='x-grid']", tag, renderTo))
        );

        assertNotNull(grid);

        id = grid.getAttribute("id");
    }
}
