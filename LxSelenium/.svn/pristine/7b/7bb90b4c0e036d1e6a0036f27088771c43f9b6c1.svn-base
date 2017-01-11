package com.lucernex.qa.datamart;

import java.util.List;

/**
 * Represents a row from a grid.
 */
public class Row {
    // Optional actions cell which has links.
    private ActionsCell actionsCell = null;

    public ActionsCell getActionsCell() {
        return actionsCell;
    }

    private List<String> cells;

    public List<String> getCells() {
        return cells;
    }

    public Row(List<String> cells) {
        this.cells = cells;
    }

    public Row(ActionsCell actionsCell, List<String> cells) {
        this.actionsCell = actionsCell;
        this.cells = cells;
    }
}
