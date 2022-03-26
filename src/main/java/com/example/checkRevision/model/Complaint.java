package com.example.checkRevision.model;

public class Complaint {
    private long complaintId;
    private String title;
    private String description;
    private boolean readByAdmin;
    private String buyerId;
    private String reply;
    private String buyerName;

    public Complaint(long complaintId, String title, String description, boolean readByAdmin, String buyerId, String reply, String buyerName) {
        this.complaintId = complaintId;
        this.title = title;
        this.description = description;
        this.readByAdmin = readByAdmin;
        this.buyerId = buyerId;
        this.reply = reply;
        this.buyerName = buyerName;
    }

    public String getBuyerName() {
        return buyerName;
    }

    public void setBuyerName(String buyerName) {
        this.buyerName = buyerName;
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

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }
}
