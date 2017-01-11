package com.lucernex.qa.utils;

import com.google.common.io.ByteStreams;
import com.google.common.io.Closeables;
import com.lucernex.qa.data.TemplateType;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.params.ClientPNames;
import org.apache.http.client.protocol.ClientContext;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.cookie.BasicClientCookie;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.BasicHttpContext;
import org.openqa.selenium.Cookie;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.io.*;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.Set;
import java.util.logging.Logger;

public class Downloader {
    private static final Logger logger = Logger.getLogger(Downloader.class.getName());

    private WebDriver driver;
    private String localDownloadPath = System.getProperty("java.io.tmpdir");
    private boolean followRedirects = true;
    private boolean mimicWebDriverCookieState = true;
    private int httpStatusOfLastDownloadAttempt = 0;

    /**
     * Load in all the cookies WebDriver currently knows about so that we can mimic the browser cookie state
     *
     * @param seleniumCookieSet - cookies as provided by WebDriver
     */
    private BasicCookieStore mimicCookieState(Set<Cookie> seleniumCookieSet) {
        BasicCookieStore mimicWebDriverCookieStore = new BasicCookieStore();
        for (Cookie seleniumCookie : seleniumCookieSet) {
            BasicClientCookie duplicateCookie = new BasicClientCookie(seleniumCookie.getName(), seleniumCookie.getValue());
            duplicateCookie.setDomain(seleniumCookie.getDomain());
            duplicateCookie.setSecure(seleniumCookie.isSecure());
            duplicateCookie.setExpiryDate(seleniumCookie.getExpiry());
            duplicateCookie.setPath(seleniumCookie.getPath());
            mimicWebDriverCookieStore.addCookie(duplicateCookie);
        }

        return mimicWebDriverCookieStore;
    }

    public void downloadSpreadsheetTemplate(
        TemplateType templateType,
        File           targetFile
    ) throws URISyntaxException, IOException {
        URI formURI = new URI(driver.getCurrentUrl());

        if (targetFile.canWrite() == false) {
            targetFile.setWritable(true);
        }

        HttpClient        client = new DefaultHttpClient();
        BasicHttpContext context = new BasicHttpContext();

        // Apply WebDriver cookies to HTTP context if requested.
        if (mimicWebDriverCookieState) {
            context.setAttribute(ClientContext.COOKIE_STORE, mimicCookieState(this.driver.manage().getCookies()));
        }

        HttpPost                post = new HttpPost(formURI);
        HttpParams requestParameters = post.getParams();

        requestParameters.setParameter(ClientPNames.HANDLE_REDIRECTS, true);
        post.setParams(requestParameters);

        /*
        List<BasicNameValuePair> params = new ArrayList<BasicNameValuePair>();

        params.add(new BasicNameValuePair("importType", templateType.getValue()));
        //params.add(new BasicNameValuePair("handlerType2", ""));
        params.add(new BasicNameValuePair("formSubmit", "fileDownload"));
        params.add(new BasicNameValuePair("isPopup", "true"));
        params.add(new BasicNameValuePair("submitButton", "Download"));

        post.setEntity(new UrlEncodedFormEntity(params));
        */

        HttpResponse response = client.execute(post, context);

        logger.info("POST response code: " + response.getStatusLine().getStatusCode());

        httpStatusOfLastDownloadAttempt = response.getStatusLine().getStatusCode();

        InputStream   in = response.getEntity().getContent();
        OutputStream out = new FileOutputStream(targetFile);

        try {
            ByteStreams.copy(in, out);
        } finally {
            Closeables.close(out, true);
            Closeables.closeQuietly(in);
        }
    }

    /**
     * Perform the file/image download.
     *
     * @param element   - DOM element supporting downloads
     * @param attribute - DOM attribute of specified element containing the url
     *
     * @return full path of downloaded file
     */
    private String downloader(WebElement element, String attribute) throws IOException, NullPointerException, URISyntaxException {
        String fileToDownloadLocation = element.getAttribute(attribute);
        if (fileToDownloadLocation.trim().equals("")) throw new NullPointerException("The element you have specified does not link to anything!");

        URL fileToDownload = new URL(fileToDownloadLocation);
        File downloadedFile = new File(this.localDownloadPath + fileToDownload.getFile().replaceFirst("/|\\\\", ""));
        if (downloadedFile.canWrite() == false) downloadedFile.setWritable(true);

        HttpClient client = new DefaultHttpClient();
        BasicHttpContext localContext = new BasicHttpContext();

        logger.info("Mimic WebDriver cookie state: " + this.mimicWebDriverCookieState);
        if (this.mimicWebDriverCookieState) {
            localContext.setAttribute(ClientContext.COOKIE_STORE, mimicCookieState(this.driver.manage().getCookies()));
        }

        HttpGet httpget = new HttpGet(fileToDownload.toURI());
        HttpParams httpRequestParameters = httpget.getParams();
        httpRequestParameters.setParameter(ClientPNames.HANDLE_REDIRECTS, this.followRedirects);
        httpget.setParams(httpRequestParameters);

        logger.info("Sending GET request for: " + httpget.getURI());
        HttpResponse response = client.execute(httpget, localContext);
        this.httpStatusOfLastDownloadAttempt = response.getStatusLine().getStatusCode();
        logger.info("HTTP GET request status: " + this.httpStatusOfLastDownloadAttempt);
        logger.info("Downloading file: " + downloadedFile.getName());

        InputStream   in = response.getEntity().getContent();
        OutputStream out = new FileOutputStream(downloadedFile);

        try {
            ByteStreams.copy(in, out);
        } finally {
            Closeables.close(out, true);
            Closeables.closeQuietly(in);
        }

        String downloadedFileAbsolutePath = downloadedFile.getAbsolutePath();
        logger.info("File downloaded to '" + downloadedFileAbsolutePath + "'");

        return downloadedFileAbsolutePath;
    }

    /**
     * Specify if the FileDownloader class should follow redirects when trying to download a file
     *
     * @param value - should redirects be followed?
     */
    public void followRedirectsWhenDownloading(boolean value) {
        this.followRedirects = value;
    }

    /**
     * Get the current location that files will be downloaded to.
     *
     * @return The filepath that the file will be downloaded to.
     */
    public String localDownloadPath() {
        return this.localDownloadPath;
    }

    /**
     * Set the path that files will be downloaded to.
     *
     * @param filePath The filepath that the file will be downloaded to.
     */
    public void localDownloadPath(String filePath) {
        this.localDownloadPath = filePath;
    }

    /**
     * Download the file specified in the href attribute of a WebElement
     *
     * @param element - DOM element supporting downloads
     *
     * @return full path of downloaded file
     */
    public String downloadFile(WebElement element) throws Exception {
        return downloader(element, "href");
    }

    /**
     * Download the image specified in the src attribute of a WebElement
     *
     * @param element - DOM element supporting downloads
     *
     * @return full path of downloaded file
     */
    public String downloadImage(WebElement element) throws Exception {
        return downloader(element, "src");
    }

    /**
     * Returns the HTTP status code of the last download file attempt
     */
    public int getHTTPStatusOfLastDownloadAttempt() {
        return this.httpStatusOfLastDownloadAttempt;
    }

    /**
     * Mimic the cookie state of WebDriver (Defaults to true)
     * This will enable you to access files that are only available when logged in.
     * If set to false the connection will be made as an anonymous user
     *
     * @param value - should we provide authentication cookie?
     */
    public void mimicWebDriverCookieState(boolean value) {
        this.mimicWebDriverCookieState = value;
    }

    public Downloader(WebDriver driverObject) {
        this.driver = driverObject;
    }
}