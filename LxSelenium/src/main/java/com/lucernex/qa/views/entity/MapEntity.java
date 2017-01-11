package com.lucernex.qa.views.entity;

import com.lucernex.qa.views.BaseView;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by rupinderk on 5/29/2014.
 */
public class MapEntity extends BaseView{



    public static Map<String, String> mapEntityWithValue() {
        Map<String, String> _entityValue;
        _entityValue = new HashMap<String, String>();
        _entityValue.put("Portfolio", "Program");
        _entityValue.put("Contract", "contract");
        _entityValue.put("Capital Program", "CapitalProgram");
        _entityValue.put("Site", "potentialProject");
        _entityValue.put("Project", "project");
        _entityValue.put("Prototype", "prototype");
        _entityValue.put("Facility", "facility");
        _entityValue.put("Parcel", "parcel");
        _entityValue.put("Location", "location");

        return _entityValue;

    }
}
