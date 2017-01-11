package com.lucernex.qa.iwms.domain;

import com.google.common.collect.HashBasedTable;
import com.google.common.collect.Table;

import java.util.List;
import java.util.Set;

/**
 * Represents the results of the execution of an IWMS import data run.
 */
public class ImportDataResults {
    public enum ResultsType {Failures, Warnings, Creates, Updates, Deletes};

    private boolean finished = false;

    private List<String> errors = null;

    public boolean isFinished() {
        return finished;
    }

    public void setFinished(boolean finished) {
        this.finished = finished;
    }

    public List<String> getErrors() {
        return errors;
    }

    public void setErrors(List<String> errors) {
        this.errors = errors;
    }

    public boolean isSuccess() {
        for (String objType : results.rowKeySet()) {
            if (getCount(objType, ResultsType.Failures) > 0) {
                return false;
            }
        }

        return true;
    }

    // Table of import results.
    private Table<String,ResultsType,Integer> results = HashBasedTable.create();

    /**
     * Returns table of import data processing results.
     */
    public Table<String, ResultsType, Integer> getResults() {
        return results;
    }

    /**
     * Returns a set of object types that were processed by the import data task.
     */
    public Set<String> getObjectTypes() {
        return results.rowKeySet();
    }

    /**
     * Returns a count of the specified type of results of the identified object type.
     *
     * @param objectType  - desired object type (e.g. Contract)
     * @param resultsType - desired result type
     */
    public Integer getCount(String objectType, ResultsType resultsType) {
        return results.get(objectType, resultsType);
    }

    /**
     * Puts the specified count of the identified object type and results type.
     *
     * @param objectType  - object type
     * @param resultsType - type of results
     * @param count       - count
     */
    public void putCount(String objectType, ResultsType resultsType, int count) {
        results.put(objectType, resultsType, count);
    }

    public String toString() {
        return "ImportDataResults{" +
                "errors=" + errors +
                ", finished=" + finished +
                ", results=" + results +
                '}';
    }
}
