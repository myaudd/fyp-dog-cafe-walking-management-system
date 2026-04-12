CREATE TABLE customer(
  customerID VARCHAR(50) PRIMARY KEY,
  customerName VARCHAR(255) UNIQUE NOT NULL,
  customerEmail VARCHAR(255),
  customerPassword VARCHAR(255) NOT NULL,
  customerPhoneNumber VARCHAR(15),
  customerGender customerGenderType
);

CREATE TABLE staff(
  staffID VARCHAR(50) PRIMARY KEY,
  staffName VARCHAR(255) NOT NULL,
  staffPassword VARCHAR(255) NOT NULL,
  staffRole staffRoleType NOT NULL
);

CREATE TABLE residentDog(
  residentDogID VARCHAR(50) PRIMARY KEY,
  residentDogName VARCHAR(255) NOT NULL,
  residentDogAge INTEGER,
  residentDogBreed VARCHAR(255),
  residentDogSize residentDogSizeType,
  residentDogGender residentDogGenderType
);

CREATE TABLE bookingWalk(
  bookingWalkID VARCHAR(50) PRIMARY KEY,
  customerID VARCHAR(50) NOT NULL REFERENCES customer(customerID) ON DELETE CASCADE,
  residentDogID VARCHAR(50) REFERENCES residentDog(residentDogID),
  staffID VARCHAR(50) REFERENCES staff(staffID),
  dogType dogTypeType NOT NULL,
  bookingDate DATE NOT NULL,
  bookingTime TIME NOT NULL,
  bookingStatus VARCHAR(50) DEFAULT 'Pending',
  walkStartTime TIMESTAMPTZ,
  walkEndTime TIMESTAMPTZ,
  duration INTERVAL GENERATED ALWAYS AS (walkEndTime - walkStartTime) STORED
);

CREATE TABLE message(
  messageID VARCHAR(50) PRIMARY KEY,
  bookingWalkID VARCHAR(50) NOT NULL REFERENCES bookingWalk(bookingWalkID) ON DELETE CASCADE,
  messageText TEXT,
  messageImage TEXT,
  messageTimeStamp TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP 
);