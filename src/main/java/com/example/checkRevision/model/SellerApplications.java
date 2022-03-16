package com.example.checkRevision.model;

import com.example.checkRevision.variables.MyVariables;

public class SellerApplications {
    private String buyerFirstName;
    private String buyerLastName;
    private String buyerId;
    private String nic;
    private String nicPhotoFront;
    private String nicPhotoBack;
    private boolean isAccepted;
    private boolean isRejected;
    private String bankAccountNo;
    private String bankName;
    private String bankBranch;

    public SellerApplications(String buyerFirstName, String buyerLastName, String buyerId, String nic, String nicPhotoFront, String nicPhotoBack, boolean isAccepted, boolean isRejected, String bankAccountNo, String bankName, String bankBranch) {
        this.buyerFirstName = buyerFirstName;
        this.buyerLastName = buyerLastName;
        this.buyerId = buyerId;
        this.nic = nic;
        this.nicPhotoFront = nicPhotoFront;
        this.nicPhotoBack = nicPhotoBack;
        this.isAccepted = isAccepted;
        this.isRejected = isRejected;
        this.bankAccountNo = bankAccountNo;
        this.bankName = bankName;
        this.bankBranch = bankBranch;

    }

    public String getBuyerFirstName() {
        return buyerFirstName;
    }

    public void setBuyerFirstName(String buyerFirstName) {
        this.buyerFirstName = buyerFirstName;
    }

    public String getBuyerLastName() {
        return buyerLastName;
    }

    public void setBuyerLastName(String buyerLastName) {
        this.buyerLastName = buyerLastName;
    }

    public String getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(String buyerId) {
        this.buyerId = buyerId;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getNicPhotoFront() {
        return MyVariables.nicPhotoFrontRootURL + nicPhotoFront;
    }

    public String getNicPhotoFrontForSaveInDB() {
        return nicPhotoFront;
    }

    public void setNicPhotoFront(String nicPhotoFront) {
        this.nicPhotoFront = nicPhotoFront;
    }

    public String getNicPhotoBack() {
        return MyVariables.nicPhotoBackRootURL + nicPhotoBack;
    }

    public String getNicPhotoBackForSaveInDB() {
        return nicPhotoBack;
    }

    public void setNicPhotoBack(String nicPhotoBack) {
        this.nicPhotoBack = nicPhotoBack;
    }

    public boolean isAccepted() {
        return isAccepted;
    }

    public void setAccepted(boolean accepted) {
        isAccepted = accepted;
    }

    public boolean isRejected() {
        return isRejected;
    }

    public void setRejected(boolean rejected) {
        isRejected = rejected;
    }

    public String getBankAccountNo() {
        return bankAccountNo;
    }

    public void setBankAccountNo(String bankAccountNo) {
        this.bankAccountNo = bankAccountNo;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getBankBranch() {
        return bankBranch;
    }

    public void setBankBranch(String bankBranch) {
        this.bankBranch = bankBranch;
    }
}
