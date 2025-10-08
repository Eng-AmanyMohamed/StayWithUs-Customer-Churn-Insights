CREATE DATABASE TelcoChurnDW;
GO
USE TelcoChurnDW;
GO


CREATE TABLE Stg_TelcoRaw (
    RawID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID VARCHAR(50),
    [Count] INT NULL,
    Country NVARCHAR(100) NULL,
    State NVARCHAR(100) NULL,
    City NVARCHAR(100) NULL,
    ZipCode VARCHAR(20) NULL,
    [Lat Long] NVARCHAR(50) NULL,
    Latitude FLOAT NULL,
    Longitude FLOAT NULL,
    Gender VARCHAR(20) NULL,
    SeniorCitizen VARCHAR(10) NULL,
    Partner VARCHAR(10) NULL,
    Dependents VARCHAR(10) NULL,
    TenureMonths INT NULL,
    PhoneService VARCHAR(50) NULL,
    MultipleLines VARCHAR(50) NULL,
    InternetService VARCHAR(50) NULL,
    OnlineSecurity VARCHAR(50) NULL,
    OnlineBackup VARCHAR(50) NULL,
    [Device Protection] VARCHAR(50) NULL,
    TechSupport VARCHAR(50) NULL,
    [Streaming TV] VARCHAR(50) NULL,
    [Streaming Movies] VARCHAR(50) NULL,
    [Contract] VARCHAR(50) NULL,
    [Paperless Billing] VARCHAR(10) NULL,
    [Payment Method] VARCHAR(100) NULL,
    MonthlyCharges NVARCHAR(50) NULL,
    TotalCharges NVARCHAR(50) NULL,
    [Churn Label] VARCHAR(10) NULL,
    [Churn Value] INT NULL,
    [Churn Score] INT NULL,
    CLTV NVARCHAR(50) NULL,
    [Churn Reason] NVARCHAR(255) NULL,
    RawLoadDate DATETIME DEFAULT GETDATE()
);
GO


CREATE TABLE DimCustomer (
    CustomerKey INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID VARCHAR(50) NOT NULL UNIQUE,
    Gender VARCHAR(10) NULL,
    SeniorCitizen BIT NULL,
    Partner BIT NULL,
    Dependents BIT NULL,
    CreatedDate DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE DimLocation (
    LocationID INT IDENTITY(1,1) PRIMARY KEY,
    Country NVARCHAR(100) NULL,
    State NVARCHAR(100) NULL,
    City NVARCHAR(100) NULL,
    ZipCode VARCHAR(20) NULL,
    Latitude FLOAT NULL,
    Longitude FLOAT NULL,
    CONSTRAINT UQ_DimLocation UNIQUE (Country, State, City, ZipCode)
);
GO

CREATE TABLE DimService (
    ServiceID INT IDENTITY(1,1) PRIMARY KEY,
    PhoneService VARCHAR(50) NULL,
    MultipleLines VARCHAR(50) NULL,
    InternetService VARCHAR(50) NULL,
    OnlineSecurity VARCHAR(50) NULL,
    OnlineBackup VARCHAR(50) NULL,
    DeviceProtection VARCHAR(50) NULL,
    TechSupport VARCHAR(50) NULL,
    StreamingTV VARCHAR(50) NULL,
    StreamingMovies VARCHAR(50) NULL
    CONSTRAINT UQ_DimService UNIQUE (PhoneService, MultipleLines, InternetService, OnlineSecurity, OnlineBackup, DeviceProtection, TechSupport, StreamingTV, StreamingMovies)
);
GO

CREATE TABLE DimContract (
    ContractID INT IDENTITY(1,1) PRIMARY KEY,
    ContractType VARCHAR(50) NULL,
    PaperlessBilling BIT NULL,
    PaymentMethod VARCHAR(100) NULL,
    CONSTRAINT UQ_DimContract UNIQUE (ContractType, PaperlessBilling, PaymentMethod)
);
GO

CREATE TABLE DimChurn (
    ChurnID INT IDENTITY(1,1) PRIMARY KEY,
    ChurnLabel VARCHAR(20) NULL,
    ChurnValue BIT NULL,
    ChurnScore INT NULL,
    CLTV DECIMAL(12,2) NULL,
    ChurnReason NVARCHAR(255) NULL,
    CONSTRAINT UQ_DimChurn UNIQUE (ChurnLabel, ChurnValue, ChurnReason)
);
GO

-- 4) Fact table (TenureMonths moved here)
CREATE TABLE FactCustomerChurn (
    FactID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerKey INT NOT NULL,
    LocationID INT NULL,
    ServiceID INT NULL,
    ContractID INT NULL,
    ChurnID INT NULL,
    TenureMonths INT NULL,
    MonthlyCharges DECIMAL(10,2) NULL,
    TotalCharges DECIMAL(12,2) NULL,
    LoadDate DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Fact_Customer FOREIGN KEY (CustomerKey) REFERENCES DimCustomer(CustomerKey),
    CONSTRAINT FK_Fact_Location FOREIGN KEY (LocationID) REFERENCES DimLocation(LocationID),
    CONSTRAINT FK_Fact_Service FOREIGN KEY (ServiceID) REFERENCES DimService(ServiceID),
    CONSTRAINT FK_Fact_Contract FOREIGN KEY (ContractID) REFERENCES DimContract(ContractID),
    CONSTRAINT FK_Fact_Churn FOREIGN KEY (ChurnID) REFERENCES DimChurn(ChurnID)
);
GO


CREATE INDEX IX_Fact_CustomerKey ON FactCustomerChurn(CustomerKey);
CREATE INDEX IX_Fact_LocationID ON FactCustomerChurn(LocationID);
GO