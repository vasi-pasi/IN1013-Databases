-- Create Property table (Generalization/Specialization)
CREATE TABLE Property (
    PropertyID VARCHAR(10) PRIMARY KEY NOT NULL,
    Address TEXT NOT NULL,
    City VARCHAR(50) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    Type ENUM('Residential', 'Commercial') NOT NULL,
    Status ENUM('Available', 'Rented', 'Under Maintenance') NOT NULL
);

-- ResidentialProperty specialization
CREATE TABLE ResidentialProperty (
    PropertyID VARCHAR(10) PRIMARY KEY NOT NULL,
    NumberOfBedrooms INT NOT NULL,
    NumberOfBathrooms INT NOT NULL,
    HasGarden BOOLEAN,
    FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID)
);

-- CommercialProperty specialization
CREATE TABLE CommercialProperty (
    PropertyID VARCHAR(10) PRIMARY KEY NOT NULL,
    FloorSpace DECIMAL(10,2) NOT NULL,
    ZonedFor ENUM('Retail', 'Office', 'Industrial') NOT NULL,
    FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID)
);

-- Create Tenant table
CREATE TABLE Tenant (
    TenantID VARCHAR(10) PRIMARY KEY NOT NULL,
    Name VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    DateOfBirth DATE
);

-- Create RentalAgreement table (Composite Primary Key)
CREATE TABLE RentalAgreement (
    AgreementID VARCHAR(10) PRIMARY KEY NOT NULL,
    PropertyID VARCHAR(10) NOT NULL,
    TenantID VARCHAR(10) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    MonthlyRent DECIMAL(10,2) NOT NULL,
    SecurityDeposit DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID),
    FOREIGN KEY (TenantID) REFERENCES Tenant(TenantID)
);

-- Create Payment table
CREATE TABLE Payment (
    PaymentID VARCHAR(10) PRIMARY KEY NOT NULL,
    AgreementID VARCHAR(10) NOT NULL,
    PaymentDate DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentMethod ENUM('Credit Card', 'Bank Transfer', 'Cash') NOT NULL,
    FOREIGN KEY (AgreementID) REFERENCES RentalAgreement(AgreementID)
);

-- Create PropertyManager table
CREATE TABLE PropertyManager (
    ManagerID VARCHAR(10) PRIMARY KEY NOT NULL,
    Name VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Region VARCHAR(50) NOT NULL
);

-- Create MaintenanceRequest table
CREATE TABLE MaintenanceRequest (
    RequestID VARCHAR(10) PRIMARY KEY NOT NULL,
    PropertyID VARCHAR(10) NOT NULL,
    RequestDate DATE NOT NULL,
    IssueDescription TEXT NOT NULL,
    Status ENUM('Open', 'In Progress', 'Resolved') NOT NULL,
    ResolutionDate DATE,
    FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID)
);

-- Create PropertyManager-Property relationship (1:M)
ALTER TABLE Property
ADD COLUMN ManagerID VARCHAR(10),
ADD FOREIGN KEY (ManagerID) REFERENCES PropertyManager(ManagerID);
