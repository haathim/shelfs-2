package com.example.checkRevision.fileSystem;

import javax.imageio.ImageIO;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

public class MyFileHandler {

    public MyFileHandler() {
    }

    public void saveFile(Part filePart, String filePath) throws IOException {
        //get the InputStream to store the file somewhere
//        InputStream fileInputStream = filePart.getInputStream();
//        System.out.println("Error - 5");
//        //save file
//        File fileToSave = new File(filePath);
//        Files.copy(fileInputStream, fileToSave.toPath(), StandardCopyOption.REPLACE_EXISTING);
//        System.out.println("Error - 6");
        AzureUpload.uploadFile(filePart, filePath);
    }

    public void saveBookPhotos(Part bookPhotoFront, Part bookPhotoBack, int adId) throws IOException {
//        String bookPhotoFrontPath = "C:\\Users\\Lenovo\\IdeaProjects\\Reviion\\src\\main\\webapp\\uploads\\bookPhotoFront\\" + adId + ".jpg";
//        String bookPhotoBackPath = "C:\\Users\\Lenovo\\IdeaProjects\\Reviion\\src\\main\\webapp\\uploads\\bookPhotoBack\\" + adId + ".jpg";
        String bookPhotoFrontPath = "bookPhotoFront\\" + adId + ".jpg";
        String bookPhotoBackPath = "bookPhotoBack\\" + adId + ".jpg";
        System.out.println("Error - 8");
        saveFile(bookPhotoFront, bookPhotoFrontPath);
        saveFile(bookPhotoBack, bookPhotoBackPath);
    }

    public void saveBookPhotosForEdit(Part bookPhotoFront, Part bookPhotoBack, int adId, boolean validateFrontPhoto, boolean validateBackPhoto) throws IOException {
//        String bookPhotoFrontPath = "C:\\Users\\Lenovo\\IdeaProjects\\Reviion\\src\\main\\webapp\\uploads\\bookPhotoFront\\" + adId + ".jpg";
//        String bookPhotoBackPath = "C:\\Users\\Lenovo\\IdeaProjects\\Reviion\\src\\main\\webapp\\uploads\\bookPhotoBack\\" + adId + ".jpg";
        String bookPhotoFrontPath = "bookPhotoFront\\" + adId + ".jpg";
        String bookPhotoBackPath = "bookPhotoBack\\" + adId + ".jpg";
        System.out.println("Error - 8");
        if (validateFrontPhoto) {
            saveFile(bookPhotoFront, bookPhotoFrontPath);
        }
        if (validateBackPhoto) {
            saveFile(bookPhotoBack, bookPhotoBackPath);
        }
    }

    public void saveNicPhotos(Part nicPhotoFront, Part nicPhotoBack, String frontFileName, String backFileName) throws IOException {
//        String nicPhotoFrontPath = "C:\\Users\\Lenovo\\IdeaProjects\\Reviion\\src\\main\\webapp\\uploads\\nicPhotoFront\\" + buyerId + ".jpg";
//        String nicPhotoBackPath = "C:\\Users\\Lenovo\\IdeaProjects\\Reviion\\src\\main\\webapp\\uploads\\nicPhotoBack\\" + buyerId + ".jpg";
        String nicPhotoFrontPath = "nicPhotoFront\\" + frontFileName;
        String nicPhotoBackPath = "nicPhotoBack\\" + backFileName;
        saveFile(nicPhotoFront, nicPhotoFrontPath);
        saveFile(nicPhotoBack, nicPhotoBackPath);
    }

    public boolean validateImage(Part image){
        try (InputStream input = image.getInputStream()) {

            try {
                ImageIO.read(input).toString();
                // It's an image (only BMP, GIF, JPG and PNG are recognized).
            } catch (Exception e) {
                // It's not an image.
                System.out.println("Inside inner catch. Validation worked properly.");
                return false;
            }
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Inside outer catch.");
            return false;
        }

        return true;
    }


}
