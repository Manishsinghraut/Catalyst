package com.lucernex.qa.pages.admin;import org.openqa.selenium.WebElement;import org.openqa.selenium.support.FindBy;import org.openqa.selenium.support.How;import java.util.List;public class ImportDataPage {    @FindBy(how = How.CSS, using = "input[type='file']")    public WebElement chooseFileButton;    @FindBy(how = How.CSS, using = "input[value='Import']")    public WebElement importButton;    @FindBy(how = How.CSS, using = "#stopBtn-btnInnerEl")    public WebElement resetButton;    @FindBy(how = How.NAME, using = "stopOnError")    public List<WebElement> continueTillEndRadioButton;    @FindBy(how = How.CSS, using= "#main > div:nth-child(6)")    public WebElement isProcessingDome;    @FindBy(how = How.NAME, using= "dataFile")    public WebElement submitFileToImport;    @FindBy(how = How.CSS, using ="#progressBar-bar")    public WebElement finishedProgressBar;}