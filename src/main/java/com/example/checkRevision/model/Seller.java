package com.example.checkRevision.model;

import com.example.checkRevision.variables.MyVariables;
import com.mysql.cj.protocol.a.authentication.MysqlClearPasswordPlugin;

import java.sql.Timestamp;

public class Seller extends Buyer{
    private String nic;
    private String nicPhotoFront;
    private String nicPhotoBack;
    private String bankAccountNo;
    private String bankName;
    private String bankBranch;

    public Seller(String username, String password, int salt, Timestamp dateJoined, String firstName, String lastName, String houseNo, String street, String city, String district, String province, boolean sellerApplied, String phoneNo, String email, String nic, String nicPhotoFront, String nicPhotoBack, String bankAccountNo, String bankName, String bankBranch) {
        super(username, password, "seller", salt, dateJoined, firstName, lastName, houseNo, street, city, district, province, sellerApplied, phoneNo, email);
        this.nic = nic;
        this.nicPhotoFront = nicPhotoFront;
        this.nicPhotoBack = nicPhotoBack;
        this.bankAccountNo = bankAccountNo;
        this.bankName = bankName;
        this.bankBranch = bankBranch;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public void setNicPhotoFront(String nicPhotoFront) {
        this.nicPhotoFront = nicPhotoFront;
    }

    public void setNicPhotoBack(String nicPhotoBack) {
        this.nicPhotoBack = nicPhotoBack;
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

    public String getNicPhotoFront() {
        return MyVariables.nicPhotoFrontRootURL + nicPhotoFront;
    }

    public String getNicPhotoBack() {
        return MyVariables.nicPhotoBackRootURL + nicPhotoBack;
    }
}
