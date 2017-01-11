package com.lucernex.qa.iwms.parsers;

import com.google.common.io.LineProcessor;
import com.lucernex.qa.iwms.domain.ImportDataResults;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.google.common.base.Preconditions.checkState;

/**
 * Parser of the IWMS import data page that detects when the import job has
 * finished execution (for files which are legacy files vs RESTful xml).
 */
public class LegacyImportDataParser implements LineProcessor<ImportDataResults> {
    private final static String       DIV = "<div class='frmNote'>";
    private final static String   END_DIV = "</div>";
    private final static String RESET_BTN = "<input type=submit value=\"Reset\">";

    private Pattern statsRE = Pattern.compile(".*Total Adds:\\s(\\d+).*Total Updates:\\s(\\d+).*Total Deletes:\\s(\\d+).*Total Failed:\\s(\\d+)");

    private enum State {INITIAL, SAW_DIV, SAW_STATS, SAW_END_DIV};

    private State state = State.INITIAL;

    private ImportDataResults results = new ImportDataResults();

    public boolean processLine(String line) throws IOException {
        line = line.trim();

        if (line.isEmpty()) {
            return true;
        }

        if (line.contains(RESET_BTN)) {
            results.setFinished(true);
            return true;
        }

        switch (state) {
            case INITIAL:
                if (line.equals(DIV)) {
                    state = State.SAW_DIV;
                }
                break;
            case SAW_DIV:
                Matcher m = statsRE.matcher(line);

                if (m.find()) {
                    int groups = m.groupCount();

                    checkState(groups == 4);

                    String objectType = "Unknown";
                    int creates = Integer.parseInt(m.group(1));
                    int updates = Integer.parseInt(m.group(2));
                    int deletes = Integer.parseInt(m.group(3));
                    int failures = Integer.parseInt(m.group(4));

                    results.putCount(objectType, ImportDataResults.ResultsType.Creates,  creates);
                    results.putCount(objectType, ImportDataResults.ResultsType.Updates,  updates);
                    results.putCount(objectType, ImportDataResults.ResultsType.Failures, failures);
                    results.putCount(objectType, ImportDataResults.ResultsType.Deletes,  deletes);
                }
                state = State.SAW_STATS;
                break;
            case SAW_STATS:
                if (line.equals(END_DIV)) {
                    state = State.SAW_END_DIV;
                }
                break;
            default:
                break;
        }

        return true;
    }

    public ImportDataResults getResult() {
        results.setFinished(true);
        return results;
    }
}
