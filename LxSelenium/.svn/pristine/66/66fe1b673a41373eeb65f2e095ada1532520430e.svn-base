package com.lucernex.qa.utils;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

/**
 * Implements a double dispatch facility which is similar to the gang-of-four
 * visitor pattern. The problem with the gang-of-four approach is the visitable
 * classes must implement an accept(Visitor) method. This visitor avoids that
 * requirement by using reflection to determine the object type and calls a
 * type specific visit(Object) method. The most common use of this class is to
 * extend it and add a visit() method for each object type you wish to visit.
 */
public class AbstractVisitor implements Visitor {
    /** Maps visitor classes to the various visit() methods it implements. */
	protected static Map<Class<?>,Map<Class<?>,Method>> classToMethods =
		new HashMap<Class<?>,Map<Class<?>,Method>>();

    /**
     * Returns the visit() method which accepts an argument of the specified
     * type.
     */
	protected Method getMethod(Class<?> c) {
        // Trival rejection, the argument type cannot be null.
        if (c == null) {
			return null;
		}

        // Maps argument type to appropriate visit() method.
        Map<Class<?>,Method> methods = (HashMap<Class<?>,Method>) classToMethods.get(getClass());

        // If we don't yet have an entry for the calling class, then add one.
        if (methods == null) {
        	methods = new HashMap<Class<?>,Method>(17);
			classToMethods.put(getClass(),methods );
		}

        Method m = (Method) methods.get(c);

        // We found the method in our cache, so return it.
        if (m != null) {
			return m;
		}

        Class<?> clazz = getClass();
        Class<?> newc = c;

        // Walk the inheritance tree looking for appropriate visit method.
        while (m == null && newc != null && newc != Object.class) {
            try {
                m = clazz.getMethod("visit", new Class[]{newc});
            } catch (NoSuchMethodException e) {
                newc = newc.getSuperclass();
            }
        }

        // Try the interfaces
        if (m == null) {
			newc = c;
		}

        while (m == null && newc != null && newc != Object.class) {
            Class<?>[] interfaces = newc.getInterfaces();

            for (int i = 0; m == null && i < interfaces.length; i++) {
                String method = interfaces[i].getName();

                method = method.substring(method.lastIndexOf('.') + 1);

                try {
                    m = clazz.getMethod(
                            method,
                            new Class<?>[]{interfaces[i]}
                    );
                } catch (NoSuchMethodException e) {
                    Method rval = getMethod(interfaces[i]);

                    if (rval != null) {
						return rval;
					}
                }
            }

            newc = newc.getSuperclass();
        }

        if (!c.isInterface() && m == null) {
            try {
                m = clazz.getMethod("visit", new Class[]{Object.class});
            } catch (Exception e) {
                // this shouldn't happen
            }
        }

        if (m != null) {
			methods.put(c, m);
		}

        return m;
    }

    /**
     * Calls the appropriate visit() method for the specified object type. For
     * example, if you called dispatch(Apple) then we would call visit(Apple).
     *
     * @throws VisitException when called visit() method throws an exception
     */
    public void dispatch(Object object) throws VisitException {
        try {
            Method method = getMethod(object.getClass());
            Object result = method.invoke(this, new Object[]{object});

            if (!Boolean.FALSE.equals(result) && object instanceof Visitable) {
				callAccept((Visitable) object);
			}
        } catch (InvocationTargetException ex) {
            throw new VisitException(ex.getTargetException());
        } catch (Exception e) {
            throw new VisitException(e);
        }
    }

    /**
     * Visit method of last resort as no other visit method satisfied search.
     * Recommend subclasses override this method if they wish to catch unexpected
     * object types, e.g. the subclass doesn't have a visit() method matching the
     * object type.
     */
    public void visit(Object object) {
    }

    /**
     * Calls the accept() method of the specified visitable object.
     */
    public void callAccept(Visitable v)
            throws Exception {
        v.accept(this);
    }
}
