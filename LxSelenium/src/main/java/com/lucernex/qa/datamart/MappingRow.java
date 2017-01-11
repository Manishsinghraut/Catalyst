package com.lucernex.qa.datamart;

import org.openqa.selenium.WebElement;

import java.util.Map;

/**
 * Represents a mapping row within the Mapping Schedules grid.
 */
public class MappingRow {
    private String name;
    private String source;
    private String targetDatabase;
    private String schedule;
    private String executionStatus;
    private String lastStart;
    private String duration;
    private Map<String,WebElement> actions;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getTargetDatabase() {
        return targetDatabase;
    }

    public void setTargetDatabase(String targetDatabase) {
        this.targetDatabase = targetDatabase;
    }

    public String getSchedule() {
        return schedule;
    }

    public void setSchedule(String schedule) {
        this.schedule = schedule;
    }

    public String getExecutionStatus() {
        return executionStatus;
    }

    public void setExecutionStatus(String executionStatus) {
        this.executionStatus = executionStatus;
    }

    public String getLastStart() {
        return lastStart;
    }

    public void setLastStart(String lastStart) {
        this.lastStart = lastStart;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public Map<String, WebElement> getActions() {
        return actions;
    }

    public void setActions(Map<String, WebElement> actions) {
        this.actions = actions;
    }

    public WebElement getAction(String action) {
        return actions.get(action);
    }
}
