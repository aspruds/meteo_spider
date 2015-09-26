/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.spruds.meteo.model;

import com.spruds.meteo.model.types.IntValuedEnum;

public enum ConditionType implements IntValuedEnum {
    PARTLY_SUNNY(1),
    SCATTERED_THUNDERSTORMS(2),
    SHOWERS(3),
    SCATTERED_SHOWERS(4),
    RAIN_AND_SNOW(5),
    OVERCAST(6),
    LIGHT_SNOW(7),
    FREEZING_DRIZZLE(8),
    CHANCE_OF_RAIN(9),
    SUNNY(10),
    CLEAR(11),
    MOSTLY_SUNNY(12),
    PARTLY_CLOUDY(13),
    MOSTLY_CLOUDY(14),
    CHANCE_OF_STORM(15),
    RAIN(16),
    CHANCE_OF_SNOW(17),
    CLOUDY(18),
    MIST(19),
    STORM(20),
    THUNDERSTORM(21),
    CHANCE_OF_TSTORM(22),
    SLEET(23),
    SNOW(24),
    ICY(25),
    DUST(26),
    FOG(27),
    SMOKE(28),
    HAZE(29),
    FLURRIES(30),
    LIGHT_RAIN(31),
    SNOW_SHOWERS(32),
    ICE_SNOW(33),
    WINDY(34),
    SCATTERED_SNOW_SHOWERS(35);

    private int value;
    ConditionType(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }

    public static ConditionType valueOf(int value) {
        for(ConditionType type: values()) {
            if(type.getValue() == value) {
                return type;
            }
        }
        return null;
    }    
}
