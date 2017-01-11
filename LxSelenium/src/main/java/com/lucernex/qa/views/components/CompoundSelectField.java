package com.lucernex.qa.views.components;

import org.apache.commons.lang.StringUtils;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import static com.google.common.base.Strings.isNullOrEmpty;
import static junit.framework.Assert.assertTrue;

/**
 * Represents a pair of select fields with >> and << arrows between that move
 * selection(s) to/from an Available and Selected set.
 *
 * Available:    Selected:
 * Item-1     >> Item-2
 * Item-2     <<
 * ...
 * Item-n
 */
public class CompoundSelectField extends Field {
    private Select available = null;
    private Select selected = null;
    private WebElement moveRightBtn;
    private WebElement moveLeftBtn;

    private String toString(Set<String> set) {
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
     * Do what it takes to make the Selected set equal to the specified tab
     * separated list of values.
     *
     * @param value - tab separated set of values
     */
    @Override
    public void setValue(String value) {
        // A null/empty value means we want to move all items from Selected to Available.
        if (isNullOrEmpty(value)) {
            List<WebElement> options = selected.getOptions();

            // If there are items in the Selected list, move them to Available list.
            if (options != null && options.size() > 0) {
                for (int i = 0; i < options.size(); i++) {
                    WebElement option = options.get(i);

                    if (!option.isSelected()) {
                        selected.selectByIndex(i);
                    }

                    moveLeftBtn.click();
                }
            }

            return;
        }

        String[]    values = value.split("\t");
        Set<String> wanted = new TreeSet<String>();

        // Build a set of values that we want to see in the Available list.
        for (String v : values) {
            wanted.add(v);
        }

        List<WebElement> selectOptions = selected.getOptions();

        // If there are some items in the Selected list, then move the unwanted
        // items to Available list.
        if (selectOptions != null && selectOptions.size() > 0) {
            int toMove = 0;

            for (int i = 0; i < selectOptions.size(); i++) {
                WebElement  option = selectOptions.get(i);
                String optionValue = option.getText();

                // If the current option is selected, then...
                if (option.isSelected()) {
                    if (wanted.contains(optionValue)) {
                        selected.deselectByIndex(i); // we don't want to move this one
                        wanted.remove(optionValue);  // already where we want it to be
                    } else {
                        ++toMove;
                    }

                // otherwise not selected, should it be?
                } else if (!wanted.contains(optionValue)) {
                    selected.selectByIndex(i); // we want to move it to the left
                    ++toMove;
                }

                // If we have some items in the Selected list to move to the
                // Available list, then click the << button.
                if (toMove > 0) {
                    moveLeftBtn.click();
                }
            }
        }

        List<WebElement> availOptions = available.getOptions();

        if (availOptions != null && availOptions.size() > 0) {
            int toMove = 0;

            available.deselectAll();

            for (int i = 0; i < availOptions.size(); i++) {
                WebElement  option = availOptions.get(i);
                String optionValue = option.getText();

                if (wanted.contains(optionValue)) {
                    available.selectByIndex(i); // we want to move it to the right
                    wanted.remove(optionValue);
                    ++toMove;
                }
            }

            // If we have some items in the Available list to move to the
            // Selected list, then click the >> button.
            if (toMove > 0) {
                moveRightBtn.click();
            }
        }

        // If we didn't see some of the desired items, then complain.
        assertTrue(
            String.format("Field '%s' did not have these values '%s' to select!", getLabel(), toString(wanted)),
            wanted.isEmpty()
        );
    }

    @Override
    public String getValue() {
        //TODO  Need to implement this method!!!!
        return StringUtils.EMPTY;
    }

    public CompoundSelectField(
        boolean        required,
        String            label,
        String             name,
        Select        available,
        Select         selected,
        WebElement moveRightBtn,
        WebElement  moveLeftBtn
    ) {
        super(required, label, name, null);
        this.available = available;
        this.selected = selected;
        this.moveRightBtn = moveRightBtn;
        this.moveLeftBtn = moveLeftBtn;
    }

    public CompoundSelectField() {
    }
}
