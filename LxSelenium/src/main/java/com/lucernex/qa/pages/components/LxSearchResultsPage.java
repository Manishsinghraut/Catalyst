package com.lucernex.qa.pages.components;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

import static com.google.common.base.Strings.isNullOrEmpty;

/**
 * Created by salomem on 5/12/14.
 */
public class LxSearchResultsPage {
    public enum EntityType {
        Portfolio("Portfolios"),
        Program("Capital Programs"),
        Prototype("Prototypes"),
        Site("Sites"),
        Project("Opening Projects"),
        Location("Locations"),
        Parcel("Parcels"),
        Facility("Facilities"),
        CapitalProject("Capital Projects"),
        Contract("Contracts");

        private String entityTabLabel;

        private EntityType(String id) {
            this.entityTabLabel = id;
        }

        public String getLabel() {
            return "My " + this.entityTabLabel;
        }

        public static EntityType fromString(String name) {
            if(isNullOrEmpty(name)) {
                throw new IllegalArgumentException("Required argument 'name' is null/empty!");
            }

            for(EntityType et : EntityType.values()) {
                if(name.equalsIgnoreCase(et.name())) {
                    return et;
                }
            }

            throw new IllegalArgumentException(String.format("Specified name [%s] is unknown!", name));
        }
    }

    //  .x-tab-strip-wrap
    //  div.x-tab-strip-wrap:nth-child(1)
    @FindBy(css = "div.x-panel-body > div.x-tab-strip-wrap")
    public List<WebElement> entityTabs;

    @FindBy(css = "div.x-panel-body > div.x-tab-strip-wrap + table + table.tblBorder")
    public WebElement listOfEntities;
}
