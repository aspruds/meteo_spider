/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.spruds.meteo.model;

import com.spruds.meteo.model.types.IntValuedEnum;

public enum SourceType implements IntValuedEnum {
    GOOGLE(1),
    YR_NO(2),
    LATVIAN_STATE_ROADS(3),
    METEO_LV(4);

    private int value;
    SourceType(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }

    public static SourceType valueOf(int value) {
        for(SourceType type: values()) {
            if(type.getValue() == value) {
                return type;
            }
        }
        return null;
    }
}
