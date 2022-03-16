package com.example.checkRevision.fileSystem;

import com.azure.storage.blob.*;
import com.azure.storage.blob.models.*;
import com.example.checkRevision.variables.sensitiveVariables;

import javax.servlet.http.Part;
import java.io.*;


public class AzureUpload {

    public static void uploadFile(Part filePart, String filePath) throws IOException {

        String connectStr = sensitiveVariables.azureConnectionStr;

        // Create a BlobServiceClient object which will be used to create a container client
        BlobServiceClient blobServiceClient = new BlobServiceClientBuilder().connectionString(connectStr).buildClient();

        //Create a unique name for the container

        String containerName = "javacodeimageupload";

        // Create the container and return a container client object
        BlobContainerClient containerClient = blobServiceClient.getBlobContainerClient(containerName);

        // Get a reference to a blob
        BlobClient blobClient = containerClient.getBlobClient(filePath);

        System.out.println("\nUploading to Blob storage as blob:\n\t" + blobClient.getBlobUrl());

        // Upload the blob
        InputStream fileInputStream = filePart.getInputStream();
        blobClient.upload(fileInputStream, filePart.getSize());

        System.out.println("\nListing blobs...");

        // List the blob(s) in the container.
        for (BlobItem blobItem : containerClient.listBlobs()) {
            System.out.println("\t" + blobItem.getName());
        }

    }
}


