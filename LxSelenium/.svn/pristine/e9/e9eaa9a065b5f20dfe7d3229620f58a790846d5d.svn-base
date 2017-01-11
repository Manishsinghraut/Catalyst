package com.lucernex.qa.pages.components;

import static com.google.common.base.Strings.isNullOrEmpty;

/**
 * Created by salomem on 5/7/14.
 */
public enum EntityTab {
    Portfolio("Program"),
    Program("CapitalProgram"),
    Prototype("Prototype"),
    Site("PotentialProject"),
    Project("Project"),
    Location("Location"),
    Parcel("Parcel"),
    Facility("Facility"),
    CapitalProject("CapitalProject"),
    Contract("Contract");

    private String myID;

    private EntityTab (String id) {
        this.myID = id;
    }

    public String getCssSelector() {
        return "#m1_" + this.myID;
    }

    public static EntityTab fromString(String name) {
        if(isNullOrEmpty(name)) {
            throw new IllegalArgumentException("Required argument 'name' is null/empty!");
        }

        for(EntityTab et : EntityTab.values()) {
            if(name.equalsIgnoreCase(et.name())) {
                return et;
            }
        }

        throw new IllegalArgumentException(String.format("Specified name [%s] is unknown!", name));
    }
}
