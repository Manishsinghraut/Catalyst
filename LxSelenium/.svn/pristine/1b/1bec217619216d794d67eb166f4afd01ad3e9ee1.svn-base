package com.lucernex.qa.data;

import static com.google.common.base.Strings.isNullOrEmpty;

/**
 * Represents the set of spreadsheet template types supported by IWMS.
 */
public enum TemplateType {
    ALLOWANCE("Allowance"),
    BUDGET_VALUE("Budget Value"),
    CHECK_PAYMENTS("Check Payments"),
    COMPETITOR("competitor"),
    CONTRACT("Contract"),
    CONTRACT_TERM("ContractTerm"),
    CONTRACT_AMENDMENT("ContractAmendment"),
    COVENANT("Covenant"),
    CUSTOM_LIST("Custom List"),
    CONTRACT_DATA("Contract Data"),
    COMPLEX("Complex"),
    EMPLOYER("Employer"),
    EXPENSE_SETUP("Expense Setup"),
    EQUIPMENT("Equipment"),
    FACILITY("Facility"),
    INSURACNCE("Insurance"),
    PARCEL("Parcel"),
    LOCATION("Location"),
    MEMBERS("Members"),
    CONTACTS("Contacts"),
    PARTS("Parts"),
    PERECENTAGE_RENT("PercentageRent"),
    PROJECT("Project"),
    RESPONIBILITY("Responsibility"),
    SALES_EXCLUSION("SalesExclusion"),
    SITE("Site"),
    SITE_SURVEY("Site Survey"),
    SCHEDULE("Schedule"),
    SALES("sales"),
    SPACE("Space"),
    VARIABLE_RENT_OFFSET("VariableRentOffset");


    private TemplateType(String value) {
        this.value = value;
    }

    // Value the HTML selector will recognize.
    private String value;

    public String getValue() {
        return value;
    }

    public static TemplateType fromString(String name) {
        if (isNullOrEmpty(name)) {
            throw new IllegalArgumentException("Required argument 'name' is null/empty!");
        }

        for (TemplateType tt : TemplateType.values()) {
            if (name.equalsIgnoreCase(tt.getValue())) {
                return tt;
            }
        }

        throw new IllegalArgumentException(String.format("Specified name [%s] is unknown!", name));
    }
}
