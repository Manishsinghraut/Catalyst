package com.lucernex.qa.datamart;

/**
 * Represents the mapping properties as defined by the Cucumber .feature file.
 */
public class Mapping {
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private String lxUrl;

    public String getLxUrl() {
        return lxUrl;
    }

    public void setLxUrl(String lxUrl) {
        this.lxUrl = lxUrl;
    }

    private String lxUserID;

    public String getLxUserID() {
        return lxUserID;
    }

    public void setLxUserID(String lxUserID) {
        this.lxUserID = lxUserID;
    }

    private String lxPassWD;

    public String getLxPassWD() {
        return lxPassWD;
    }

    public void setLxPassWD(String lxPassWD) {
        this.lxPassWD = lxPassWD;
    }

    private String lxFirm;

    public String getLxFirm() {
        return lxFirm;
    }

    public void setLxFirm(String lxFirm) {
        this.lxFirm = lxFirm;
    }

    private String dbHost;

    public String getDbHost() {
        return dbHost;
    }

    public void setDbHost(String dbHost) {
        this.dbHost = dbHost;
    }

    private String dbName;

    public String getDbName() {
        return dbName;
    }

    public void setDbName(String dbName) {
        this.dbName = dbName;
    }

    private String dbUserID;

    public String getDbUserID() {
        return dbUserID;
    }

    public void setDbUserID(String dbUserID) {
        this.dbUserID = dbUserID;
    }

    private String dbPassWD;

    public String getDbPassWD() {
        return dbPassWD;
    }

    public void setDbPassWD(String dbPassWD) {
        this.dbPassWD = dbPassWD;
    }

    @Override
    public String toString() {
        return "Mapping{" +
                "name='" + name + '\'' +
                ", lxUrl='" + lxUrl + '\'' +
                ", lxUserID='" + lxUserID + '\'' +
                ", lxPassWD='" + lxPassWD + '\'' +
                ", lxFirm='" + lxFirm + '\'' +
                ", dbHost='" + dbHost + '\'' +
                ", dbName='" + dbName + '\'' +
                ", dbUserID='" + dbUserID + '\'' +
                ", dbPassWD='" + dbPassWD + '\'' +
                '}';
    }
}
