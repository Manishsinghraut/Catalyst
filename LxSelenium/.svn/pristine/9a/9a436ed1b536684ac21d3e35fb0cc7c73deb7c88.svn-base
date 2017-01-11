package com.lucernex.qa.iwms.parsers;

import com.google.common.io.LineProcessor;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ErrorsHtmlParser implements LineProcessor<List<String>> {
    private enum State {INITIAL, SAW_TABLE, SAW_TR, SAW_TD, SAW_END_TD, SAW_END_TR, SAW_END_TABLE}

    private final static String START_TABLE = "<table style='padding: 0 6px'>";
    private final static String          TR = "<tr>";
    private final static String          TD = "<td>";
    private final static String      END_TD = "</td>";
    private final static String      END_TR = "</tr>";
    private final static String   END_TABLE = "</table>";

    private List<String> errors = new ArrayList<String>();
    private State         state = State.INITIAL;
    private StringBuilder    sb = new StringBuilder();

    public boolean processLine(String line) throws IOException {
        line = line.trim();

        if (line.isEmpty()) {
            return true;
        }

        switch (state) {
            case INITIAL:
                if (line.contains(START_TABLE)) {
                    state = State.SAW_TABLE;
                }
                break;
            case SAW_TABLE:
                if (line.startsWith(TR)) {
                    state = State.SAW_TR;
                }
                break;
            case SAW_TR:
                if (line.startsWith(TD)) {
                    state = State.SAW_TD;
                }
                break;
            case SAW_TD:
                if (line.contains(END_TD)) {
                    state = State.SAW_END_TD;
                } else if (!line.isEmpty()) {
                    sb.append(' ');
                    sb.append(line);
                }
                break;
            case SAW_END_TD:
                if (line.contains(END_TR)) {
                    state = State.SAW_END_TR;
                    if (sb.length() > 0) {
                        errors.add(sb.toString());
                        sb.setLength(0);
                    }
                    break;
                }
                break;
            case SAW_END_TR:
                if (line.startsWith(TR)) {
                    state = State.SAW_TR;
                } else if (line.startsWith(END_TABLE)) {
                    state = State.SAW_END_TABLE;
                }
                break;
            case SAW_END_TABLE:
                break;
            default:
                break;
        }

        return true;
    }

    public List<String> getResult() {
        return errors;
    }
}
