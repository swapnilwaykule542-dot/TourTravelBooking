package com.tourtravel.model;

public class Booking {

    private int bookingId;
    private int userId;
    private int packageId;
    private String bookingDate;
    private int numberOfPeople;
    private double totalAmount;
    private String status;

    public Booking() {
    }

    public Booking(int userId, int packageId,
                   String bookingDate, int numberOfPeople,
                   double totalAmount, String status) {

        this.userId = userId;
        this.packageId = packageId;
        this.bookingDate = bookingDate;
        this.numberOfPeople = numberOfPeople;
        this.totalAmount = totalAmount;
        this.status = status;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getPackageId() {
        return packageId;
    }

    public void setPackageId(int packageId) {
        this.packageId = packageId;
    }

    public String getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    }

    public int getNumberOfPeople() {
        return numberOfPeople;
    }

    public void setNumberOfPeople(int numberOfPeople) {
        this.numberOfPeople = numberOfPeople;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}