package com.lucernex.qa.views.components;

import org.junit.Test;

import java.util.List;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertNotNull;

public class RadioGroupFieldTest {
    @Test
    public void tokenizeCapitalizedWords() {
        List<String> words = RadioGroupField.tokenizeCapitalizedWords("YesNo");

        assertNotNull(words);
        assertEquals(2, words.size());
        assertEquals("Yes", words.get(0));
        assertEquals("No", words.get(1));
    }
}
