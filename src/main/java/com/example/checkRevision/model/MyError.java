package com.example.checkRevision.model;

import java.util.ArrayList;

public class MyError {
    private ArrayList<String> errors = new ArrayList<String>();

    public MyError() {
    }

    public ArrayList<String> getErrors() {
        return errors;
    }

    public void setErrors(String errors) {
        this.errors.add(errors);
    }
}
