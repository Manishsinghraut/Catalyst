package com.lucernex.qa.data;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * @author Andrew.Subichev
 */
public class Entity {

    public enum EntityType {
        Portfolio, Program, Prototype, Site, Project, Location, Parcel, Facility, CapitalProject, Contract;
    }

    private EntityType type;
    private String name;
    private boolean deleteFirst;
    private boolean failOnWarning;
    private String xmlFilePathAndName;

    public Entity(EntityType entityType, String entityName, boolean deleteFirst,
                  boolean failOnWarning, String xmlFilePathAndName) {
        this.type = entityType;
        this.name = entityName;
        this.deleteFirst = deleteFirst;
        this.failOnWarning = failOnWarning;
        this.xmlFilePathAndName = xmlFilePathAndName;
    }

    public EntityType getType() {
        return type;
    }

    public String getName() {
        return name;
    }

    public boolean isDeleteFirst() {
        return deleteFirst;
    }

    public boolean isFailOnWarning() {
        return failOnWarning;
    }

    public String getXmlFilePathAndName() {
        return xmlFilePathAndName;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
