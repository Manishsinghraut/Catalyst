package com.lucernex.qa.data;

/**
 * Used to provide values to fields in sales
 */
public class Sales {
    private String salesGroup;
    private String salesType;
    private String salesCategory;
    private String salesPeriod;
    private String salesYear;
    private String grossSalesAmount;
    private String netSalesAmount;
    private String currency;

    public String getGroup() {
        return salesGroup;
    }
    public void setGroup(String SalesGroup) {
        this.salesGroup = salesGroup;
    }

    public String getSalesType() {
        return salesType;
    }
    public void setSalesType(String salesType) {
        this.salesType = salesType;
    }

    public String getSalesCategory() {
        return salesCategory;
    }
    public void setSalesCategory(String salesCategory) {
        this.salesCategory = salesCategory;
    }

    public String getSalesPeriod() {
        return salesPeriod;
    }
    public void setSalesPeriod(String salesPeriod) {
        this.salesPeriod = salesPeriod;
    }

    public String getSalesYear() {   return salesYear;   }
    public void setSalesYear(String salesYear) {
        this.salesYear = salesYear;
    }

    public String getGrossSalesAmount() {
        return grossSalesAmount;
    }
    public void setGrossSalesAmount(String grossSalesAmount) {
        this.grossSalesAmount = grossSalesAmount;
    }

    public String getNetSalesAmount() {
        return netSalesAmount;
    }
    public void setNetSalesAmount(String netSalesAmount) {
        this.netSalesAmount = netSalesAmount;
    }

    public String getCurrency() {
        return currency;
    }
    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public Sales(String salesGroup, String salesType,String salesCategory,String salesPeriod,String salesYear,
                 String grossSalesAmount,String netSalesAmount,String currency) {
        this.salesGroup = salesGroup;
        this.salesType = salesType;
        this.salesCategory = salesCategory;
        this.salesPeriod = salesPeriod;
        this.salesYear = salesYear;
        this.grossSalesAmount = grossSalesAmount;
        this.netSalesAmount = netSalesAmount;
        this.currency = currency;

    }

    @Override
    public String toString() {
        return "Sales{" +
                "salesGroup='" + salesGroup + '\'' +
                ",salesType='" + salesType + '\'' +
                ",salesCategory='" + salesCategory + '\'' +
                ",salesPeriod='" + salesPeriod + '\'' +
                ",salesYear='" + salesYear + '\'' +
                ",grossSalesAmount='" + grossSalesAmount + '\'' +
                ",netSalesAmount='" + netSalesAmount + '\'' +
                ",currency='" + currency + '\'' +
                '}';
    }

    public Sales() {
    }
}
