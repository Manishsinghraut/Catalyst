package com.lucernex.qa.data;

/**
 * Used to provide values to fields in sales
 */
public class Receipts {
    private String effectiveDate;
    private String periodYear;
    private String periodMonth;
    private String receiptNumber;
    private String receiptType;
    private String amountReceived;
    private String currencyType;
    private String amountNotAllocated;

    public String getEffectiveDate() {
        return effectiveDate;
    }
    public void setEffectiveDate(String effectiveDate) {
        this.effectiveDate = effectiveDate;
    }

    public String getPeriodYear() {
        return periodYear;
    }
    public void setPeriodYear(String periodYear) {
        this.periodYear = periodYear;
    }

    public String getPeriodMonth() {
        return periodMonth;
    }
    public void setPeriodMonth(String periodMonth) {
        this.periodMonth = periodMonth;
    }

    public String getReceiptNumber() {
        return receiptNumber;
    }
    public void setReceiptNumber(String receiptNumber) {
        this.receiptNumber = receiptNumber;
    }

    public String getReceiptType() {   return receiptType;   }
    public void setReceiptType(String receiptType) {
        this.receiptType = receiptType;
    }

    public String getAmountReceived() {
        return amountReceived;
    }
    public void setAmountReceived(String amountReceived) {
        this.amountReceived = amountReceived;
    }

    public String getCurrencyType() {
        return currencyType;
    }
    public void setCurrencyType(String currencyType) {
        this.currencyType = currencyType;
    }

    public String getAmountNotAllocated() {
        return amountNotAllocated;
    }
    public void setAmountNotAllocated(String amountNotAllocated) {
        this.amountNotAllocated = amountNotAllocated;
    }

    public Receipts(String effectiveDate, String periodYear, String periodMonth, String receiptNumber, String receiptType,
                    String amountReceived, String currencyType, String amountNotAllocated) {
        this.effectiveDate = effectiveDate;
        this.periodYear = periodYear;
        this.periodMonth = periodMonth;
        this.receiptNumber = receiptNumber;
        this.receiptType = receiptType;
        this.amountReceived = amountReceived;
        this.currencyType = currencyType;
        this.amountNotAllocated = amountNotAllocated;

    }

    @Override
    public String toString() {
        return "Receipts{" +
                "effectiveDate='" + effectiveDate + '\'' +
                ",periodYear='" + periodYear + '\'' +
                ",periodMonth='" + periodMonth + '\'' +
                ",receiptNumber='" + receiptNumber + '\'' +
                ",receiptType='" + receiptType + '\'' +
                ",amountReceived='" + amountReceived + '\'' +
                ",currencyType='" + currencyType + '\'' +
                ",amountNotAllocated='" + amountNotAllocated + '\'' +
                '}';
    }

    public Receipts() {
    }
}
