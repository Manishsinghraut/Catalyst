package com.rl.qa.steps;

import com.rl.qa.browsers.BrowserDriver;
import com.rl.qa.utils.SeleniumUtilities;
import com.rl.qa.views.ConfigureAWSProviderViews;
import cucumber.api.java.en.And;
import org.openqa.selenium.support.PageFactory;

import java.util.logging.Logger;

/**
 * Created by RLE0372 on 02-08-2016.
 */
public class ConfigureAWSProviderSteps {

    private static final Logger logger = Logger.getLogger(LoginSteps.class.getName());
    private static final com.rl.qa.utils.SeleniumUtilities SeleniumUtil = PageFactory.initElements(BrowserDriver.getCurrentDriver(), SeleniumUtilities.class);

    @And("^I select provider type \"([^\"]*)\"$")
    public void iSelectProviderType(String providerType) throws Throwable {
        ConfigureAWSProviderViews.selectProviderType(providerType);

    }

    @And("^I click on \"([^\"]*)\" User Access Key$")
    public void iClickOnUserAccessKey(String buttonID) throws Throwable {
        ConfigureAWSProviderViews.clickCredentialSelButton(buttonID);
    }

    @And("^I select \"([^\"]*)\" from the select box$")
    public void iSelectFromTheSelectBox(String orgName) throws Throwable {
        ConfigureAWSProviderViews.selectOrg(orgName);
    }

    @And("^I select \"([^\"]*)\" from the region select box$")
    public void iSelectFromTheRegionSelectBox(String region) throws Throwable {
        ConfigureAWSProviderViews.selectRegion(region);
    }

    @And("^I select \"([^\"]*)\" from the key pair select box$")
    public void iSelectFromTheKeyPairSelectBox(String keyPair) throws Throwable {
        ConfigureAWSProviderViews.selectKeyPair(keyPair);
    }

    @And("^I click on user pem file browse button and select pem file$")
    public void iClickOnUserPemFileBrowseButtonAndSelectPemFile() throws Throwable {
        ConfigureAWSProviderViews.browsePemFile();
    }

    @And("^I verify the created provider \"([^\"]*)\" in Providers list$")
    public void iVerifyTheCreatedProviderInProvidersList(String providerName) throws Throwable {
        ConfigureAWSProviderViews.verifyProvidersName(providerName);
    }

    @And("^I verify the following message \"([^\"]*)\" on popup window$")
    public void iVerifyTheFollowingMessageOnPopupWindow(String actMsg) throws Throwable {
        ConfigureAWSProviderViews.verifyMessage(actMsg);
    }

    @And("^I click on upload pem file and select azure \"([^\"]*)\" file$")
    public void iClickOnUploadPemFileAndSelectAzureFile(String pemFileName) throws Throwable {
        ConfigureAWSProviderViews.browseAzurePemFile(pemFileName);
    }

    @And("^I click on upload private key file and select azure \"([^\"]*)\" file$")
    public void iClickOnUploadPrivateKeyFileAndSelectAzureFile(String privateKeyFile) throws Throwable {
        ConfigureAWSProviderViews.browseAzurePrivateKeyFile(privateKeyFile);

    }

    @And("^I click on browse open stack pem file and select \"([^\"]*)\" file$")
    public void iClickOnBrowseOpenStackPemFileAndSelectFile(String openStackpemFile) throws Throwable {
        ConfigureAWSProviderViews.browseOpenStackPemFile(openStackpemFile);
    }

    @And("^I verify \"([^\"]*)\" in the provider table$")
    public void iVerifyInTheProviderTable(String providerName) throws Throwable {
        ConfigureAWSProviderViews.verifyProviderName(providerName);
    }

    @And("^I verify select provider type is disabled$")
    public void iVerifySelectProviderTypeIsDisabled() throws Throwable {
        ConfigureAWSProviderViews.verifySelProviderTypeisDisabled();
    }

    @And("^I verify \"([^\"]*)\" is disabled$")
    public void iVerifyIsDisabled(String credentialsAccessKeys) throws Throwable {
        ConfigureAWSProviderViews.verifyCredentialsAccessKeyIsDisabled(credentialsAccessKeys);
    }

    @And("^I verify select organization is disabled in edit provider page$")
    public void iVerifySelectOrganizationIsDisabledInEditProviderPage() throws Throwable {
        ConfigureAWSProviderViews.verifySelectOrgIsDisabled();
    }

    @And("^I verify select region is disabled in edit provider page$")
    public void iVerifySelectRegionIsDisabledInEditProviderPage() throws Throwable {
        ConfigureAWSProviderViews.verifySelectRegionIsDisabled();
    }

    @And("^I verify select key pair is disabled in edit provider page$")
    public void iVerifySelectKeyPairIsDisabledInEditProviderPage() throws Throwable {
        ConfigureAWSProviderViews.verifySelKeyPairIsDisabled();
    }


    @And("^I verify \"([^\"]*)\" with \"([^\"]*)\" in the provider table$")
    public void iVerifyWithInTheProviderTable(String providerName, String providerInfo) throws Throwable {
        ConfigureAWSProviderViews.verifyProviderInfo(providerName,providerInfo);
    }


    @And("^I select \"([^\"]*)\" from the dropdown$")
    public void iSelectFromTheDropdown(String orgName) throws Throwable {
        ConfigureAWSProviderViews.OrgSelct(orgName);
    }

    @And("^I select \"([^\"]*)\" from the select box in new provider page$")
    public void iSelectFromTheSelectBoxInNewProviderPage(String orgName) throws Throwable {
        ConfigureAWSProviderViews.selectOrgInNewAWSPage(orgName);
    }
}
