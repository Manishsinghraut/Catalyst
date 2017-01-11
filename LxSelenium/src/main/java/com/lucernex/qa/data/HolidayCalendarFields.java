package com.lucernex.qa.data;

/**
 * Created by RLE0097 on 7/14/2015.
 */
public class HolidayCalendarFields {
    private String holidayName;
    private String year;
    private String month;
    private String day;

    public String getHolidayName() {
        return holidayName;
    }

    public void setHolidayName(String holidayName) {
        this.holidayName = holidayName;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    @Override
    public String toString() {
        return "HolidayCalendarFields{" +
                "holidayName='" + holidayName + '\'' +
                ", year='" + year + '\'' +
                ", month='" + month + '\'' +
                ", day='" + day + '\'' +
                '}';
    }

    public HolidayCalendarFields(String holidayName,String year, String month,String day) {
        this.holidayName = holidayName;
        this.year = year;
        this.month = month;
        this.day = day;
    }

    public HolidayCalendarFields() {
    }
}
