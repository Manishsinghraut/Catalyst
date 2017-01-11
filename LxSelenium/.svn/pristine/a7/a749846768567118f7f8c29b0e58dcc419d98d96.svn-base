package com.lucernex.qa.views.components;

import com.google.common.base.Function;
import com.google.common.collect.Lists;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.openqa.selenium.WebElement;

import static junit.framework.Assert.fail;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by andrews on 8/1/2014.
 */
public class CompositeField extends Field {

    private List<Field> fields = Lists.newArrayList();

    public CompositeField(boolean required, String label, String name, List<Field> fields) {
        super(required, label, name, null);
        this.fields = fields;
    }

    /**
     * Returns comma-delimited values from all available fields
     */
    @Override
    public String getValue() {

        List<String> individualValues = Lists.transform(fields, new Function<Field, String>() {
            @Override
            public String apply(Field field) {
                return field.getValue();
            }
        });

        return StringUtils.join(individualValues, ",");
    }


    @Override
    public void setValue(String delimitedString) {
        String[] individualValues = StringUtils.split(delimitedString, ",");
        if(individualValues == null || individualValues.length != fields.size()) {
            fail(String.format("Passed string delimited string values %s doesn't equal to found fields %s", individualValues == null ? 0 : individualValues.length, fields.size()));
        }
        for(int i=0; i < fields.size(); i++) {
            fields.get(i).setValue(individualValues[i]);
        }
    }

    @Override
    @Deprecated
    public WebElement getElement() {
        throw new UnsupportedOperationException("Cannot get a single element from list of fields and elements. Use getElementByIndex(...)");
    }

    public WebElement getElementByIndex(int indexNum) {
        if(CollectionUtils.isEmpty(fields) || fields.get(indexNum) == null) {
            fail(String.format("Passed index is not found list fields with size - %s", fields.size()));
        }

        return fields.get(indexNum).getElement();
    }

    public static void main(String[] args) {
        CompositeField fld = new CompositeField(true, "Notice Period", "NoticePeriod", new ArrayList<Field>());

        System.out.println(fld);
    }


}
