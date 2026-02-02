### **Data Modeling**



##### Data Modeling is the process of designing how data is:

##### • Structured

##### • Related

##### • Stored

##### • Used for analytics \& applications

##### 👉 It turns raw data into a meaningful, organized format.

##### Think of it as a blueprint for your database or data warehouse.

##### 

##### Data modeling is the process of creating a visual representation of an information system or database to show how data is stored, connected and used. It helps ensure consistency, accuracy, and efficiency in storing and retrieving data.

##### Think of it like a blueprint for a building—but instead of walls and doors, you define tables, fields, relationships, and constraints.

##### 

##### **Types of Data Models:**

##### 

##### **1. Conceptual Data Model:-** 

##### 👉 What data exists (business view)

* ##### High-level, abstract view of the data.
* ##### Focuses on what data is needed, not how it is stored.
* ##### Uses entities and relationships.

##### 

##### **Example:**

##### Entities: Customer, Order, Product

##### Relationships: A Customer can place multiple Orders.

##### &nbsp;	       An Order can contain multiple Products.

##### 

##### **Customer ---places---> Order ---contains---> Product**

##### 

##### **2. Logical Data Model:-**

##### 👉 Defines relationships \& attributes

* ##### More detailed than conceptual.
* ##### Defines attributes (fields), primary keys, and foreign keys.
* ##### Still independent of a specific database system.

##### 

##### **Example:**

##### Entities and Attributes:

##### Customer: CustomerID (PK), Name, Email

##### Order: OrderID (PK), OrderDate, CustomerID (FK)

##### Product: ProductID (PK), ProductName, Price

##### 

##### Relationships:

##### Customer.CustomerID → Order.CustomerID

##### Order.OrderID → OrderDetails.OrderID

##### Product.ProductID → OrderDetails.ProductID

##### 

##### **3. Physical Data Model:-**

##### 👉 How it’s stored in MySQL, Snowflake, Redshift, etc.

* ##### Specific to a database system (MySQL, PostgreSQL, etc.).
* ##### Includes data types, indexes, constraints.
* ##### Optimized for performance.



##### **Example:**

##### 

##### CREATE TABLE customers (

##### &nbsp; customer\_id INT PRIMARY KEY,

##### &nbsp; name VARCHAR(100),

##### &nbsp; email VARCHAR(100)

##### );



##### **Includes:** Indexes, Constraints, Partitions



##### **Q. Why Data Modeling is Important**

* ##### Consistency: Ensures that everyone uses the same definitions for data.
* ##### Accuracy: Reduces errors and duplication.
* ##### Efficiency: Helps design queries and storage efficiently.
* ##### Communication: Easy for business and technical teams to understand.

##### 

##### 🔍 **Data Modeling in Lakehouse (Bronze → Silver → Gold)**

##### 

##### 🥉 **Bronze (Raw):** 

* ##### No modeling
* ##### Just ingestion

##### 

##### 🥈 **Silver (Cleaned):**

* ##### Structured tables
* ##### Normalized sometimes

##### 

##### 🥇 **Gold (Analytics-ready)**

##### 

##### 👉 Here you apply:

##### ✅ Star schema

##### ✅ Fact \& dimension tables

##### ✅ Business logic





### **Data Vault**



##### A data vault is a data modeling design pattern used to build a data warehouse for enterprise-scale analytics. The data vault has three types of entities: hubs, links, and satellites.

##### Hubs represent core business concepts, links represent relationships between hubs, and satellites store information about hubs and relationships between them.



##### **Core Components:**

1. ##### **Hub(Business Entities):**

**Stores unique business keys**

* ##### Represents a unique business key (like Customer ID, Product ID).
* ##### Stores only the key and metadata (like load date, source system).

##### 

##### **Purpose:** Uniquely identify entities across systems.

##### 

##### **Example:**

##### Hub\_Customer

##### -----------------

##### Customer\_HK (Hash Key, PK)

##### Customer\_ID (Business Key)

##### Load\_Date

##### Record\_Source





##### **2. Link (Relationships):**

**Shows how hubs are connected**

* ##### Represents relationships between hubs.
* ##### Also stores only keys from related hubs and metadata.

##### 

##### **Purpose:** Capture associations while keeping history easy to track.

##### 

##### **Example:**

##### Link\_Customer\_Order

##### --------------------

##### Customer\_HK (FK to Hub\_Customer)

##### Order\_HK (FK to Hub\_Order)

##### Load\_Date

##### Record\_Source





##### **3. Satellite:**

**Stores descriptive attributes + changes over time**

* ##### Stores descriptive attributes about hubs or links.
* ##### Contains historical changes over time.

##### 

##### **Purpose:** Separate volatile data from stable business keys, making auditing and history tracking easy.

##### 

##### **Example:**

##### Sat\_Customer\_Details

##### ----------------------

##### Customer\_HK (FK to Hub\_Customer)

##### Name

##### Email

##### Address

##### Load\_Date

##### Record\_Source





##### **Example Scenario: E-Commerce**

##### Imagine an e-commerce system tracking customers, orders, and products.

##### 

##### Hubs

##### Hub\_Customer → Customer\_ID

##### Hub\_Order → Order\_ID

##### Hub\_Product → Product\_ID

##### 

##### Links

##### Link\_Customer\_Order → Customer ↔ Order

##### Link\_Order\_Product → Order ↔ Product

##### 

##### Satellites

##### Sat\_Customer\_Details → Name, Email, Address

##### Sat\_Order\_Details → OrderDate, TotalAmount

##### Sat\_Product\_Details → ProductName, Category, Price

##### 

##### **Benefits of Data Vault**

##### 

* ##### Handles multiple source systems easily.
* ##### Excellent for audit and regulatory compliance.
* ##### Supports scalable and incremental loading.
* ##### Separates stable keys from volatile descriptive data, improving maintainability.

##### 

##### 🏗️ **Data Vault in Lakehouse (Modern Use)**

##### 🥉 Bronze

##### Raw ingestion

##### 

##### 🥈 Silver

##### Apply Data Vault

##### 

##### Hubs

##### Links

##### Satellites

##### 

##### 🥇 Gold

##### Transform to:

##### ⭐ Star Schema for BI





##### 📌 **Think of it like this:**

##### 

##### Raw messy data

##### ⬇

##### Data Vault = organized historical storage

##### ⬇

##### Star Schema = reporting layer

##### 

##### 🧠 **Simple analogy**

##### 

##### Imagine a library 📚

##### 

##### Hubs = Book ISBN numbers

##### Links = Which author wrote which book

##### Satellites = Book title, edition, year, changes

##### 

##### 🎯 **When should YOU use Data Vault?**

##### 

##### Use when:

##### ✔ Many source systems

##### ✔ Frequent changes

##### ✔ Need history

##### ✔ Enterprise data platform

##### 

##### Don’t use for:

##### ❌ Small projects

##### ❌ Simple reporting

