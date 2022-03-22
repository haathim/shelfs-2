
CREATE TABLE `users` (
  `username` VARCHAR(20) NOT NULL,
  `password` VARCHAR(64) NOT NULL,
  `userType` VARCHAR(20) NOT NULL,
  `salt` INT NOT NULL,
  `dateJoined` TIMESTAMP NOT NULL,
  PRIMARY KEY (`username`)

);

CREATE TABLE `buyers` (
  `username` VARCHAR(20) NOT NULL,
  `firstName` VARCHAR(20) NOT NULL,
  `lastname` VARCHAR(20) NOT NULL,
  `houseNo` VARCHAR(10) NOT NULL,
  `street` VARCHAR(50) NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `district` VARCHAR(20) NOT NULL,
  `province` VARCHAR(20) NOT NULL,
  `sellerApplied` TINYINT(1) NOT NULL,
  `phoneNo` VARCHAR(10) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`username`),
  FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE,
  UNIQUE (`email`)

);


CREATE TABLE `sellers` (
  `username` VARCHAR(20) NOT NULL,
  `nic` VARCHAR(20) NOT NULL,
  `photo` VARCHAR(255) NOT NULL,
  `nicPhotoFront` VARCHAR(255) NOT NULL,
  `nicPhotoBack` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`username`),
  FOREIGN KEY (`username`) REFERENCES `buyers` (`username`) ON DELETE CASCADE
);

ALTER TABLE sellers
    ADD bankAccountNo varchar(15) NOT NULL,
    ADD bankName varchar(50) NOT NULL,
    ADD bankBranch varchar(50) NOT NULL
;

CREATE TABLE `delivery`(
  `username` VARCHAR(20) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `phoneNo` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`username`),
  FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE
);

CREATE TABLE `admin` (
  `username` VARCHAR(20) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `phoneNo` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`username`),
  FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE
);



CREATE TABLE `advertisements` (
  `adId` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) NOT NULL,
  `author` VARCHAR(30) NOT NULL,
  `price` INT NOT NULL,
  `ISBN` VARCHAR(20) NOT NULL,
  `language` VARCHAR(20) NOT NULL,
  `availableStatus` TINYINT(1) NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  `bookFrontPhoto` VARCHAR(255) NOT NULL,
  `bookBackPhoto` VARCHAR(255) NOT NULL,
  `category` VARCHAR(30) NOT NULL,
  `sellerId` VARCHAR(20) NOT NULL,
  `dateAdded` TIMESTAMP NOT NULL,
  PRIMARY KEY (`adId`),
  FOREIGN KEY (`sellerId`) REFERENCES `sellers` (`username`) ON DELETE CASCADE

);

CREATE TABLE `orders`(
  `orderId` INT NOT NULL AUTO_INCREMENT,
  `buyerId` VARCHAR(20) NOT NULL,
  `adId` INT NOT NULL,
  `isCompleted` TINYINT(1) NOT NULL,
  PRIMARY KEY (`orderId`),
  FOREIGN KEY (`buyerId`) REFERENCES `buyers` (`username`) ON DELETE CASCADE,
  FOREIGN KEY (`adId`) REFERENCES `advertisements` (`adId`) ON DELETE CASCADE,
  UNIQUE (`adId`)
);

CREATE TABLE `complaints` (
  `complaintId` INT AUTO_INCREMENT,
  `title` VARCHAR(30),
  `description` VARCHAR(100),
  `readByAdmin` TINYINT(1),
  `buyerId` VARCHAR(20),
  PRIMARY KEY (`complaintId`),
  FOREIGN KEY (`buyerId`) REFERENCES `buyers` (`username`) ON DELETE CASCADE,

);


CREATE TABLE `sellerApplications`(
  `buyerId` VARCHAR(20) NOT NULL,
  `nic` VARCHAR(20) NOT NULL,
  `nicPhotoFront` VARCHAR(255) NOT NULL,
  `nicPhotoBack` VARCHAR(255) NOT NULL,
  `isAccepted` TINYINT(1) NOT NULL,
  `isRejected` TINYINT(1) NOT NULL,
  PRIMARY KEY (`buyerId`),
  FOREIGN KEY (`buyerId`) REFERENCES `buyers` (`username`) ON DELETE CASCADE,
);

ALTER TABLE sellerApplications
    ADD bankAccountNo varchar(15) NOT NULL,
    ADD bankName varchar(50) NOT NULL,
    ADD bankBranch varchar(50) NOT NULL
;

CREATE TABLE `wishlist` (
  `wishlistId` INT NOT NULL AUTO_INCREMENT,
  `adId` INT NOT NULL,
  `buyerId` VARCHAR(20) NOT NULL,
  `dateAdded` TIMESTAMP NOT NULL,
  PRIMARY KEY (`wishlistId`),
  FOREIGN KEY (`buyerId`) REFERENCES `buyers` (`username`) ON DELETE CASCADE,
  FOREIGN KEY (`adId`) REFERENCES `advertisements` (`adId`) ON DELETE CASCADE
);

CREATE TABLE `buyerRequests` (
  `requestId` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) NOT NULL,
  `author` VARCHAR(30) NOT NULL,
  `date` DATETIME NOT NULL,
  `buyerId` VARCHAR(20) NOT NULL,
  `category` VARCHAR(20) NOT NULL,
  `comment` VARCHAR(500) NOT NULL,
  `preferredPrice` INT NOT NULL,
  PRIMARY KEY (`requestId`),
  FOREIGN KEY (`buyerId`) REFERENCES `buyers` (`username`) ON DELETE CASCADE
);


CREATE TABLE `cartItems` (
  `cartId` INT NOT NULL AUTO_INCREMENT,
  `adId` INT NOT NULL,
  `buyerId` VARCHAR(20) NOT NULL,
  `timeAdded` TIMESTAMP NOT NULL,
  PRIMARY KEY (`cartId`),
  FOREIGN KEY (`buyerId`) REFERENCES `buyers` (`username`) ON DELETE CASCADE,
  FOREIGN KEY (`adId`) REFERENCES `advertisements` (`adId`) ON DELETE CASCADE
);


CREATE TABLE `pendingPickups` (
  `orderId` INT NOT NULL,
  `houseNo` VARCHAR(10) NOT NULL,
  `street` VARCHAR(50) NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `district` VARCHAR(30) NOT NULL,
  `province` VARCHAR(30) NOT NULL,
  `acceptedByDeliverer` TINYINT(1) NOT NULL,
  `deliverer` VARCHAR(20),
  PRIMARY KEY (`orderId`),
  FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`) ON DELETE CASCADE,
  FOREIGN KEY (`deliverer`) REFERENCES `delivery` (`username`)
);

CREATE TABLE `pendingDeliveries` (
  `orderId` INT NOT NULL,
  `houseNo` VARCHAR(10) NOT NULL,
  `street` VARCHAR(50) NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `district` VARCHAR(30) NOT NULL,
  `province` VARCHAR(30) NOT NULL,
  `acceptedByDeliverer` TINYINT(1) NOT NULL,
  `deliverer` VARCHAR(20),
  PRIMARY KEY (`orderId`),
  FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`) ON DELETE CASCADE,
  FOREIGN KEY (`deliverer`) REFERENCES `delivery` (`username`)
);

CREATE TABLE `pendingJobs` (
  `orderId` INT NOT NULL,
  `seller-houseNo` VARCHAR(10) NOT NULL,
  `seller-street` VARCHAR(50) NOT NULL,
  `seller-city` VARCHAR(50) NOT NULL,
  `seller-district` VARCHAR(30) NOT NULL,
  `seller-province` VARCHAR(30) NOT NULL,
  `buyer-houseNo` VARCHAR(10) NOT NULL,
  `buyer-street` VARCHAR(50) NOT NULL,
  `buyer-city` VARCHAR(50) NOT NULL,
  `buyer-district` VARCHAR(30) NOT NULL,
  `buyer-province` VARCHAR(30) NOT NULL,
  `acceptedByDeliverer` TINYINT(1) NOT NULL,
  `deliverer` VARCHAR(20),
  `isPickedup` TINYINT(1) NOT NULL,
  `isDelivered` TINYINT(1) NOT NULL,
  PRIMARY KEY (`orderId`),
  FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`) ON DELETE CASCADE,
  FOREIGN KEY (`deliverer`) REFERENCES `delivery` (`username`)
);



CREATE TABLE `ratings` (
  `ratingId` INT NOT NULL AUTO_INCREMENT,
  `buyerId` VARCHAR(20) NOT NULL,
  `sellerId` VARCHAR(20) NOT NULL,
  `orderId` INT NOT NULL,
  `date` TIMESTAMP NOT NULL,
  `rating` TINYINT(1) NOT NULL,
  `comment` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ratingId`),
  FOREIGN KEY (`buyerId`) REFERENCES `buyers` (`username`) ON DELETE CASCADE,
  FOREIGN KEY (`sellerId`) REFERENCES `sellers` (`username`) ON DELETE CASCADE,
  FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`) ON DELETE CASCADE,
);

CREATE TABLE `messages` (
    `messageId` INT NOT NULL AUTO_INCREMENT,
    `from` VARCHAR(20) NOT NULL,
    `to` VARCHAR(20) NOT NULL,
    `date` TIMESTAMP NOT NULL,
    `content` VARCHAR(200) NOT NULL,
    PRIMARY KEY (`messageId`),
    FOREIGN KEY (`from`) REFERENCES `users` (`username`) ON DELETE CASCADE,
    FOREIGN KEY (`to`) REFERENCES `users` (`username`) ON DELETE CASCADE
);


CREATE TABLE `pickups` (
    `pickupId` INT NOT NULL AUTO_INCREMENT,
    `sellerId` VARCHAR(20) NOT NULL,
    `datePlaced` TIMESTAMP NOT NULL,
    `status` TINYINT(1) NOT NULL,
    `deliverer` VARCHAR(20),
    PRIMARY KEY (`pickupId`),
    FOREIGN KEY (`sellerId`) REFERENCES `sellers` (`username`) ON DELETE CASCADE,
    FOREIGN KEY (`deliverer`) REFERENCES `delivery` (`username`)
);

CREATE TABLE `pickupOrders` (
    `id` INT NOT NULL AUTO_INCREMENT,
   `pickupId` INT NOT NULL,
   `adId` INT NOT NULL,

   PRIMARY KEY (`id`),
   FOREIGN KEY (`adId`) REFERENCES `advertisements` (`adId`) ON DELETE CASCADE,
   FOREIGN KEY (`pickupId`) REFERENCES `pickups` (`pickupId`) ON DELETE CASCADE
);

CREATE TABLE `newOrders` (
    `orderId` INT NOT NULL AUTO_INCREMENT,
    `buyerId` VARCHAR(20) NOT NULL,
    `dateOrdered` TIMESTAMP NOT NULL,
    `status` INT NOT NULL,
    `deliverer` VARCHAR(20),
    `isCourier` TINYINT(1),
    `totalPrice` INT NOT NULL,

    PRIMARY KEY (`orderId`),
    FOREIGN KEY (`buyerId`) REFERENCES `buyers` (`username`) ON DELETE CASCADE,
    FOREIGN KEY (`deliverer`) REFERENCES `delivery` (`username`) ON DELETE CASCADE
);

CREATE TABLE `newOrderPickups` (
     `pickupId` INT NOT NULL AUTO_INCREMENT,
     `orderId` INT NOT NULL,
     `sellerId` VARCHAR(20) NOT NULL,
     `status` INT NOT NULL,
     `deliverer` VARCHAR(20),

     PRIMARY KEY (`pickupId`),
     FOREIGN KEY (`orderId`) REFERENCES `newOrders` (`orderId`) ON DELETE CASCADE,
     FOREIGN KEY (`sellerId`) REFERENCES `sellers` (`username`) ON DELETE CASCADE,
     FOREIGN KEY (`deliverer`) REFERENCES `delivery` (`username`) ON DELETE CASCADE
);

CREATE TABLE `newPickupsAds` (
 `pickupId` INT NOT NULL,
 `adId` INT NOT NULL,

 PRIMARY KEY (`adId`),
 FOREIGN KEY (`pickupId`) REFERENCES `newOrderPickups` (`pickupId`) ON DELETE CASCADE,
 FOREIGN KEY (`adId`) REFERENCES `advertisements` (`adId`) ON DELETE CASCADE
);

CREATE TABLE `pickupPaymentStatus` (
 `pickupId` INT NOT NULL,
 `status` TINYINT(1) NOT NULL,

 PRIMARY KEY (`pickupId`),
 FOREIGN KEY (`pickupId`) REFERENCES `newOrderPickups` (`pickupId`) ON DELETE CASCADE,
);




# SQL for getting orders and adId
SELECT newOrders.orderId, newPickupsAds.adId FROM newOrders
INNER JOIN newOrderPickups
         ON newOrders.orderId = newOrderPickups.orderId
INNER JOIN newPickupsAds
         ON newOrderPickups.pickupId = newPickupsAds.pickupId;




