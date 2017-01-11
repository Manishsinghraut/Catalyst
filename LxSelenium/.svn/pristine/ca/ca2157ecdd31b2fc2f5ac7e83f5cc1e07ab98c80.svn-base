package com.lucernex.qa.pages.components;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

/**
 * Created by salomem on 3/24/14. A Page Object for EXT Lists(Grids?)
 */
public class EXTListPage {
    @FindBy(css = "div.x-grid3-header")
    public WebElement gridHeaderRow;

    @FindBy(css = "div#msgRow")
    public WebElement messageText;

    /*  TODO: Ask Greg for help on how to use CSS Selector for the add button
    * The problem is that how to make sure that you are always grabbing the add button that is on top. I've encountered
    * problems with selecting the "Add Button" on the popup underneath. This is more evident in 'AddItemPopupPage' that
    * I use for Job Function/Title Code. I also marked a 'TODO' there as well
    */
    //@FindBy(css = "div.x-toolbar button:contains('Add')")
    @FindBy(xpath = "//div[contains(@class,'x-panel-bbar')]//button[contains(text(),'Add')]")
    //@FindBy(xpath = "//button[contains(text(),'Add')]")
    //@FindBy(css = "button:contains('Add')")
    public WebElement addButton;

    @FindBy(css = "div.x-grid3-row")
    public List<WebElement> lineItemsInCurrentPage;

    /*  Add WebElements for the following support   */
    //  TODO    Button to go to the first page
    //  TODO    Button to go to the previous page
    //  TODO    The current page number
    //  TODO    The total number of pages
    //  TODO    Button to go to the next page
    //  TODO    Button to go to the last page
    //  TODO    Button to refresh the list
    //  TODO    The number of items currently displayed on the list

    /*  Add a page object for a line item*/
}
