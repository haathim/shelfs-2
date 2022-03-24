package com.example.checkRevision.model;

import com.example.checkRevision.variables.MyVariables;

import java.sql.Timestamp;

public class Advertisement {
    private long adId;
    private String sellerId;
    private String title;
    private String author;
    private int price ;
    private String isbn;
    private String language;
    private int available;
    private String description;
    private String bookPhotoFront;
    private String bookPhotoBack;
    private String category;
    private Timestamp dateAdded;

    public Advertisement(long adId, String sellerId, String title, String author, int price, String isbn, String language, int available, String description, String bookPhotoFront, String bookPhotoBack, String category, Timestamp dateAdded) {
        this.adId = adId;
        this.sellerId = sellerId;
        this.title = title;
        this.author = author;
        this.price = price;
        this.isbn = isbn;
        this.language = language;
        this.available = available;
        this.description = description;
        this.bookPhotoFront = bookPhotoFront;
        this.bookPhotoBack = bookPhotoBack;
        this.category = category;
        this.dateAdded = dateAdded;
    }

    public long getAdId() {
        return adId;
    }

    public void setAdId(long adId) {
        this.adId = adId;
    }

    public String getSellerId() {
        return sellerId;
    }

    public void setSellerId(String sellerId) {
        this.sellerId = sellerId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public int getAvailable() {
        return available;
    }

    public void setAvailable(int available) {
        this.available = available;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBookPhotoFront() {
        return MyVariables.bookPhotoFrontRootURL + bookPhotoFront;
    }

    public void setBookPhotoFront(String bookPhotoFront) {
        this.bookPhotoFront = bookPhotoFront;
    }

    public String getBookPhotoBack() {
        return MyVariables.bookPhotoBackRootURL + bookPhotoBack;
    }

    public void setBookPhotoBack(String bookPhotoBack) {
        this.bookPhotoBack = bookPhotoBack;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        if(MyVariables.getCategories().contains(category)){
            this.category = category;
        }
        else{
            this.category = "invalid";
        }
    }

    public Timestamp getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(Timestamp dateAdded) {
        this.dateAdded = dateAdded;
    }

    @Override
    public String toString() {
        return "Advertisement{" +
                "adId=" + adId +
                ", sellerId='" + sellerId + '\'' +
                ", title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", price=" + price +
                ", isbn='" + isbn + '\'' +
                ", language='" + language + '\'' +
                ", available=" + available +
                ", description='" + description + '\'' +
                ", bookPhotoFront='" + bookPhotoFront + '\'' +
                ", bookPhotoBack='" + bookPhotoBack + '\'' +
                ", category='" + category + '\'' +
                ", dateAdded=" + dateAdded +
                '}';
    }
}
