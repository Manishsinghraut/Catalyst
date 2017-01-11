package com.lucernex.qa.utils;

import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;

public class TildaCompareTest {
    @Test
    public void extract() {
        String localized = "~~Manage Members#~/~~Contacts#~";

        List<String> parts = TildaCompare.extract(localized);

        assertNotNull(parts);
        assertEquals(2, parts.size());
        assertEquals("Manage Members", parts.get(0));
        assertEquals("Contacts",       parts.get(1));

        localized = "~~Manage Forms#~";
        parts = TildaCompare.extract(localized);

        assertNotNull(parts);
        assertEquals(1, parts.size());
        assertEquals("Manage Forms", parts.get(0));

        localized = "Manage Forms";
        parts = TildaCompare.extract(localized);

        assertNotNull(parts);
        assertEquals(1, parts.size());
        assertEquals("Manage Forms", parts.get(0));
    }

    @Test
    public void matches() {
        String   actual = "~~Manage#~ ~~Programs#~";
        String expected = "Manage Programs";

        assertTrue(TildaCompare.matches(expected, actual));

        actual   = "Manage Programs";
        expected = "Manage Programs";

        assertTrue(TildaCompare.matches(expected, actual));

        actual   = "~~Manage#~";
        expected = "Manage";

        assertTrue(TildaCompare.matches(expected, actual));

        actual   = "~~#~";
        expected = "";

        assertTrue(TildaCompare.matches(expected, actual));
    }
}
