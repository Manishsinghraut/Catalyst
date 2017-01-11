package com.lucernex.qa.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.google.common.base.CharMatcher.WHITESPACE;
import static com.google.common.base.Strings.isNullOrEmpty;

public class TildaCompare {
    private static final Pattern tildaRE = Pattern.compile("~~([^#]*)#~");

    /**
     * Returns list of parts extracted from the specified ~~x#~ type of localized
     * values:
     *
     * ~~Manage Members#~/~~Contacts#~ ==> ['Manage Members', 'Contacts']
     *
     * @param localized - source of a localized list of words
     */
    public static List<String> extract(String localized) {
        if (isNullOrEmpty(localized)) {
            return null;
        }

        List<String> parts = new ArrayList<String>();

        synchronized (tildaRE) {
            Matcher m = tildaRE.matcher(localized);

            while (m.find()) {
                String part = m.group(1);

                if (part != null) {
                    parts.add(part);
                }
            }
        }

        if (parts.isEmpty()) {
            parts.add(localized);
        }

        return parts;
    }

    public static boolean matches(String expected, String actual) {
        if (expected == null && actual == null) {
            return true;
        }
        if (expected != null && actual == null) {
            return false;
        }
        if (expected == null) {
            return false;
        }

        expected = WHITESPACE.removeFrom(expected);
        actual   = WHITESPACE.removeFrom(actual);

        synchronized (tildaRE) {
            Matcher        m = tildaRE.matcher(actual);
            StringBuilder sb = new StringBuilder();
            int        count = 0;

            while (m.find()) {
                String value = m.group(1);

                if (value != null) {
                    sb.append(value);
                    ++count;
                }
            }

            if (count > 0) {
                actual = sb.toString();
            }
        }

        return expected.equalsIgnoreCase(actual);
    }
}
