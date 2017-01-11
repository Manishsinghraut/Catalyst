package com.lucernex.qa;

import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.data.ClickFields;
import com.lucernex.qa.data.Field;
import com.lucernex.qa.data.IPresetFunctions;
import com.lucernex.qa.data.TypeFields;
import com.lucernex.qa.pages.components.EditableFormOrPage;
import com.lucernex.qa.utils.GridUtils;
import com.lucernex.qa.utils.SeleniumUtilities;
import com.lucernex.qa.views.BaseView;
import com.lucernex.qa.views.HomeView;
import com.lucernex.qa.views.components.ActionsView;
import com.lucernex.qa.views.components.EditableFormOrPageView;
import com.lucernex.qa.views.components.PortfolioNavigationView;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.*;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.*;

import java.util.List;
import java.util.ResourceBundle;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;

import static com.google.common.base.Strings.isNullOrEmpty;
//import static com.lucernex.qa.utils.ForceWaitForItem.delay;
import static com.lucernex.qa.utils.GridUtils.*;
import static junit.framework.Assert.*;
import static junit.framework.TestCase.fail;

public class PageFormEditSteps {
    private static final Logger logger = Logger.getLogger(PageFormEditSteps.class.getName());
    private static final SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);
    
    private EditableFormOrPageView formOrPageView = new EditableFormOrPageView();
    
    public static ResourceBundle getConfigTestData() {
    	return ResourceBundle.getBundle("Resource.ConfigTestData");
	}
    
    @Then("^I see that I am in the \"([^\"]*)\" firm$")
    public void I_see_that_I_am_in_the_firm(String firmname) {
        String actualFirmName = HomeView.getFirmName();
        assertNotNull("Unable to determine firm name from IWMS web-ui", actualFirmName);
        assertEquals(firmname, actualFirmName);
    }



    @And("^I edit the page$")
    public void I_edit_the_page() throws Throwable {
        ActionsView.edit();
    }



    @Then("^I verify these field values on editable page$")
    public void I_verify_these_field_values_on_editable_page(List<Field> fields) {
        WebDriver driver = BrowserDriver.getCurrentDriver();

        (new WebDriverWait(driver, 10)).until(new ExpectedCondition<Boolean>() {
            public Boolean apply(WebDriver d) {
                WebElement we = d.findElement(By.cssSelector("#f1"));
                return we != null;
            }
        });

        for (Field f : fields) {
            Object obj = ((JavascriptExecutor) driver).executeScript(EditableFormOrPage.getFormValue("f1", f.getName()));

            if(obj != null) {

                String chkVal = f.getValue();
                if(IPresetFunctions.FunctionNameEnum.contains(f.getValue())) {
                    if(IPresetFunctions.functions.containsKey(IPresetFunctions.FunctionNameEnum.valueOf(f.getValue()))) {
                        chkVal = IPresetFunctions.functions.get(IPresetFunctions.FunctionNameEnum.valueOf(f.getValue()));
                    }
                }
                assertEquals(String.format("Field's -%s- value does not match the expected value:", f.getName()), chkVal, obj.toString());


            } else {
                fail("Executed javascript returned no value!");
            }
        }
    }

    
    
//    @And("^I select the company type \"([^\"]*)\"$")
//    public void I_select_the_company_type(String companyType) {
//    	try {
//			SeleniumUtil.select(SeleniumUtilities.Locators.id, "CompanyType", companyType, 1);
//		} catch (Exception e) {
//			SeleniumUtilities.Log.error("Error :"+e.getMessage());
//		}
//    }
//    
//    @And("^I set the employer name \"([^\"]*)\"$")
//    public void I_set_the_employer_name(String employerName) {
//    	try {
//			SeleniumUtil.type(SeleniumUtilities.Locators.name, "Employer_EmployerName", employerName, 1);
//		} catch (Exception e) {
//			SeleniumUtilities.Log.error("Error :"+e.getMessage());
//		}
//    }
//    
//    @And("^I set the employer street Address \"([^\"]*)\"$")
//    public void I_set_the_employer_street_Address(String stAddress) {
//    	try {
//			SeleniumUtil.type(SeleniumUtilities.Locators.name, "Employer_EmployerName", stAddress, 1);
//		} catch (Exception e) {
//			SeleniumUtilities.Log.error("Error :"+e.getMessage());
//		}
//    }
    
    
  
	@And("^I verify the created portfolio fields \"([^\"]*)\"$")
	public void I_verify_the_created_portfolio_fields(String value) {
		try {
			SeleniumUtil.elementShouldContain("cssSelector", "table#rowColor1", value);					
		} catch (Exception e) {
			SeleniumUtilities.Log.error("Error :"+e.getMessage());
		}
	}
    
    
  @And("^I set the portfolio setup wizard field \"([^\"]*)\" on editable page$")
  public void I_set_the_portfolio_setup_wizard_field_values_on_editable_page(String value) {
  	try {
  		    String[] tokens =   value.split(",");
			SeleniumUtil.type("name", "Program_ProgramName", tokens[0], 1);
			SeleniumUtil.type("name", "Program_StreetAddress1", tokens[1], 1);
			SeleniumUtil.type("name", "Program_City", tokens[2], 1);
			SeleniumUtil.type("name", "Program_PostalCode", tokens[3], 1);
			SeleniumUtil.type("name", "Program_Description", tokens[4], 1);
			//SeleniumUtil.type(SeleniumUtilities.Locators.cssSelector, "div.x-boundlist-item.x-boundlist-item-over", tokens[5], 1);
			//SeleniumUtil.select(SeleniumUtilities.Locators.id, "_ManagerIDList_MemberID_add", tokens[6], 1);
			
		} catch (Exception e) {
			SeleniumUtilities.Log.error("Error :"+e.getMessage());
		}
  }
   
  
  
	  @And("^I select portfolio folder template \"([^\"]*)\"$")
	  public void I_select_portfolio_folder_template(String value) {
	  	try {
	  			SeleniumUtil.select("name", "entityTemplateID", value, 1);
			} catch (Exception e) {
				SeleniumUtilities.Log.error("Error :"+e.getMessage());
			}
	  }
  
    
	@And("^I verify the these field values on non editable page$")
	public void I_verify_the_these_field_values_on_non_editable_page(List<Field> fields) {
		try{
			SeleniumUtil.switchToFrame(2);
			WebElement tableEle = SeleniumUtil.getWebElementObject("table[class=\'rowColor1\']","cssSelector");
			for (Field f : fields) {
				SeleniumUtil.verifySplitDataInTableColumns(tableEle,f.getName(), f.getValue());
			}
			SeleniumUtil.switchTodefaultContent();
		}
		catch(Exception ex){
			logger.info("Error :"+ex.getMessage());
		}
	}

    @And("^I set these field values on editable page$")
    public void I_set_these_field_values_on_editable_page(List<Field> fields) {
//        try{
//            delay(10000);
//        }
//
//        catch(Exception ex){
//            System.out.print(ex.getMessage());
//
//        }

        WebDriver driver = BrowserDriver.getCurrentDriver();

        (new WebDriverWait(driver, 15)).until(new ExpectedCondition<Boolean>() {
            public Boolean apply(WebDriver d) {
                WebElement we = d.findElement(By.cssSelector("#f1"));
                return we != null;
            }
        });
        SeleniumUtil.getElement("cssselector", "#f1",5,2);
        boolean boolFrist =true;
        for (Field f : fields) {
            if(boolFrist) {
                SeleniumUtil.waitForElementVisibilityOf("name", f.getName(), 5, 2);
                boolFrist=false;
            }
            EditableFormOrPage.setFormValue("f1", f.getName(), f.getValue());
            try {
                if((!(BrowserDriver.getCurrentDriver().findElement(By.cssSelector("*[name^='" + f.getName() + "']")).getAttribute("value").equals(f.getValue()))) && (!BrowserDriver.getCurrentDriver().findElement(By.cssSelector("*[name^='" + f.getName() + "']")).getTagName().equals("select")))
                {
                    SeleniumUtil.getClickableWebElementObject("cssselector", "div[id^='" + f.getName() + "'] div div div~div").click();
                    SeleniumUtil.getClickableWebElementObject("xpath", "//div[text()='" + f.getValue() + "']").click();
                }

            } catch (Exception e) {
                BaseView.takeScreenshot("I_set_these_field_values_on_editable_page");
            }

            logger.info(String.format("Set %s with %s value", f.getName(), f.getValue()));
        }

//        try{
//            delay(10000);
//        }
//
//        catch(Exception ex){
//            System.out.print(ex.getMessage());
//            BaseView.takeScreenshot("I_set_these_field_values_on_editable_page");
//        }

    }

    @When("^I navigate to folders \"([^\"]*)\" and portfolio \"([^\"]*)\"$")
    public void I_navigate_to_folders_and_portfolio(String delimitedFolders, String linkName) {
        try {
            PortfolioNavigationView.navigateToLinkInFolder(delimitedFolders, linkName);
        } catch (InterruptedException e) {
            fail(e.getMessage());
        }
    }
}
