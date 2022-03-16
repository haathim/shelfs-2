package com.example.checkRevision.model;

public class Complaint {
    private long complaintId;
    private String title;
    private String description;
    private boolean readByAdmin;
    private String buyerId;

    public Complaint(long complaintId, String title, String description, boolean readByAdmin, String buyerId) {
        this.complaintId = complaintId;
        this.title = title;
        this.description = description;
        this.readByAdmin = readByAdmin;
        this.buyerId = buyerId;
    }

    public long getComplaintId() {
        return complaintId;
    }

    public void setComplaintId(long complaintId) {
        this.complaintId = complaintId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isReadByAdmin() {
        return readByAdmin;
    }

    public void setReadByAdmin(boolean readByAdmin) {
        this.readByAdmin = readByAdmin;
    }

    public String getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(String buyerId) {
        this.buyerId = buyerId;
    }
}
