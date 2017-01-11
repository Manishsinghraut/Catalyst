package com.lucernex.qa.data;

/**
 * Created by RLE0097 on 6/9/2015.
 */
public class ValueField {
    private String valueField;


    public String getValueField() {
        return valueField;
    }

    public void setValueField(String valueField) {
        this.valueField= valueField;
    }

    @Override
    public String toString() {
        return "Field{" +
                "valueField='" + valueField + '\'' +
                '}';
    }

    public ValueField(String valueField) {
        this.valueField = valueField;
    }

    public ValueField() {
    }
}
