package com.lucernex.qa.utils;

/**
 * Classes which wish to implement the gang-of-four visitor pattern may
 * implement this method. This interface is optional since the associated
 * AbstractVisitor class uses reflection to discover the visit() methods supplied
 * by subclasses of AbstractVisitor.
 */
public interface Visitor
{
  void visit(Object object);
}

