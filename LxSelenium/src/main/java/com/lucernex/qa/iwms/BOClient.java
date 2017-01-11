package com.lucernex.qa.iwms;

import com.lucernex.qa.FileUtilities;
import com.lucernex.qa.iwms.domain.LxDOMUtil;
import com.lucernex.qa.utils.CucumberContext;
import com.lucernex.swagger.BusinessObjectClient;
import com.lucernex.swagger.domain.BusinessObject;
import com.lucernex.swagger.domain.BusinessObjectLink;
import com.lucernex.swagger.domain.JsonMsgException;
import com.lucernex.swagger.domain.Results;

import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.jaxrs.client.WebClient;
import org.xml.sax.InputSource;

import javax.json.*;
import javax.ws.rs.core.Response;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.StringReader;
import java.util.List;
import java.util.Set;

import static com.google.common.base.Preconditions.checkArgument;
import static com.google.common.base.Preconditions.checkNotNull;
import static com.google.common.base.Strings.isNullOrEmpty;
import static junit.framework.TestCase.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

public class BOClient {
    public static final String sFILE_PROTO  = "file";
    public static final String sFTP_PROTO   = "ftp";
    public static final String sHTTP_PROTO  = "http";
    public static final String sHTTPS_PROTO = "https";

    public static final String sFILE_PREFIX  = sFILE_PROTO  + "://";
    public static final String sFTP_PREFIX   = sFTP_PROTO   + "://";
    public static final String sHTTP_PREFIX  = sHTTP_PROTO  + "://";
    public static final String sHTTPS_PREFIX = sHTTPS_PROTO + "://";

    private static BusinessObjectClient client = null;

    public static BusinessObjectClient getClient() throws Exception {
        if (client == null) {
            client = new BusinessObjectClient(
                CucumberContext.getURL().toString(),
                CucumberContext.getCredentials()
            );
        }

        return client;
    }

    /**
     * Returns a list of BusinessObjectLink instances for all records of the
     * specified type.
     *
     * @param type - desired record type
     */
    public static List<BusinessObjectLink> findBusinessObjectLinksByType(String type) throws Exception {
        checkArgument(!isNullOrEmpty(type), "Required argument 'type' is null/empty");

        return getClient().findBusinessObjectLinksByType(type, "name,lxID");
    }

    /**
     * Returns the lxID of the record of the specified type and that has a name
     * field value matching the provided name.
     *
     * @param type - desired record type
     * @param name - unique record name (not all record types have a unique name)
     */
    public static Integer findLxIDByName(String type, String name) throws Exception {
        checkArgument(!isNullOrEmpty(type), "Required argument 'type' is null/empty");
        checkArgument(!isNullOrEmpty(name), "Required argument 'name' is null/empty");

        List<BusinessObjectLink> links = getClient().findBusinessObjectLinksByType(type, "name,lxID");

        if (links == null || links.isEmpty()) {
            return null;
        }

        for (BusinessObjectLink l : links) {
            if (name.equals(l.getName())) {
                return l.getLxID();
            }
        }

        return null;
    }

    /**
     * Returns a BusinessObject instance (or null if not found) representing the record
     * that is of the specified type and has a name field matching the specified name.
     *
     * @param type - desired record type
     * @param name - unique record name (not all record types have a unique name)
     */
    public static BusinessObject findByName(String type, String name) throws Exception {
        checkArgument(!isNullOrEmpty(type), "Required argument 'type' is null/empty");
        checkArgument(!isNullOrEmpty(name), "Required argument 'name' is null/empty");

        Integer lxID = findLxIDByName(type, name);

        if (lxID == null) {
            return null;
        } else {
            return findByLxID(type, lxID);
        }
    }

    /**
     * Returns a BusinessObject instance (or null if not found) representing the record
     * matching the specified ID.
     *
     * Note: Will include the lxID field but exclude the clientID field.
     *
     * @param type - desired record type
     * @param lxID - unique record identifier
     */
    public static BusinessObject findByLxID(String type, int lxID) throws Exception {
        checkArgument(!isNullOrEmpty(type), "Required argument 'type' is null/empty");

        return getClient().findByLxID(type, lxID);
    }

    /**
     * Returns a BusinessObject instance representing the record of the specified
     * type identified by the provided ID.
     *
     * Note: Will include the clientID field but exclude the lxID field.
     *
     * @param type - desired record type
     * @param id   - unique record identifier (lxID or clientID)
     */
    public static BusinessObject findByID(String type, String id) throws Exception {
        checkArgument(!isNullOrEmpty(type), "Required argument 'type' is null/empty");
        checkArgument(!isNullOrEmpty(id),   "Required argument 'id' is null/empty");

        return getClient().findByID(type, id);
    }

    /**
     * Returns a BusinessObject instance representing the record of the specified
     * type identified by the provided ID.
     *
     * Note: Will include the clientID field but exclude the lxID field.
     *
     * @param type         - desired record type
     * @param id           - unique record identifier (lxID or clientID)
     * @param wantClientID - include clientID attribute?
     * @param wantLxID     - include lxID attribute?
     */
    public static BusinessObject findByID(
        String  type,
        String  id,
        boolean wantClientID,
        boolean wantLxID
    ) throws Exception {
        checkArgument(!isNullOrEmpty(type), "Required argument 'type' is null/empty");
        checkArgument(!isNullOrEmpty(id),   "Required argument 'id' is null/empty");

        return getClient().findByID(type, id, false, wantClientID, wantLxID);
    }

    /**
     * Returns a list of BusinessObject instances which represent existing records
     * of the specified type and optionally satisfy the specified query criteria.
     *
     * You can read more about FIQL here:
     *
     * http://cxf.apache.org/docs/jax-rs-search.html#JAX-RSSearch-FeedItemQueryLanguage
     *
     * FIQL is essentially a RESTful where clause in the form of a url parameter.
     *
     * @param type   - desired record type
     * @param fiql   - query criteria
     * @param fields - set of record field names to fetch
     */
    public static List<BusinessObject> findByFIQL(String type, String fiql, String... fields) throws Exception {
        checkArgument(!isNullOrEmpty(type), "Required argument 'type' is null/empty");

        return getClient().findByFIQL(type, fiql, fields);
    }

    /**
     * Returns the single BusinessObject instance which represent the existing record
     * of the specified type and satisfy the specified query criteria.
     *
     * You can read more about FIQL here:
     *
     * http://cxf.apache.org/docs/jax-rs-search.html#JAX-RSSearch-FeedItemQueryLanguage
     *
     * FIQL is essentially a RESTful where clause in the form of a url parameter.
     *
     * @param type   - desired record type
     * @param fiql   - query criteria
     * @param fields - set of record field names to fetch
     */
    public static BusinessObject findSingleByFIQL(String type, String fiql, String... fields) throws Exception {
        checkArgument(!isNullOrEmpty(type), "Required argument 'type' is null/empty");
        checkArgument(!isNullOrEmpty(fiql), "Required argument 'fiql' is null/empty");

        List<BusinessObject> lst = getClient().findByFIQL(type, fiql, fields);

        if (lst == null || lst.isEmpty()) {
            return null;
        } else if (lst.size() > 1) {
            String msg = String.format("Query was for a single %s but there are %d matches!", type, lst.size());

            throw new Exception(msg);
        } else {
            return lst.get(0);
        }
    }

    /**
     * Returns a list of BusinessObject instances which represent existing records
     * of the specified type and optionally satisfy the specified query criteria.
     *
     * You can read more about FIQL here:
     *
     * http://cxf.apache.org/docs/jax-rs-search.html#JAX-RSSearch-FeedItemQueryLanguage
     *
     * FIQL is essentially a RESTful where clause in the form of a url parameter.
     *
     * @param type   - desired record type
     * @param fiql   - query criteria
     * @param fields - set of record field names to fetch
     */
    public static List<BusinessObject> findByFIQL(String type, String fiql, Set<String> fields) throws Exception {
        checkArgument(!isNullOrEmpty(type), "Required argument 'type' is null/empty");
        checkArgument(!isNullOrEmpty(fiql), "Required argument 'fiql' is null/empty");

        return getClient().findByFIQL(type, fiql, fields);
    }

    /**
     * Attempts to create an IWMS record as defined by the specified JSON for the
     * specified record type.
     *
     * @param type   - record type to create (e.g. "Contract")
     * @param fields - JSON object containing field name-value pairs
     *
     * @return persisted record
     */
    public static BusinessObject create(String type, JsonObject fields) throws Exception {
        checkArgument(!isNullOrEmpty(type), "Required argument 'type' is null/empty");
        checkArgument(fields != null,       "Required argument 'fields' is null");

        return getClient().create(type, fields);
    }

    /**
     * Attempts to create an IWMS record as defined by the specified JSON for the
     * specified record type.
     *
     * @param type   - record type to create (e.g. "Contract")
     * @param fields - JSON formatted string of field name-value pairs
     *
     * @return persisted record
     */
    public static BusinessObject create(String type, String fields) throws Exception {
        checkArgument(type   != null, "Required argument 'type' is null!");
        checkArgument(fields != null, "Required argument 'fields' is null!");

        JsonObject json = Json.createReader(new StringReader(fields)).readObject();

        return getClient().create(type, json);
    }

    /**
     * Attempts to update a record as defined by the provided BusinessObject.
     *
     * @param bo - record to update
     */
    public static void update(BusinessObject bo) throws Exception {
        checkArgument(bo != null, "Required argument 'bo' is null!");
        checkArgument(
            bo.getLxID() != null || bo.getClientID() != null,
            "You must provide either the lxID/clientID value!"
        );

        Results results = getClient().update(bo);

        checkNotNull(results, "Response from RESTful call was null!");

        // If there were error encountered while updating the record, then throw
        // a JsonMsgException that includes the error information in JSON format.
        if (results.getErrors() != null && results.getErrors().size() > 0) {
            throw getClient().build(results.getErrors());
        }
    }

    /**
     * Attempts to update a record as defined by the provided BusinessObject.
     *
     * @param type   - record type to create (e.g. "Contract")
     * @param lxID   - unique record identifier
     * @param fields - JSON object containing field name-value pairs
     */
    public static void update(String type, int lxID, JsonObject fields) throws Exception {
        checkArgument(type   != null, "Required argument 'type' is null!");
        checkArgument(fields != null, "Required argument 'fields' is null!");

        BusinessObject bo = new BusinessObject(type, fields);

        bo.setLxID(lxID);
        update(bo);
    }

    /**
     * Attempts to create an IWMS record as defined by the specified JSON for the
     * specified record type if it does not exist, otherwise updates the record.
     *
     * @param type   - record type to create/update (e.g. "Contract")
     * @param fields - JSON object containing field name-value pairs
     *
     * @return persisted record
     */
    public static BusinessObject createOrUpdate(String type, JsonObject fields) throws Exception {
        checkArgument(!isNullOrEmpty(type), "Required argument 'type' is null/empty");
        checkArgument(fields != null,       "Required argument 'fields' is null");

        try {
            BusinessObject bo = getClient().create(type, fields);

            return bo;
        } catch (JsonMsgException e) {
            JsonStructure json = e.getJsonMessage();
            JsonObject jsonObj = (JsonObject)json;

            // If the exception includes the lxID field then we have the case
            // of the record already existing so we need to do an update of
            // that existing record.
            if (jsonObj.get("lxID") != null) {
                int lxID = jsonObj.getInt("lxID");

                update(type, lxID, fields);

                return findByLxID(type, lxID);
            // otherwise we have some sort of other error.
            } else {
                throw e;
            }
        }
    }

    /**
     * Attempts to create an IWMS record as defined by the specified JSON for the
     * specified record type if it does not exist, otherwise updates the record.
     *
     * @param type   - record type to create/update (e.g. "Contract")
     * @param fields - JSON object containing field name-value pairs
     *
     * @return persisted record
     */
    public static BusinessObject createOrUpdate(String type, String fields) throws Exception {
        checkArgument(!isNullOrEmpty(type), "Required argument 'type' is null/empty");
        checkArgument(fields != null,       "Required argument 'fields' is null");

        JsonObject json = Json.createReader(new StringReader(fields)).readObject();

        return createOrUpdate(type, json);
    }

    /**
     * Delete the record which is of the specified type and has a name field value
     * that matches the specified name.
     *
     * @param type - desired record type
     * @param name - unique record name (not all record types have a unique name)
     *
     * @return true if able to delete specified record else false if not found
     */
    public static boolean deleteByName(String type, String name) throws Exception {
        checkArgument(type != null, "Required argument 'type' is null!");
        checkArgument(name != null, "Required argument 'name' is null!");

        Integer lxID = findLxIDByName(type, name);

        if (lxID == null) {
            return false;
        } else {
            getClient().delete(type, lxID);
            return true;
        }
    }

    /**
     * Delete the specified record.
     *
     * @param type - desired record type
     * @param id   - unique record identifier, either LxID or ClientID.
     */
    public static void delete(String type, String id) throws Exception {
        checkArgument(type != null, "Required argument 'type' is null!");
        checkArgument(id   != null, "Required argument 'id' is null!");

        getClient().delete(type, id);
    }

    /**
     * Delete the specified record.
     *
     * @param type - desired record type
     * @param lxID - unique record identifier
     */
    public static void delete(String type, int lxID) throws Exception {
        checkArgument(type != null, "Required argument 'type' is null!");

        getClient().delete(type, lxID);
    }

    /**
     * Given a response from the submission of a task, downloads the file produced by
     * the task.
     *
     * @param response - RESTful response from launch of task
     * @param fileName - name of file to which the downloaded file should be written
     */
    public static File saveResponseFile(
        Response response,
        String   fileName
    ) throws Exception {
        assertNotNull(response);

        if (Response.Status.OK.getStatusCode() != response.getStatus()) {
            InputStream in = (InputStream)response.getEntity();
            assertNotNull(in);
            String msg = IOUtils.toString(in);
            in.close();

            if (Response.Status.FORBIDDEN.getStatusCode() == response.getStatus()) {
                assertTrue("Failed to retrieve data (response=403, FORBIDDEN), perhaps server not configured for Datamart request?",
                        false);
            }
            assertEquals(msg, Response.Status.OK.getStatusCode(), response.getStatus());
        }

        InputStream in = (InputStream)response.getEntity();

        assertNotNull(in);

        File      outputFile;
        // If already root file or drive spec on windows don't prepend.
        if (fileName.startsWith("/") || fileName.indexOf(":\\") == 1) {
            outputFile = new File(fileName);
        } else {
            outputFile = new File(FileUtilities.getCWD(), fileName);
        }
        if (outputFile.exists()) {
            outputFile.delete();
        }
        FileOutputStream out = new FileOutputStream(outputFile);

        IOUtils.copy(in, out);

        out.close();
        in.close();

        System.out.println("Generated file " + outputFile.getAbsolutePath());

        return outputFile;
    }

    /**
     * Util method to fetch related data via a RESTful Get.
     *
     * @param recordType - type to fetch data for, e.g. PaymentTransaction, VirtualSalesTotal
     * @param fiql       - query string for what to fetch
     * @param fields     - list of desired field names
     * @exception java.io.IOException - thrown if invalid arguments.  To get the details of what is wrong
     *               1) Open browser session to server, login.
     *               2) Copy / Paste the url from the exception and look at returned error content
     */
    public static LxDOMUtil getSiteResourceAsLxDOM(	String recordType,
                                                String fiql,
                                                String fields)
            throws Exception {
        WebClient wc = getClient().resetWebClient();

        wc.path("/businessObject/" + recordType + "/details");
        wc.query("fiql", fiql);
        wc.query("fields", fields);

        Response response = wc.get();
        File temp = File.createTempFile("LxTest", ".xml");
        temp = saveResponseFile(response, temp.getAbsolutePath());
        InputSource inSource = new InputSource(sFILE_PREFIX + "/" + temp.getAbsolutePath());
        LxDOMUtil lxDOM = new LxDOMUtil(inSource);

        return lxDOM;
    }
}
