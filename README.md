# 📞 Customer Service BI Project (Sql Server + SSAS + SSIS + Power BI)

<img width="637" height="473" alt="data_Flow" src="https://github.com/user-attachments/assets/73dca941-73b2-4a72-95c1-5cc4604a24f7" />

## 📌 Overview
The Customer Service BI Project is a complete end-to-end data analytics solution designed to help businesses monitor and improve customer support operations.

It transforms raw customer interaction data (from CSV and TXT files) into meaningful insights using a robust pipeline

## 🧰 Tools & Technologies Used

- **SQL Server 2019** – Centralized database
- **SSIS (SQL Server Integration Services)** – Data extraction, transformation, and loading
- **SSAS (SQL Server Analysis Services)** – Multidimensional cube modeling
- **Power BI Desktop** – Dashboard & visualization
- **CSV, TXT files** – Raw data source format
- **Visual Studio with SSDT**

## 🗂️ Data Source Structure

Raw data is provided via CSV and TXT files. The table below outlines the structure of the core dataset:

### 📦 Main Data Table: `CustomerServiceData`

| Column Name             | Description                                                                 | Data Type                     
|--------------------------|-----------------------------------------------------------------------------|----------------|
| `InteractionID`         | Unique identifier for each interaction                                       | Integer        | 
| `CustomerID`            | Customer identifier                                                          | Varchar        |                  
| `CustomerName`          | Customer’s full name                                                         | Varchar        |                
| `CustomerEmail`         | Email address of the customer                                                | Varchar        |        
| `CustomerAge`           | Age of the customer                                                          | Integer        |                   
| `Country`               | Country where the customer resides                                           | Varchar        |                   
| `City`                  | Customer’s city                                                              | Varchar        |                  
| `Region`                | Geographical grouping                                                        | Varchar        |           
| `DateOpened`            | Date the service ticket was created                                          | Datetime       |       
| `DateClosed`            | Date the service ticket was closed                                           | Datetime       |        
| `IssueType`             | Type of service issue (Complaint, Inquiry, etc.)                             | Varchar        |               
| `Priority`              | Service priority (Low, Medium, High)                                         | Varchar        |                   
| `Status`                | Status of the interaction (Open, Closed, Pending)                            | Varchar        |                  
| `AssignedAgent`         | Agent assigned to handle the interaction                                     | Varchar        |             
| `ResolutionTimeHours`   | Time in hours taken to resolve the issue                                     | Decimal        | 
| `CustomerSatisfaction`  | Feedback level (Very Satisfied → Very Dissatisfied)                          | Varchar        | 
| `Channel`               | Contact method (Phone, Email, Chat, etc.)                                    | Varchar        | 
| `OrderID`               | Related order ID if linked to a transaction                                  | Varchar        | 
| `OrderAmount`           | Total order value in local currency                                          | Decimal        | 
| `OrderStatus`           | Status of the order (Completed, Shipped, Canceled)                           | Varchar        | 

---

## 🔄 ETL Process with SSIS
### SSIS Data Flow Transformations:

- Derived Columns (null handling, calculated age groups)
- Data Conversion: Ensures data type compatibility between the source and SQL Server schema.
- OLE DB Destination: Loads final cleaned data to `Target Destination`

<img width="1305" height="704" alt="csv_jan" src="https://github.com/user-attachments/assets/dba2635c-07ab-4609-9146-6653414e96d0" />
<img width="1359" height="710" alt="txt_mar" src="https://github.com/user-attachments/assets/67edd8b7-a3b7-4e1c-abe9-b60a2baae507" />
<img width="1354" height="661" alt="csv_feb" src="https://github.com/user-attachments/assets/fa4f0ea8-0fb9-45ad-a8e9-0752d3abeec9" />

## ⭐ Data Warehouse Design (SQL Server)
<img width="1350" height="605" alt="Sql" src="https://github.com/user-attachments/assets/1c5d8972-5f66-4ef9-861c-11ecc18d8e91" />


A **Star Schema** was built to support fast analytical queries:
<img width="1366" height="609" alt="starSchema" src="https://github.com/user-attachments/assets/f2c223d0-111b-4343-9594-b8d3460e8ca0" />


### Fact Table:
- `FactCustomerInteraction` – Stores measurable events (calls, emails, orders)

### Dimension Tables:
- `DimCustomer` – Customer attributes
- `DimDate` – Calendar table for DateOpened / DateClosed
- `DimPriority` – Priority levels
- `DimChannel` – Contact methods
- `DimRegion` – Location info (Country, City, Region)
- `DimAgent` – Service representatives
- `DimSatisfaction` – Feedback scale
- `DimIssueType` – Complaint, Inquiry, 

## 🧠 SSAS Cube Design

The **Customer Service Cube** enables fast slice-and-dice analysis.

### Key Features:
- Built with **SSAS Multidimensional**
- Dimensions: Region, Channel, Agent, Priority, Satisfaction Level, Date
- Hierarchies: Date (Year > Quarter > Month), Location (Country > Region > City)

  <img width="1366" height="641" alt="ssas" src="https://github.com/user-attachments/assets/1c6050d9-cb68-4746-aa93-059b0c53449f" />



## 📊 Power BI Reporting Layer

Connected directly to the SQL Server cube using ** Connection** for fast performance.

### Main Dashboards:

<img width="974" height="553" alt="page 1" src="https://github.com/user-attachments/assets/d1c6fd4c-ba55-4cc2-bf63-3393724c76a1" />
<img width="905" height="543" alt="page2" src="https://github.com/user-attachments/assets/1382bcb6-183e-42f7-8852-8cede4ad3945" />
<img width="1364" height="595" alt="data_model" src="https://github.com/user-attachments/assets/cb6aa391-dbbc-41b3-aa74-577000bbeb2c" />


## 🏆 Project Value

- 🔄 Full ETL pipeline: from flat files to final dashboard
- 🎯 Easy tracking of service KPIs and customer experience
- 📊 Dynamic dashboard filtering by region, time, channel, etc.
- ⚡ Fast insights with SSAS cube performance
- 👨‍💼 Stakeholder-friendly design with professional visuals

## 📁 Folder Structure 
/Customer-Service-BI
├── SSIS_Packages/
├── SQL_Scripts/
├── SSAS_Cube_Project/
├── PowerBI_Report.pbix
├── datasource/
├── README.md

