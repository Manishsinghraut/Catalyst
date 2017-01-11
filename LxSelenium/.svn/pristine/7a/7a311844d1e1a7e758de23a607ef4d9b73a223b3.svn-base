package com.lucernex.qa.data;

import static com.google.common.base.Strings.isNullOrEmpty;

/**
 * Class of IWMS user.
 */
public enum UserClass {
    Administrator,
    Broker,
    Delete,
    Edit,
    No_Access,
    NoAccessInAdminDash,
    View;

    public static UserClass fromString(String name) {
        if (isNullOrEmpty(name)) {
            throw new IllegalArgumentException("Required argument 'name' is null/empty!");
        }

        for (UserClass uc : UserClass.values()) {
            if (name.equalsIgnoreCase(uc.name())) {
                return uc;
            }
        }

        throw new IllegalArgumentException(String.format("Specified name [%s] is unknown!", name));
    }
}
