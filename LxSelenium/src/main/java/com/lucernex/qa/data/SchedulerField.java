package com.lucernex.qa.data;

public class SchedulerField {
    private String schedulerName;


    public String getSchedulerName() {
        return schedulerName;
    }

    public void setSchedulerName(String schedulerName) {
        this.schedulerName= schedulerName;
    }

    @Override
    public String toString() {
        return "SchedulerField{" +
                "schedulerName='" + schedulerName + '\'' +
                '}';
    }

    public SchedulerField(String schedulerName) {
        this.schedulerName= schedulerName;
    }

    public SchedulerField() {
    }
}
