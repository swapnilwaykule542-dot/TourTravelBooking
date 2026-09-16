package com.tourtravel.model;

public class TourPackage {

    private int packageId;
    private String packageName;
    private String destination;
    private String description;
    private String duration;
    private double price;
    private int availableSeats;
    private String image;

    public TourPackage() {
    }

    public TourPackage(String packageName, String destination,
                       String description, String duration,
                       double price, int availableSeats,
                       String image) {

        this.packageName = packageName;
        this.destination = destination;
        this.description = description;
        this.duration = duration;
        this.price = price;
        this.availableSeats = availableSeats;
        this.image = image;
    }

    public int getPackageId() {
        return packageId;
    }

    public void setPackageId(int packageId) {
        this.packageId = packageId;
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getAvailableSeats() {
        return availableSeats;
    }

    public void setAvailableSeats(int availableSeats) {
        this.availableSeats = availableSeats;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}