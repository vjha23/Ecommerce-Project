
package com.ecom.entities;


public class product {
    private int pid;
    private String ptitle;
    private String pdesc;
    private String pPhoto;
    private int pPrice;
    private int pDiscount;
    private int pQuantity;
    private category cat;

    public product() {
    }

    public product(int pid, String ptitle, String pdesc, String pPhoto, int pPrice, int pDiscount, int pQuantity, category cat) {
        this.pid = pid;
        this.ptitle = ptitle;
        this.pdesc = pdesc;
        this.pPhoto = pPhoto;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
        this.cat =cat;
    }

    public product(String ptitle, String pdesc, String pPhoto, int pPrice, int pDiscount, int pQuantity, category cat) {
        this.ptitle = ptitle;
        this.pdesc = pdesc;
        this.pPhoto = pPhoto;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
        this.cat =cat;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPtitle() {
        return ptitle;
    }

    public void setPtitle(String ptitle) {
        this.ptitle = ptitle;
    }

    public String getPdesc() {
        return pdesc;
    }

    public void setPdesc(String pdesc) {
        this.pdesc = pdesc;
    }

    public String getpPhoto() {
        return pPhoto;
    }

    public void setpPhoto(String pPhoto) {
        this.pPhoto = pPhoto;
    }

    public int getpPrice() {
        return pPrice;
    }

    public void setpPrice(int pPrice) {
        this.pPrice = pPrice;
    }

    public int getpDiscount() {
        return pDiscount;
    }

    public void setpDiscount(int pDiscount) {
        this.pDiscount = pDiscount;
    }

    public int getpQuantity() {
        return pQuantity;
    }

    public void setpQuantity(int pQuantity) {
        this.pQuantity = pQuantity;
    }

    public category getCategory() {
        return cat;
    }

    public void setCategory(category cat) {
        this.cat = cat;
    }
    
    //  Calculating price
    public int getPriceAfterDiscount(){
        int d=(int) ((this.getpDiscount()/100.0) * this.getpPrice());
        return this.getpPrice() -d;
    }
}
