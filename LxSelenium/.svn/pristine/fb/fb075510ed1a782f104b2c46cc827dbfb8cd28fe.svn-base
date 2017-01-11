package com.lucernex.qa.iwms.parsers;

import com.google.common.io.LineProcessor;
import com.lucernex.qa.iwms.domain.ImportDataResults;

import java.io.IOException;
import java.io.PrintStream;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.google.common.base.Preconditions.checkState;

/**
 * Parser of the IWMS import data page that detects when the import job has
 * finished execution.
 */
public class ImportDataParser implements LineProcessor<ImportDataResults> {
    private final static String      TABLE = "<table class='pretty'>";
    private final static String    CAPTION = "<caption>Import Summary</caption>";
    private final static String         TR = "<tr>";
    private final static String         TH = "<th>";
    private final static String         TD = "<td>";
    private final static String     END_TR = "</tr>";
    private final static String  END_TABLE = "</table>";

    private enum State {INITIAL, SAW_TABLE, SAW_CAPTION, SAW_HEADER, SAW_TR, SAW_TD, SAW_END_TABLE}

    private State state = State.INITIAL;

    private PrintStream out;
    private ImportDataResults results = new ImportDataResults();

    private StringBuilder statsLine = new StringBuilder();
    private Pattern statsRE = Pattern.compile("<tr><td>([^<]*)<\\/td><td>(\\d*)<\\/td><td>(\\d*)<\\/td><td>(\\d*)<\\/td><td>(\\d*)<\\/td><td>(\\d*)<\\/td><\\/tr>");

    public boolean processLine(String line) throws IOException {
        line = line.trim();

        if (line.isEmpty()) {
            return true;
        }

        if (out != null) {
            out.println(line);
        }

        switch (state) {
            case INITIAL:
                if (line.contains(TABLE)) {
                    state = State.SAW_TABLE;
                }
                break;
            case SAW_TABLE:
                if (line.startsWith(CAPTION)) {
                    state = State.SAW_CAPTION;
                }
                break;
            case SAW_CAPTION:
                if (line.startsWith(TR) && line.contains(TH)) {
                    state = State.SAW_HEADER;
                }
                break;
            case SAW_HEADER:
                if (line.contains(END_TABLE)) {
                    state = State.SAW_END_TABLE;
                    break;
                }

                statsLine.append(line);
                if (line.contains(END_TR)) {
                    Matcher m = statsRE.matcher(statsLine.toString());

                    // Do we recognize the expected stats row?
                    if (m.find()) {
                        int groups = m.groupCount();

                        checkState(groups == 6);

                        String objectType = m.group(1);
                        int      failures = Integer.parseInt(m.group(2));
                        int      warnings = Integer.parseInt(m.group(3));
                        int       creates = Integer.parseInt(m.group(4));
                        int       updates = Integer.parseInt(m.group(5));
                        int       deletes = Integer.parseInt(m.group(6));

                        // Record the import stats from the current row.
                        results.putCount(objectType, ImportDataResults.ResultsType.Failures, failures);
                        results.putCount(objectType, ImportDataResults.ResultsType.Warnings, warnings);
                        results.putCount(objectType, ImportDataResults.ResultsType.Creates, creates);
                        results.putCount(objectType, ImportDataResults.ResultsType.Updates, updates);
                        results.putCount(objectType, ImportDataResults.ResultsType.Deletes, deletes);
                    }

                    state = State.SAW_HEADER;
                    statsLine.setLength(0);
                }
                break;
            case SAW_END_TABLE:
                break;
        }

        return true;
    }

    public ImportDataResults getResult() {
        return results;
    }

    public ImportDataParser(PrintStream out) {
        this.out = out;
    }

    public ImportDataParser() {
        this.out = null;
    }
}
