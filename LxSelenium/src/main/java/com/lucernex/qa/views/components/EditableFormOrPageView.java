package com.lucernex.qa.views.components;

import com.lucernex.qa.pages.components.EditableFormOrPage;
import com.lucernex.qa.browsers.BrowserDriver;
import org.openqa.selenium.support.PageFactory;

import java.util.*;
import java.util.logging.Logger;

import static com.google.common.base.Preconditions.checkArgument;
import static com.google.common.base.Preconditions.checkNotNull;
import static junit.framework.Assert.fail;

/**
 * Represents a form in the IWMS web-ui.
 */
public class EditableFormOrPageView {
    private static final Logger logger = Logger.getLogger(EditableFormOrPageView.class.getName());

    private EditableFormOrPage layout = PageFactory.initElements(BrowserDriver.getCurrentDriver(), EditableFormOrPage.class);

    /**
     * Returns the set of all field labels on the current form.
     */
    public Set<String> getAllFieldLabels() {
        return layout.getAllFieldLabels();
    }

    /**
     * Returns a map of field label to field value.
     */
    public Map<String,String> getLabelToValueMap() {
        return layout.getLabelToValueMap();
    }

    //  The fields that were entered in a previous step (for validating the data)
    private List<com.lucernex.qa.data.Field> enteredFields = null;

    /**
     * Returns a String representation of a Set<String>
     */
    public String toString(Set<String> set) {
        if (set == null || set.isEmpty()) {
            return "[]";
        }

        StringBuilder    sb = new StringBuilder();
        Iterator<String> it = set.iterator();

        sb.append('[');

        if (it.hasNext()) {
            sb.append(it.next());
        }

        while (it.hasNext()) {
            sb.append(",");
            sb.append(it.next());
        }

        sb.append(']');

        return sb.toString();
    }

    /**
     * Returns a set of field names from the set of expected names that are not
     * in the set of known names.
     *
     * @param known    - field names that are known to the form
     * @param expected - field names that are expected to exist
     */
    public Set<String> createUnknownFieldNames(Set<String> known, List<String> expected) {
        Set<String> unknown = new TreeSet<String>();

        // Make sure each expected field is a known field.
        for (String eName : expected) {
            boolean foundIt = false;

            for (String kName : known) {
                // We use contains() vs equals() so we can match 'Address' to '~~Address#~'.
                if (kName.contains(eName)) {
                    foundIt = true;
                    break;
                }
            }

            if (!foundIt) {
                unknown.add(eName);
            }
        }

        return unknown;
    }

    /**
     * Verifies that the specified set of expected fields are present in the form
     * and that they are also required fields. Further verify that there are no
     * required fields that are not accounted for via the specified list of
     * expected fields.
     *
     * @param expected - The list of all the expected required fields.
     */
    public void verifyExpectedFields(List<String> expected) {
        //  Get the required fields from the EditForTablePage
        Set<String> required = layout.getRequiredFieldLabels();

        checkNotNull(required, "Did not see any required fields!");

        Set<String> unknown = createUnknownFieldNames(required, expected);
        Set<String> missing = new TreeSet<String>();

        missing.addAll(required);

        // Build set of missing fields.
        for (String eName : expected) {
            Iterator<String> it = missing.iterator();

            while (it.hasNext()) {
                String rName = it.next();

                // We use contains() vs equals() so we can match 'Address' to '~~Address#~'.
                if (rName.contains(eName)) {
                    it.remove();
                    break;
                }
            }
        }

        // Fail if there were some required fields that were not expected.
        if (missing.size() > 0) {
            fail(String.format("Required fields %s were not specified!", this.toString(missing)));
        }

        // Fail if there were some unknown expected fields.
        if (unknown.size() > 0) {
            fail(String.format("Specified fields %s are not required fields!", this.toString(unknown)));
        }
    }

    /**
     * Returns the list of field names from the supplied list of field instances.
     *
     * @param fields
     * @return
     */
    public List<String> getFieldNames(List<com.lucernex.qa.data.Field> fields) {
        List<String> names = new ArrayList<String>(fields.size());

        for (com.lucernex.qa.data.Field f : fields) {
            names.add(f.getName());
        }

        return names;
    }

    /**
     * Enter the values into the current form as defined by the specified list of
     * fields.
     *
     * @param fields - source of values of the fields for sake of current form
     */
    public void enterFieldValues(List<com.lucernex.qa.data.Field> fields) {
        checkArgument(fields != null, "Required argument 'fields' is null!");

        Set<String> supported = layout.getAllFieldLabels();
        Set<String>   unknown = createUnknownFieldNames(supported, getFieldNames(fields));

        if (unknown.size() > 0) {
            fail(String.format("Specified fields %s are unknown!", toString(unknown)));
        }

        for (com.lucernex.qa.data.Field f : fields) {
            layout.setFieldValue(f.getName(), f.getValue());
        }

        // The dropdown fields are stubborn, have to set their values a 2nd time.
        for (com.lucernex.qa.views.components.Field field : layout.getFields()) {
            try {
                DropdownField dropdown = (DropdownField)field;

                for (com.lucernex.qa.data.Field f : fields) {
                    if (dropdown.getLabel().contains(f.getName())) {
                        dropdown.setValue(f.getValue());
                    }
                }
            } catch (ClassCastException cce) {
                // ignore
            }
        }

        this.enteredFields = fields;
    }
}
