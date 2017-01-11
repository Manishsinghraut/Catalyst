package com.lucernex.qa.utils;

/**
 * Exception throw by visited code.
 */
public class VisitException extends Exception {
	private static final long serialVersionUID = -7126047971180049633L;
	
	private Throwable targetException = null;

    public Throwable getTargetException() {
        return targetException;
    }

    public VisitException() {
    }

    public VisitException(Throwable targetException) {
        this.targetException = targetException;
    }
}
