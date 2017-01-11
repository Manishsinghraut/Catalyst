package com.lucernex.qa.data;

import com.google.common.collect.ImmutableMap;
import org.apache.commons.lang.time.DateFormatUtils;

import java.util.Calendar;
import java.util.Map;

/**
 * Created by andrews on 8/26/2014.
 */
public interface IPresetFunctions {

    public enum FunctionNameEnum {
        FN_CURRENT_DATE_MDY,
        FN_CURRENT_DATE_ISO;

        public static boolean contains(String name) {
            boolean retValue = false;
            for(FunctionNameEnum fnEnum : FunctionNameEnum.values()) {
                if(fnEnum.name().equals(name)) {
                    retValue = true;
                    break;
                }
            }
            return retValue;
        }
    }


    public Map<FunctionNameEnum, String> functions = new ImmutableMap.Builder<FunctionNameEnum, String>()
                                                     .put(FunctionNameEnum.FN_CURRENT_DATE_MDY, DateFormatUtils.format(Calendar.getInstance(), "MM/dd/yyyy"))
                                                     .put(FunctionNameEnum.FN_CURRENT_DATE_ISO, DateFormatUtils.format(Calendar.getInstance(), "yyyy-MM-dd"))
                                                     .build();
}
