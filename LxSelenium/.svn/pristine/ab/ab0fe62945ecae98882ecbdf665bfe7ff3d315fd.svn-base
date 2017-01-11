package com.lucernex.qa.iwms;

import com.lucernex.qa.utils.CucumberContext;
import com.lucernex.swagger.domain.Task;
import com.lucernex.swagger.util.SecurityUtil;
import org.apache.cxf.jaxrs.client.WebClient;
import org.apache.log4j.Logger;

import javax.ws.rs.core.Cookie;
import javax.ws.rs.core.MediaType;
import java.net.URL;
import java.util.concurrent.Callable;

import static com.google.common.base.Strings.isNullOrEmpty;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

/**
 * Polls the status of a specified background task until it fails or finishes
 * successfully and once finished, returns the Task that was executing.
 */
public class ImportTaskWatcher implements Callable<Task> {
    private static Logger logger = Logger.getLogger(ImportTaskWatcher.class);

    private static int POLL_INTERVAL_DEFAULT = 5000;

    private Cookie sessionCookie;

    // URL to IWMS RESTful async task.
    private String taskURL;

    // Base URL to IWMS RESTful web-services.
    private URL baseURL;

    // Task polling interval (seconds).
    private int pollInterval;

    // Used to perform RESTful queries.
    private WebClient client;

    // Name of task we are to poll.
    private String taskName;

    /**
     * Returns true if the Task is finished executing for what ever reason.
     *
     * @param status - Task status
     */
    private boolean isFinished(String status) {
        return status != null &&
              (status.equals(Task.State.Canceled.name()) ||
               status.equals(Task.State.Failed.name())   ||
               status.equals(Task.State.Finished.name()));
    }

    @Override
    public Task call() throws Exception {
        logger.info("Starting poll of task " + taskName);

        if (taskURL == null) {
            client.path("/task/" + taskName);
        }

        client.accept(MediaType.APPLICATION_XML_TYPE);

        Task task;

        // Poll until task finishes execution.
        do {
            Thread.sleep(pollInterval);

            task = client.get(Task.class);
        } while (task != null && !isFinished(task.getState().name()));

        assertNotNull(task);

        logger.info("Finished polling task " + taskName);

        String summary = task.getResultsSummary();

        if (isNullOrEmpty(summary)) {
            logger.error(String.format("Task [%s] had null resultsSummary!", taskName));
        }

        // Give IWMS cache flush message a chance to be handled by all the cluster nodes.
        Thread.sleep(2000l);

        return task;
    }

    /**
     * Creates a task watcher given its URL and polling interval.
     *
     * @param taskURL       - URL of async task to poll
     * @param sessionCookie - IWMS session cookie
     * @param pollInterval  - task polling interval in milliseconds
     */
    public ImportTaskWatcher(String taskURL, Cookie sessionCookie, int pollInterval) {
        logger.info(String.format("TaskURL: %s", taskURL));

        this.pollInterval = pollInterval;
        this.taskURL = taskURL;
        this.client = WebClient.create(taskURL);
        this.client.cookie(sessionCookie);
        this.client.accept(MediaType.TEXT_PLAIN_TYPE);
        this.client.type(MediaType.APPLICATION_XML_TYPE);

        int lastSlash = taskURL.lastIndexOf('/');

        assertTrue(lastSlash > 0);

        this.taskName = taskURL.substring(lastSlash + 1);

        /** If you want to see the RESTful conversation, then uncomment following:
         ClientConfiguration config = WebClient.getConfig(this.client);

         config.getOutInterceptors().add(new LoggingOutInterceptor());
         config.getInInterceptors().add(new LoggingInInterceptor());
         */
    }

    /**
     * Creates a task watcher given its name and polling interval.
     *
     * @param baseURL       - base URL to IWMS RESTful web-services
     * @param sessionCookie - IWMS session cookie
     * @param taskName      - unique task name to watch
     * @param pollInterval  - task polling interval in milliseconds
     */
    public ImportTaskWatcher(URL baseURL, Cookie sessionCookie, String taskName, int pollInterval) {
        this.pollInterval = pollInterval;
        this.taskName = taskName;
        this.client = WebClient.create(baseURL.toString());
        this.client.cookie(sessionCookie);
        this.client.accept(MediaType.TEXT_PLAIN_TYPE);
        this.client.type(MediaType.APPLICATION_XML_TYPE);

        /** If you want to see the RESTful conversation, then uncomment following:
        ClientConfiguration config = WebClient.getConfig(this.client);

        config.getOutInterceptors().add(new LoggingOutInterceptor());
        config.getInInterceptors().add(new LoggingInInterceptor());
        */
    }

    /**
     * Creates a task watcher given its name polling according to a default
     * interval.
     *
     * @param baseURL       - base URL to IWMS RESTful web-services
     * @param sessionCookie - IWMS session cookie
     * @param taskName      - unique task name to watch
     */
    public ImportTaskWatcher(URL baseURL, Cookie sessionCookie, String taskName) {
        this(baseURL, sessionCookie, taskName, POLL_INTERVAL_DEFAULT);
    }
}
