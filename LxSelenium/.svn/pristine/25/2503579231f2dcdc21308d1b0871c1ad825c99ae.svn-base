package com.lucernex.qa.data;

import static com.google.common.base.Strings.isNullOrEmpty;

/**
 * Represents the set of contract spreadsheet template types supported by IWMS.
 */
public enum ContractTemplateType {
    ALLOWANCE("Allowance"),
    CONTRACT("Contract"),
    CONTRACT_TERM("ContractTerm"),
    CONTRACT_AMENDMENT("ContractAmendment"),
    COVENANT("Covenant"),
    INSURANCE("Insurance"),
    PERCENTAGE_RENT("PercentageRent"),
    RESPONSIBILITY("Responsibility"),
    SALES_EXCLUSION("SalesExclusion"),
    VARIABLE_RENT_OFFSET("VariableRentOffset");

    private ContractTemplateType(String value) {
        this.value = value;
    }

    // Value the HTML selector will recognize.
    private String value;

    public String getValue() {
        return value;
    }

    public static ContractTemplateType fromString(String name) {
        if (isNullOrEmpty(name)) {
            throw new IllegalArgumentException("Required argument 'name' is null/empty!");
        }

        for (ContractTemplateType tt : ContractTemplateType.values()) {
            if (name.equalsIgnoreCase(tt.name())) {
                return tt;
            }
        }

        throw new IllegalArgumentException(String.format("Specified name [%s] is unknown!", name));
    }
}
