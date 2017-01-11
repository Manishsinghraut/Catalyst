package com.lucernex.qa.utils;

/**
 * Classes which would like to be visitable gang-of-four visitor classes which
 * implement the Visitor class may optionally implement this interface. This is
 * optional since the associated AbstractVisitor class uses reflection to avoid
 * the requirement of implementing an interface such as this. The standard gang-
 * of-four visitor pattern requires something like a Visitable interface.
 */
public interface Visitable
{
  void accept(Visitor v);
}

