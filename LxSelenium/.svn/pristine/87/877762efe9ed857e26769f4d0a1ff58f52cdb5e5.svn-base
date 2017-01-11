package com.lucernex.qa.utils;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Lists;
import com.lucernex.qa.browsers.BrowserDriver;
import com.lucernex.qa.browsers.BrowserType;
import com.lucernex.qa.iwms.BOClient;
import com.lucernex.qa.iwms.JSPClient;
import com.lucernex.swagger.BusinessObjectClient;
import com.lucernex.swagger.domain.BusinessObject;
import com.lucernex.swagger.util.Credentials;
import org.apache.commons.lang.NotImplementedException;
import org.apache.cxf.jaxrs.client.WebClient;
import org.junit.Assert;

import javax.json.JsonObject;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.google.common.base.Preconditions.checkArgument;
import static com.google.common.base.Strings.isNullOrEmpty;
import static junit.framework.Assert.assertNotNull;
import static org.junit.Assert.fail;

//import sun.reflect.generics.reflectiveObjects.NotImplementedException;

/**
 * Manages test execution context by providing properties that define:
 * 1) IWMS url
 * 2) IWMS authentication credentials
 * 3) WEB Browser (e.g. Firefox)
 * 4) Selenium HUB url if remote browser specified
 * 5) Anything else a test case wants to share
 *
 * The property values originate from one of three sources:
 * 1) Environment variables
 * 2) JVM properties
 * 3) Currently active maven profile
 *
 * The 1st place a given property is defined takes precedence over the other
 * sources.
 *
 * The following is the set of properties that can be defined via the above
 * mentioned three sources:
 *
 * Property         Purpose             Example
 * -------------    ----------------    ----------------------------
 * browser          Browser to use      REMOTE_FIREFOX
 * selenium.hub     Selenium HUB url    http://127.0.0.1:4444/wd/hub
 * iwms.url         IWMS web-ui url     http://test.lucernex.com
 * iwms.username    IWMS username       rootDev
 * iwms.password    IWMS password       not-going-to-say
 * iwms.firm        IWMS firm name      QA
 *
 * So for example if you wanted to override the firm name that is specified
 * by the maven profile you could use this JVM execution argument:
 *
 * -Diwms.firm=whatever
 *
 * Note: if you specify one of the remote browsers (e.g. REMOTE_FIREFOX), then you
 *       must also provide a value for the selenium.hub property as that is where
 *       the remote browser is expected to be.
 */
public class CucumberContext extends HashMap<String, Object> {
    private static final Logger logger = Logger.getLogger(CucumberContext.class.getName());

    // The properties file that defines the IWMS url and credentials.
    private static final String LX_SELENIUM_RESOURCE = "lx-selenium.properties";

    // Map key for Credentials object.
    public static final String CREDENTIALS = "credentials";

    // Property name (JVM and environment variable) for Selenium HUB URL to use.
    public static final String SELENIUM_HUB = "selenium.hub";

    // Property name (JVM, environment variable, and lx-selenium.properties) for name of web-browser to use.
    public static final String BROWSER = "browser";

    // Property name (JVM, environment variable, and lx-selenium.properties) for URL of IWMS web-ui.
    public static final String IWMS_URL = "iwms.url";

    // Property name (JVM, environment variable, and lx-selenium.properties) for IWMS username.
    public static final String IWMS_USERNAME = "iwms.username";

    // Property name (JVM, environment variable, and lx-selenium.properties) for IWMS password.
    public static final String IWMS_PASSWORD = "iwms.password";

    // Property name (JVM, environment variable, and lx-selenium.properties) for IWMS firm.
    public static final String IWMS_FIRM = "iwms.firm";

    // Property name of member's DateFormat (cache of getSessionDateFormat() call).
    public static  String SESSION_DATE_FORMAT = "DateFormat";

    // Property name of member's NumberFormat (cache of getSessionNumberFormat() call).
    public static  String SESSION_NUMBER_FORMAT = "NumberFormat";

    // Property name of member's Locale (cache of getSessionNumberFormat() call).
    public static  String SESSION_LOCALE = "Locale";

    private static final ThreadLocal<CucumberContext> cucumberThreadLocal = new ThreadLocal<CucumberContext>() {
        protected CucumberContext initialValue() {
        return new CucumberContext();
        }
    };

    public static String getLocaleByUserName(String strUserName,String strField) throws Exception {
        List<Integer> returnValue = Lists.newArrayList();

        URL baseURL = CucumberContext.getURL();
        assertNotNull(baseURL);

        Credentials credentials = CucumberContext.getCredentials();
        assertNotNull(credentials);

        BusinessObjectClient boClient = new BusinessObjectClient(baseURL.toString(), credentials);
        List<BusinessObject> formats = boClient.findByFIQL(
                "Member",
                "LoginName==" + strUserName,
                strField);

        assertNotNull("locale cannot be null", formats);
        String strFieldValue="";
        for(BusinessObject format : formats) {
            if(format != null && format.getField(strField) != null
                    && format.getField(strField).getValue() != null) {
                strFieldValue = (format.getField(strField).getValue().toString());
                return strFieldValue;
            } else {
                System.out.print("Cannot get 'ProjectEntityID' from business object : " + format);
            }
        }

        return strFieldValue;
    }

    private static URL handleURLProperty(String name, String value) {
        Assert.assertNotNull(String.format("Required property '%s' not specified", name), value);

        try {
            URL url = new URL(value);

            getCucumberContext().put(name, url);

            return url;
        } catch (MalformedURLException e) {
            String msg2 = String.format(
                "Property '%s' specifies an invalid URL '%s': %s",
                name,
                value,
                e.getMessage()
            );

            fail(msg2);

            return null; // will never happen due to fail() call above.
        }
    }

    private static void handleBrowserProperty(String value) {
        Assert.assertNotNull("Required property 'browser' not specified", value);

        BrowserType browserType;

        try {
            browserType = BrowserType.fromString(value);
        } catch (IllegalArgumentException e) {
            browserType = BrowserType.FIREFOX;
        }

        getCucumberContext().put(BROWSER, browserType);
    }

    private static void handleCredentials(String username, String password, String firmname) {
        TripleDesCipher cipher;

        try {
            cipher = new TripleDesCipher();
        } catch (EncryptionException e) {
            logger.log(Level.SEVERE, e.getMessage());
            return;
        }

        Credentials credentials;

        try {
            credentials = new Credentials(username, firmname, cipher.decryptIfPrefixed(password));
            getCucumberContext().put(CREDENTIALS, credentials);
        } catch (EncryptionException e) {
            logger.log(Level.SEVERE, e.getMessage());
        }
    }

    /**
     * Returns the value of the specified property by consulting three sources:
     * Environment, JVM Property, and maven props in that order (1st one wins).
     *
     * @param props - properties as supplied by current maven profile (can be null)
     * @param name  - name of desired property
     */
    private static String getPropertyValue(Properties props, String name) {
        String value = System.getenv(name);

        if (!isNullOrEmpty(value)) {
            logger.info(String.format("Property [%s] value [%s] set by environment variable", name, value));
            return value;
        }

        value = System.getProperty(name);

        if (!isNullOrEmpty(value)) {
            logger.info(String.format("Property [%s] value [%s] set by system property", name, value));
            return value;
        }

        if (props != null) {
            value = props.getProperty(name);
            if (!name.equals("iwms.password") || value.startsWith("DES:")) {
                logger.info(String.format("Property [%s] value [%s] set by maven profile", name, value));
            }
        }

        return value;
    }

    /**
     * Returns the value of the specified property by consulting two sources:
     * Environment and JVM Property in that order (1st one wins).
     *
     * @param name  - name of desired property
     */
    private static String getPropertyValue(String name) {
        return getPropertyValue(null, name);
    }

    /**
     * Lazy load the properties as defined by the 'lx-selenium.properties' file
     * with optional JVM overrides.
     */
    private static void loadIWMSProperties() {
        if (getCucumberContext().get(IWMS_URL) == null) {
            InputStream in = Credentials.class.getClassLoader().getResourceAsStream(LX_SELENIUM_RESOURCE);

            assertNotNull("Resource '" + LX_SELENIUM_RESOURCE + "' not found in classpath!", in);

            try {
                Properties props = new Properties();
                String  username = null;
                String  password = null;
                String  firmname = null;

                props.load(in);

                for (Object key : props.keySet()) {
                    String name = (String)key;

                    if (IWMS_URL.equals(name)) {
                        handleURLProperty(name, getPropertyValue(props, IWMS_URL));
                    } else if (BROWSER.equals(name)) {
                        handleBrowserProperty(getPropertyValue(props, BROWSER));
                    } else if (IWMS_USERNAME.equals(name)) {
                        username = getPropertyValue(props, IWMS_USERNAME);
                    } else if (IWMS_PASSWORD.equals(name)) {
                        password = getPropertyValue(props, IWMS_PASSWORD);
                    } else if (IWMS_FIRM.equals(name)) {
                        firmname = getPropertyValue(props, IWMS_FIRM);
                    } else {
                        logger.warning(String.format("Ignoring unexpected property '%s'", name));
                    }
                }

                Assert.assertNotNull(
                    String.format("Required property '%s' not defined!", IWMS_USERNAME),
                    username
                );
                Assert.assertNotNull(
                    String.format("Required property '%s' not defined!", IWMS_PASSWORD),
                    password
                );
                Assert.assertNotNull(
                    String.format("Required property '%s' not defined!", IWMS_FIRM),
                    firmname
                );

                handleCredentials(username, password, firmname);
                try {
                    SESSION_LOCALE=getLocaleByUserName(username, "Language");
                    SESSION_NUMBER_FORMAT=getLocaleByUserName(username, "NumberPattern");
                    SESSION_DATE_FORMAT=getLocaleByUserName(username, "DatePattern");
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } catch (IOException e) {
                String msg = String.format(
                    "Unable to load '%s' from classpath: %s",
                    LX_SELENIUM_RESOURCE,
                    e.getMessage()
                );

                fail(msg);
            } finally {
                try {
                    in.close();
                } catch (IOException e) {
                    // ignore
                }
            }
        }
    }

    /**
     * Returns the thread local that represents the current state of the executing
     * BDD Scenario.
     */
    public static CucumberContext getCucumberContext() {
        return cucumberThreadLocal.get();
    }

    /**
     * Returns the desired Selenium HUB URL if defined otherwise null.
     */
    public static URL getSeleniumHub() {
        URL url = (URL)getCucumberContext().get(SELENIUM_HUB);

        if (url != null) {
            return url;
        }

        String seleniumHub = getPropertyValue(SELENIUM_HUB);

        if (isNullOrEmpty(seleniumHub)) {
            return null;
        }

        return handleURLProperty(SELENIUM_HUB, seleniumHub);
    }

    /**
     * Returns the desired type of web browser.
     */
    public static BrowserType getBrowserType() {
        loadIWMSProperties();

        return (BrowserType)getCucumberContext().get(BROWSER);
    }

    /**
     * Returns the IWMS base URL.
     */
    public static URL getURL() {
        loadIWMSProperties();

        return (URL)getCucumberContext().get(IWMS_URL);
    }

    /**
     * Returns the IWMS authentication credentials.
     */
    public static Credentials getCredentials() {
        loadIWMSProperties();

        return (Credentials)getCucumberContext().get(CREDENTIALS);
    }

    private static BusinessObject getMember(String username) throws Exception {
        return BOClient.findSingleByFIQL(
            "Member",
            "LoginName==" + username,
            "MemberID", "MemberNameFirstLast", "Language", "DatePattern"
        );
    }

    /**
     * Returns the authenticated member.
     */
    public static BusinessObject getSessionMember() throws Exception {
        loadIWMSProperties();

        Credentials credentials = (Credentials)getCucumberContext().get(CREDENTIALS);

        assertNotNull(credentials);
        WebClient wc = WebClient.create(" https://testb.lucernex.com/rest/businessObject/Member/details");
        wc.query("fields","Language");
        wc.query("fiql", "fiql=FirstName==Bob");

        BusinessObject member = BOClient.findSingleByFIQL(
            "Member",
            "LoginName==" + credentials.getUsername(),
            "MemberID", "MemberNameFirstLast", "Language", "DatePattern"
        );

        assertNotNull(
            String.format(
                "Unable to query member with loginName '%s'",
                credentials.getUsername()
            ),
            member
        );

        return member;
    }

    private static Pattern isoREGEX;

    /**
     * Returns true if the specified string matches the XML ISO date-time pattern.
     *
     * @param ts - sample timestamp string to classify
     */
    public static boolean isISOFormatted(String ts) {
        if (ts == null) {
            return false;
        }

        /* Lucernex ISO format:
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T05:00:00.000Z'");

        try {
            sdf.parse(ts);
            return true;
        } catch (ParseException e) {
            return false;
        }
        */

        if (isoREGEX == null) {
            isoREGEX = Pattern.compile(
                "^([\\+-]?\\d{4}(?!\\d{2}\\b))((-?)((0[1-9]|1[0-2])(\\3([12]\\d|0[1-9]|3[01]))?|W([0-4]\\d|5[0-2])(-?[1-7])?|(00[1-9]|0[1-9]\\d|[12]\\d{2}|3([0-5]\\d|6[1-6])))([T\\s]((([01]\\d|2[0-3])((:?)[0-5]\\d)?|24\\:?00)([\\.,]\\d+(?!:))?)?(\\17[0-5]\\d([\\.,]\\d+)?)?([zZ]|([\\+-])([01]\\d|2[0-3]):?([0-5]\\d)?)?)?)?$"
            );
        }

        synchronized (isoREGEX) {
            Matcher m = isoREGEX.matcher(ts);

            if (m.find()) {
                return true;
            }
        }

        return false;
    }

    // Map of Member's LANG vs DateFormat
    private static final ImmutableMap<String,DateFormat> LANG_TO_DATEFORMAT =
        new ImmutableMap.Builder<String,DateFormat>()
            .put("en", new SimpleDateFormat("MM/dd/yyyy"))
            .build();

    /**
     * Returns a date formatter according to the authenticated member's preferences.
     * Calling this method results in a RESTful every time you call it but you can
     * access the cached return value via CucumberContext.get("DatePattern") call.
     */
    public static DateFormat getSessionDateFormat() throws Exception {
        BusinessObject member = getSessionMember();
        JsonObject     fields = member.getFieldsAsJsonObject();

        // If Member.DatePattern field has a value, then use it.
        if (fields.get("DatePattern") != null) {
            String          datePattern = fields.getString("DatePattern");
            SimpleDateFormat dateFormat = new SimpleDateFormat(datePattern);

            cucumberThreadLocal.get().put(SESSION_DATE_FORMAT, dateFormat);

            return dateFormat;
        }

        String lang = fields.getString("Language");

        assertNotNull("Authenticated member's [Language] field is null!", lang);

        lang = lang.toLowerCase();

        // See if we have a DateFormat for Member.Language field value.
        DateFormat dateFormat = LANG_TO_DATEFORMAT.get(lang);

        // We need a default value then.
        if (dateFormat == null) {
            dateFormat = new SimpleDateFormat("MM/dd/yyyy");
        }

        cucumberThreadLocal.get().put(SESSION_DATE_FORMAT, dateFormat);

        return dateFormat;
    }

    /**
     * Login as a different user.
     *
     * @param username - new username
     */
    public static void switchUser(String username) throws Exception {
        BusinessObject member = getMember(username);

        checkArgument(member != null, "Unable to find a member via username '%s'", username);

        JsonObject fields = member.getFieldsAsJsonObject();

        if (fields.get("MemberID") == null) {
            fail("Member.MemberID field is null!");
        }

        int lxID = Integer.parseInt(fields.getString("MemberID"));

        try {
            JSPClient jspClient = new JSPClient(BrowserDriver.getCurrentDriver());

            username = jspClient.switchToMember(lxID);

            logger.info(String.format("Switched to user: %s\n", username));
        } catch (Exception e) {
            fail(e.getMessage());
        }
    }

    /**
     * Revert authentication to initial user.
     */
    public static void revertUser() {
        throw new NotImplementedException();
    }
}
