package com.lucernex.qa.views.components;


import com.lucernex.qa.pages.admin.AdminPage;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.utils.CucumberContext;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.entity.MapEntity;
import com.lucernex.qa.views.iwms.CommonMethods;
import com.lucernex.qa.views.iwms.contract.AllContractPagesView;
import junit.framework.Assert;
import org.openqa.selenium.*;

import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.logging.Logger;

import static com.google.common.base.Preconditions.checkArgument;
import static com.google.common.base.Strings.isNullOrEmpty;
//import static com.lucernex.qa.utils.ForceWaitForItem.delay;
import static junit.framework.Assert.*;

/**
 * Represents a modal window which is generally a popup dialog containing a
 * form with fields.
 */
public class LxModalWindow {
    private static final Logger logger = Logger.getLogger(LxModalWindow.class.getName());

    private static final AdminPage adminPage = PageFactory.initElements(BrowserDriver.getCurrentDriver(), AdminPage.class);
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    public static String getModalWindowText() {
        try {
            BrowserDriver.waitForElement(adminPage.modalWindowDiv);
        } catch (TimeoutException te) {
            fail("Timed out looking for the modal window's!");
        }

        assertTrue("Did not see the modal window!", adminPage.modalWindowDiv.isDisplayed());

        WebElement we = adminPage.modalWindowDiv;

        BrowserDriver.waitForElement(we);
        assertTrue("Did not see the modal window's!", we.isDisplayed());
        return we.getText();
    }

    /**
     * Wait for the footer of the modal window to appear to ensure the entire
     * modal window is visible (it loads in pieces).
     */
    private static void waitForModalWindowFooter() {
        try {
            try {
                BrowserDriver.waitForElement(adminPage.modalWindowDiv);
            }
            catch(Exception Ex){
                BrowserDriver.waitForElement(adminPage.modalWindowDiv);
            }
        } catch (TimeoutException te) {
            fail("Timed out looking for the modal window's footer!");
        }

        assertTrue("Did not see the modal window!", adminPage.modalWindowDiv.isDisplayed());

        WebElement we = adminPage.modalWindowDiv.findElement(By.cssSelector("div.x-toolbar-footer"));

        BrowserDriver.waitForElement(we);
        assertTrue("Did not see the modal window's footer!", we.isDisplayed());
    }

    /**
     * Wait for the firm note of the modal window to appear to ensure the
     * modal window is showing correct buttons.
     */
    public static void waitForModalWindowFirmNote() {
        try {
            WebElement we = adminPage.modalWindowDiv.findElement(By.cssSelector("div.frmError div:nth-of-type(2)"));
            BrowserDriver.waitForElement(we);
        } catch (TimeoutException te) {
            fail("Timed out looking for the modal window firm note!");
        }
    }

    /**
     * Returns true if a modal dialog window is present.
     */
    public static boolean isPresent() {
        try {
            return adminPage.modalWindowTopDiv.isDisplayed();
        } catch (org.openqa.selenium.NoSuchElementException e) {
            return false;
        }
    }

    public static void waitForModalWindow(String expectedLabel) {
        for(int i=0;i<10;i++){
            try {
                logger.info("Attempting to see a modal window "+i+"...");
                String label = LxModalWindow.getModalWindowLabel();
                if(!label.equals(expectedLabel)){
                    try{
                        WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(),10);
                        wait.until(ExpectedConditions.textToBePresentInElement(adminPage.modalWindowLabelDiv,expectedLabel));
                        return;
                    }catch(Exception e){
                    }
                }else{
                    return;
                }
            } catch (Exception ex) {
            }
        }
        BaseView.takeScreenshot("did-not-see-modal-window-label.png");
        logger.info("Expected modal window " + expectedLabel + " is not present");
        fail("Expected modal window "+expectedLabel+" is not present");
    }

    public static String getModalWindowLabel() {
//        waitForModalWindowFooter();
        SeleniumUtil.waitForElementVisibilityOf(adminPage.modalWindowLabelDiv, 5,2);
        BrowserDriver.waitForElement(adminPage.modalWindowLabelDiv);
        assertTrue("Did not see the modal window label!", adminPage.modalWindowLabelDiv.isDisplayed());
        /*if(!(adminPage.modalWindowLabelDiv.isDisplayed())){
            BrowserDriver.waitForElement(adminPage.modalWindowLabelDiv);
            assertTrue("Did not see the modal window label!", adminPage.modalWindowLabelDivOld.isDisplayed());
        }*/
        String label = adminPage.modalWindowLabelDiv.getText();

        logger.info("Modal window label: " + label);

        return label;
    }

    private static final String FORM_FIELDS = "form_fields";

    /**
     * Returns the WebElement that matches the specified by selector starting
     * the search from the provided parent.
     * <p/>
     * Note: does not wait for child element, returns immediately if not found
     *
     * @param parent - parent of element for which we are looking
     * @param by     - child element selector
     */
    private static WebElement findChild(WebElement parent, By by) {
        List<WebElement> children = parent.findElements(by);

        if (children == null || children.isEmpty()) {
            return null;
        } else if (children.size() == 1) {
            return children.get(0);
        } else {
            assertTrue(
                    String.format("Unexpected number of children, expected 2 and got %d", children.size()),
                    children.size() == 2
            );

            // The custom select widget has two input field one of which is hidden.
            return children.get(1); // the 2nd input field receives the keyed value.
        }
    }

    /**
     * Removes any suffix that starts with the '_' character.
     */
    private static String removeSuffix(String name) {
        if (!isNullOrEmpty(name)) {
            int slash = name.indexOf("_");

            if (slash > -1) {
                name = name.substring(0, slash);
            }

            return name;
        } else {
            return name;
        }
    }

    /**
     * Attempts to find an element which is a child of the specified parent
     * element and matches the specified css selector.
     *
     * @param parent      - parent element
     * @param cssSelector - child css selector
     */
    private static WebElement findChildNoWait(final WebElement parent, final String cssSelector) {
        WebDriver wd = BrowserDriver.getCurrentDriver();

        synchronized (wd) {
            wd.manage().timeouts().implicitlyWait(1, TimeUnit.SECONDS);

            try {
                List<WebElement> elements = parent.findElements(By.cssSelector(cssSelector));

                if (elements == null || elements.isEmpty()) {
                    return null;
                } else if (elements.size() == 1) {
                    return elements.get(0);
                } else {
                    return elements.get(1);
                }
            } catch (org.openqa.selenium.NoSuchElementException e) {
                return null;
            } finally {
                wd.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
            }
        }
    }

    private static CompoundSelectField createCompoundSelectField(
            boolean required,
            String label,
            String name,
            WebElement table
    ) {
        Select available;
        Select selected;
        WebElement moveRightBtn;
        WebElement moveLeftBtn;

        List<WebElement> selects = table.findElements(By.cssSelector("select"));

        assertTrue(
            String.format("For field '%s' did not find required pair of 'select' tags!", name),
            selects != null && selects.size() == 2
        );

        available = new Select(selects.get(0));
        selected = new Select(selects.get(1));

        List<WebElement> buttons = table.findElements(By.cssSelector("input[type=button]"));

        assertTrue(
                "Did not find required pair of 'button' tags!",
                buttons != null && buttons.size() == 2
        );

        moveRightBtn = buttons.get(0);
        moveLeftBtn = buttons.get(1);

        return new CompoundSelectField(required, label, name, available, selected, moveRightBtn, moveLeftBtn);
    }

    private static DropdownField createDropdownField(
            boolean required,
            String label,
            String name,
            WebElement input
    ) {
        WebElement parent = BrowserDriver.getParent(input);

        assertNotNull("Unable to get parent DOM element!", parent);

        WebElement arrowBtn;

        try {
            arrowBtn = parent.findElement(By.cssSelector("img.x-form-trigger"));
        } catch (org.openqa.selenium.NoSuchElementException e) {
            return null;
        }

        assertNotNull("Did not find expected 'img.x-form-trigger' element!", arrowBtn);

        return new DropdownField(required, label, name, arrowBtn);
    }

    private static boolean isTextInput(WebElement we) {
        if (we == null) {
            return false;
        }

        String type = we.getAttribute("type");

        // Oddly enough the password input element has the autocomplete attribute.
        if ("password".equals(type)) {
            return true;
        }

        if (type == null || type.equals("text")) {
            String autocomplete = we.getAttribute("autocomplete");

            // If the 'input' tag has an 'autocomplete' attribute, then it is
            // not a simple text field but is instead part of a compound drop
            // down field.
            return isNullOrEmpty(autocomplete);
        } else {
            return false;
        }
    }

    private static boolean isDropdown(WebElement we) {
        if (we == null) {
            return false;
        }

        String type = we.getAttribute("type");
        String auto = we.getAttribute("autocomplete");

        if (type.equals("text") && !isNullOrEmpty(auto)) {
            return true;
        } else {
            return false;
        }
    }

    private static RadioGroupField createRadioButtonGroup(boolean required, String label, String name, WebElement parent) {
        if (parent == null) {
            return null;
        }

        List<WebElement> radios = parent.findElements(By.cssSelector("input[type=radio]"));

        if (radios == null || radios.isEmpty()) {
            return null;
        }

        return new RadioGroupField(required, label, name, parent, radios);
    }

    private static CheckBoxGroupField createCheckBoxGroup(boolean required, String label, String name, WebElement parent) {
        if (parent == null) {
            return null;
        }

        List<WebElement> checks = parent.findElements(By.cssSelector("input[type=checkbox]"));

        if (checks == null || checks.isEmpty()) {
            return null;
        }

        return new CheckBoxGroupField(required, label, name, parent, checks);
    }

    private static void populateFields(
            List<Field> fields,
            List<WebElement> fieldLabels,
            boolean required
    ) {
        if (fieldLabels == null || fieldLabels.isEmpty()) {
            return;
        }

        for (WebElement we : fieldLabels) {
            String label = removeSuffix(we.getText());
            String  name = removeSuffix(we.getAttribute("id"));

            WebElement parent;

            /*  Support for older modal windows   */
            // Older IWMS form dialogs have this DOM arrangement:
            //
            // <td>
            //   <font id="xyz" class="requiredFieldLabel">xyz</font>
            // </td>
            // <td>
            //   <input type="hidden" name="xyz" value="1">
            //   <select name="xyz" onchange="func()" id="xyz">
            //
            if (we.getTagName().equalsIgnoreCase("font")) {
                parent = we.findElement(By.xpath("../.."));
            } else if (we.getTagName().equalsIgnoreCase("td")) {    //  Project Manager field in the Portfolio Wizard
                parent = we.findElement(By.xpath("../../.."));
            } else {
                parent = we.findElement(By.xpath(".."));
            }

            assertTrue(String.format("Unable to find parent of '%s'!", label), parent != null);

            WebElement input = findChildNoWait(parent, "input");

            String type = input == null ? null : input.getAttribute("type");

            // Did we find an 'input' tag?
            if (isTextInput(input)) {
                fields.add(new TextField(required, label, name, input));
                continue;
            }

            if ("checkbox".equals(type)) {
                fields.add(new CheckBoxField(required, label, name, input));
                continue;
            }

            if (isDropdown(input)) {
                fields.add(
                        createDropdownField(required, label, name, input)
                );
                continue;
            }

            WebElement table = findChildNoWait(parent, "table");

            if (table != null) {
                fields.add(
                        createCompoundSelectField(required, label, name, table)
                );
                continue;
            }

            WebElement select = findChildNoWait(parent, "select");

            if (select != null) {
                fields.add(new SelectField(required, label, name, select));
                continue;
            }

            RadioGroupField radioGroupField = createRadioButtonGroup(required, label, name, parent);

            if (radioGroupField != null) {
                fields.add(radioGroupField);
                continue;
            }

            WebElement textarea = findChildNoWait(parent, "textarea");

            if (textarea != null) {
                fields.add(new TextareaField(required, label, name, textarea));
                continue;
            }

            /*  Support for older modal windows   */
            // We are trying to get at the <select> element
            if ("hidden".equals(type)) {
                input = findChildNoWait(parent, "select");
                fields.add(new SelectField(required, label, name, input));
                continue;
            }

            logger.warning(String.format("Field '%s' is not a supported field type!", label));
        }
    }

    /**
     * Returns a list of elements which are field labels that are marked as required.
     * There are two styles of required labels used by IWMS, one with div the other
     * with font. In fact, the two styles can be found on a single modal dialog so
     * we look for both.
     */
    private static List<WebElement> getRequiredFieldElements() {
        List<WebElement> labels = new ArrayList<WebElement>();
        List<WebElement> lst1 = adminPage.modalWindowDiv.findElements(By.cssSelector("div.requiredFieldLabel"));
        List<WebElement> lst2 = adminPage.modalWindowDiv.findElements(By.cssSelector("font.requiredFieldLabel"));
        List<WebElement> lst3 = adminPage.modalWindowDiv.findElements(By.cssSelector("span.reqdLabel"));

        if (lst1 != null && lst1.size() > 0) {
            labels.addAll(lst1);
        }
        if (lst2 != null && lst2.size() > 0) {
            labels.addAll(lst2);
        }
        if (lst3 != null && lst3.size() > 0) {
            labels.addAll(lst3);
        }

        return labels;
    }

    private static WebElement getLxModalWindowHeader() {
        WebElement windowHeader = null;
        WebElement oldWindowHeader = adminPage.modalWindowDiv.findElement(By.cssSelector("div.x-shadow + div.lxmodalwindow span.x-window-header-text"));
        WebElement newWindowHeader = adminPage.modalWindowDiv.findElement(By.cssSelector("div.x-shadow + div.x-window span.x-window-header-text"));
        if (oldWindowHeader != null) {
            oldWindowHeader.getText();
        }
        if (newWindowHeader != null) {
            newWindowHeader.getText();
        }

        return windowHeader;
    }

    /**
     * Returns a list of Field instances which represent the form fields found
     * in the modal window.
     */
    public static List<Field> getFields() {
        CucumberContext context = CucumberContext.getCucumberContext();
        List<Field> fields = (List<Field>) context.get(FORM_FIELDS);

        if (fields == null) {
            waitForModalWindowFooter();

            List<WebElement> fieldLabels = getRequiredFieldElements();

            if (fieldLabels == null || fieldLabels.isEmpty()) {
                fieldLabels = adminPage.modalWindowDiv.findElements(By.cssSelector("font.requiredFieldLabel"));
            }

            fields = new ArrayList<Field>();
            populateFields(fields, fieldLabels, true);

            fieldLabels = adminPage.modalWindowDiv.findElements(By.className("optionalFieldLabel"));
            populateFields(fields, fieldLabels, false);

            context.put(FORM_FIELDS, fields);
        }

        logger.info(String.format("Found %d modal window fields", (fields == null) ? 0 : fields.size()));

        return fields;
    }

    /**
     * Returns a set of required field labels that are found within the modal window.
     */
    public static Set<String> getRequiredFields() {
        List<Field> fields = getFields();

        if (fields == null || fields.isEmpty()) {
            return new TreeSet<String>();
        }

        Set<String> required = new TreeSet<String>();

        for (Field f : fields) {
            if (f != null && f.isRequired()) {
                required.add(f.getLabel());
            }
        }

        logger.info(
                String.format(
                        "Returned %d modal window required field names",
                        (required == null) ? 0 : required.size()
                )
        );

        return required;
    }

    /*
     * Returns a set of field labels that are found within the modal window.
     */
    public static Set<String> getFieldLabels() {
        List<Field> fields = getFields();

        if (fields == null || fields.isEmpty()) {
            return new TreeSet<String>();
        }

        Set<String> labels = new TreeSet<String>();

        for (Field f : fields) {
            labels.add(f.getLabel());
        }

        logger.info(String.format("Returned %d modal window field labels", (labels == null) ? 0 : labels.size()));

        return labels;
    }

    /**
     * Returns value of specified field with the potential of tab character
     * separated list in the event of a select element with multiple selected
     * values.
     *
     * @param name - name of field to inquire about
     */
    public static String getFieldValue(String name) {
        waitForModalWindowFooter();

        WebElement field = adminPage.modalWindowDiv.findElement(By.cssSelector("input[name=" + name + "]"));

        if (field == null) {
            field = adminPage.modalWindowDiv.findElement(By.cssSelector("select[name=" + name + "]"));

            assertNotNull(String.format("Field '%s' not found!", name), field);

            Select select = new Select(field);

            if (select.isMultiple()) {
                StringBuilder sb = new StringBuilder();
                List<WebElement> selections = select.getAllSelectedOptions();

                if (selections == null || selections.isEmpty()) {
                    return null;
                }

                Iterator<WebElement> it = selections.iterator();

                if (it.hasNext()) {
                    WebElement we = it.next();

                    sb.append(we.getAttribute("value"));
                }

                while (it.hasNext()) {
                    WebElement we = it.next();

                    sb.append('\t');
                    sb.append(we.getAttribute("value"));
                }

                return sb.toString();
            } else {
                return select.getFirstSelectedOption().getAttribute("value");
            }
        } else {
            return field.getAttribute("value");
        }
    }

    /**
     * Updates the value of the specified field. In the event the field is of
     * type select, then multiple values can be concatenated together separated
     * by the tab character.
     *
     * @param label - label of field to inquire about
     * @param value - desired value of field
     */
    public static void setFieldValue(String label, String value) {
        checkArgument(label != null, "Required argument 'label' is null!");

        List<Field> fields = getFields();

        assertTrue(fields != null);

        for (Field f : fields) {
            if (f.getLabel().equals(label)) {
                f.setValue(value);
                logger.info(String.format("Updated modal window field '%s' to '%s'", label, value));
                return;
            }
        }

        fail("Specified field '%s' is unknown!");
    }


    /**
     * Returns a list of button labels for the modal window.
     */
    public static List<String> getButtons() {
        waitForModalWindowFooter();

        List<WebElement> buttons = adminPage.modalWindowDiv.findElements(By.cssSelector("div.x-panel-btns td.x-toolbar-cell button.x-btn-text"));

        assertNotNull("Did not see modal window buttons!", buttons);
        assertTrue("List of buttons is empty!", buttons.size() > 0);

        List<String> labels = new ArrayList<String>(buttons.size());

        for (WebElement we : buttons) {
            labels.add(we.getText());
        }

        logger.info(String.format("Found these modal window buttons: '%s'", labels));

        return labels;
    }


    /**
     * Click the specified button.
     *
     * @param button - label on button to click
     */
    public static void clickButton(String button) throws Throwable{

        textToBePresentInElements("div.x-css-shadow+div.x-window div.x-toolbar div.x-box-target span.x-btn-inner","cssselector",button);
        SeleniumUtil.waitForElementIsClickable(adminPage.modalWindowDiv, 10,2);
        List<WebElement> buttons = adminPage.modalWindowDiv.findElements(By.cssSelector("div.x-toolbar div.x-box-target span.x-btn-inner"));
        assertNotNull("Did not see modal window buttons!", buttons);
        assertTrue("List of buttons is empty!", buttons.size() > 0);

        for (WebElement we : buttons) {
//            String label = we.getText();
            String label = AllContractPagesView.getTextAndByPassException(we);

            if (!isNullOrEmpty(label) && label.equalsIgnoreCase(button) && we.isDisplayed()) {
                try{
                    Actions actions = new Actions(BrowserDriver.getCurrentDriver());
                    actions.moveToElement(we).build().perform();
                    //Focus the element
                    we.sendKeys("");
                    BrowserDriver.waitForElement(we);
                }catch(Exception e){

                }
                SeleniumUtil.waitForNonStaleWebElement(we,10, 2);
                we.click();
                // We need to forget about the dialog and its fields since we just dismissed it.
                CucumberContext.getCucumberContext().remove(FORM_FIELDS);
                logger.info(String.format("Clicked '%s' modal window button", button));
                return;
            }
        }
        fail(String.format("Did not see button '%s'!", button));
    }

   /* *//**
     * Click the specified button.
     *
     * @param button - label on button to click
     *//*
    public static void clickButton(String button) throws Throwable{
        boolean flag=false;
//    	Below code had commented as part of code refactoring    	
//        waitForModalWindowFooter();
       *//* try {
            Thread.sleep(8000);
        } catch (InterruptedException e) {
        }*//*

        //Changes with new EXT JS List<WebElement> buttons = adminPage.modalWindowDiv.findElements(By.cssSelector("div.x-panel-btns td.x-toolbar-cell button.x-btn-text"));
        //Removed delay adn adding webdriver wait which throws no exceptions
       *//* try{
            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(),60);
            wait.until(ExpectedConditions.textToBePresentInElement
                    (BrowserDriver.getCurrentDriver().findElement(By.cssSelector("div.x-toolbar div.x-box-target span.x-btn-inner")),button));
        }catch(Exception e){
        }*//*

        textToBePresentInElements("div.x-css-shadow+div.x-window div.x-toolbar div.x-box-target span.x-btn-inner","cssselector",button);
        List<WebElement> buttons = adminPage.modalWindowDiv.findElements(By.cssSelector("div.x-toolbar div.x-box-target span.x-btn-inner"));
        assertNotNull("Did not see modal window buttons!", buttons);
        assertTrue("List of buttons is empty!", buttons.size() > 0);

        for (WebElement we : buttons) {
            String label = we.getText();

            if (!isNullOrEmpty(label) && label.equalsIgnoreCase(button) && we.isDisplayed()) {
                *//*try {
                    Thread.sleep(6000);
                } catch (InterruptedException e) {
                }*//*
                try{
                    Actions actions = new Actions(BrowserDriver.getCurrentDriver());
                    actions.moveToElement(we).build().perform();
                    //Focus the element
                    we.sendKeys("");
                    BrowserDriver.waitForElement(we);
                }catch(Exception e){

                }
                we.click();

                // We need to forget about the dialog and its fields since we just dismissed it.
                CucumberContext.getCucumberContext().remove(FORM_FIELDS);

               *//* try {
                    // Give the dialog a chance to go away as it is hiding elements below it.
                    Thread.sleep(1000l);
                } catch (InterruptedException e) {
                }*//*
                flag=true;
                logger.info(String.format("Clicked '%s' modal window button", button));
                return;
            }
        }
        if(!flag){
            //Changes with new EXT JS List<WebElement> buttons = adminPage.modalWindowDiv.findElements(By.cssSelector("div.x-panel-btns td.x-toolbar-cell button.x-btn-text"));
            buttons = adminPage.modalWindowDiv.findElements(By.cssSelector("div.x-toolbar div.x-box-target span.x-btn-inner"));
            assertNotNull("Did not see modal window buttons!", buttons);
            assertTrue("List of buttons is empty!", buttons.size() > 0);

            for (WebElement we : buttons) {
                String label = we.getText();

                if (!isNullOrEmpty(label) && label.equalsIgnoreCase(button) && we.isDisplayed()) {
               *//* try {
                    Thread.sleep(6000);
                } catch (InterruptedException e) {
                }*//*

                    we.click();

                    // We need to forget about the dialog and its fields since we just dismissed it.
                    CucumberContext.getCucumberContext().remove(FORM_FIELDS);

                    try {
                        // Give the dialog a chance to go away as it is hiding elements below it.
                        Thread.sleep(1000l);
                    } catch (InterruptedException e) {
                    }
                    logger.info(String.format("Clicked '%s' modal window button", button));
                    return;
                }
            }
        }
        fail(String.format("Did not see button '%s'!", button));
    
    }*/

    // Select webelement fromt the dropdown by any locator - xpath/css - rupi
    public static void selectDropdownOption(By by, String optionName) {
        try {
            WebElement optionNames = BrowserDriver.getCurrentDriver().findElement(by);
            Select select = new Select(optionNames);
            select.selectByVisibleText(optionName);
        }
        catch(Exception e){
//            try {
//                SeleniumUtil.click("xpath", "//div[@class='frmNote']/a[2]", SeleniumUtilities.OBJWAITTIMEOUT);
//                delay(5000);
//                WebElement optionNames = BrowserDriver.getCurrentDriver().findElement(by);
//                Select select = new Select(optionNames);
//                select.selectByVisibleText(optionName);
//            }
//            catch(Exception ex) {
                BaseView.takeScreenshot(optionName + ".png");
                Assert.fail(e.getMessage());
//            }
        }
    }
    //protected static Map<String, String> _entityValue;
// this function maps the entity name to its value - rupi
    public static void setRadioFieldValue(String label) {
        waitForModalWindowFooter();
        Set<String> keys = MapEntity.mapEntityWithValue().keySet();
        for (String key : keys) {
        /*WebElement form = adminPage.modalWindowDiv.findElement(By.cssSelector("#f1 > table > tbody"));
        System.out.println(form.getText());*/
            String value = MapEntity.mapEntityWithValue().get(key);
            List<WebElement> labels = adminPage.modalWindowDiv.findElements(By.xpath(".//*[@type='radio']"));
            if(labels.size()==0){
               try {
                   SeleniumUtil.click("xpath", "//div[@class='frmNote']/a[2]", SeleniumUtilities.OBJWAITTIMEOUT);
//                   delay(5000);
                   SeleniumUtil.waitForElementVisibilityOf(adminPage.modalWindowDiv,5,2);
                   labels = adminPage.modalWindowDiv.findElements(By.xpath(".//*[@type='radio']"));
               }catch(Exception ex){

                }
            }
            System.out.println(labels.size());
            for (int i = 0; i < labels.size(); i++) {
                WebElement radioToClick = labels.get(i);
                if (label.equals(key)) {
                    if (radioToClick.getAttribute("value").equals(value)) {
                        System.out.println(radioToClick.getAttribute("value") + "  trying to click on the radio");
                        radioToClick.click();
                    }

                }
            }
        }

    }

    public static void addEmployerContactType() {
//        WebElement contactType = BrowserDriver.getCurrentDriver().findElement(By.cssSelector(".outerBorder>tbody>tr>td>div>input"));
//        contactType.click();
        try {
            WebElement contactTypeEle = SeleniumUtil.getWebElementObject("cssselector", ".outerBorder>tbody>tr>td>div>input");
            SeleniumUtil.click(contactTypeEle,SeleniumUtilities.OBJWAITTIMEOUT);
            for(int i=0;i<5;i++) {
                try {
                    if(SeleniumUtil.waitForNonStaleWebElement(contactTypeEle, 1))
                        return;
                }catch(Exception e){
                }
            }
        }
        catch (Exception ex){
        }
    }

    public static void waitTillLoadingInModalWindow() throws Throwable {
        try {
            BaseView.pushShortTimeout();
            BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div.x-css-shadow+div.x-window div[id*='loadmask'][id*='msgText']"));
            //if loading elements present fetch all the loading elements
            for (WebElement ele : BrowserDriver.getCurrentDriver().findElements(By.cssSelector("div.x-css-shadow+div.x-window div[id*='loadmask'][id*='msgText']"))) {
                //wait till grid load
                for (int i = 0; i < 5; i++) {

                    if (CommonMethods.isDisplayed(ele)) {
                        try{
                            WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(), 5);
                            wait.until(ExpectedConditions.not(ExpectedConditions.visibilityOf(ele)));
                        }catch(Exception e){
                        }
                    } else {
                        break;
                    }
                }
            }
        } catch (org.openqa.selenium.NoSuchElementException ne) {
            logger.info("No loading element present in this page");
        } finally {
            BaseView.popDefaultTimeout();
        }
    }

    public static void textToBePresentInElements(String locator, String strategy, String text) throws Throwable{
        int attempt = 0;
        boolean present = false;
        do{
            List<WebElement> elements = BrowserDriver.getCurrentDriver().findElements(SeleniumUtil.getElementBy(strategy,locator));
            for(WebElement element : elements){
                try{
                    WebDriverWait wait = new WebDriverWait(BrowserDriver.getCurrentDriver(),2);
                    wait.until(ExpectedConditions.textToBePresentInElement(element,text));
                }catch (Exception e){
                }
                if(AllContractPagesView.getTextAndByPassException(element).contains(text)){
                    attempt++;
                    present=true;
                }
            }
        }while (!present && attempt<SeleniumUtilities.WEBDRIVER_WAIT_SMALL);
    }
}