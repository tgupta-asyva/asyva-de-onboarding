# Notes (fill this):



### **OLTP VS OLAP**



#### **OLTP (Online Transaction Processing):-** Used to handle day-to-day transactions in real time. (e.g: ATM withdrawals, e-commerce orders) focused on fast, row-level data updates and integrity. Designed for used by frontline worker eg. cashier, hotel desk, clerk etc. or for customers for self service applications like online banking, ecommerce, booking a flight.

#### **OLAP (Online Analytical Processing):-** focuses on complex, long-running queries for analyzing large historical datasets and, enabling business intelligence, reporting, and decision-making. Used by Data Scientist, Business Analysts and knowledge workers.



#### **Key Differences Between OLTP and OLAP:-**

1. #### **Purpose:** OLTP handles day-to-day operations and transactional integrity. OLAP analyzes data for   insights, trends and decision-making.

#### 2\. **Data Characteristics:** OLTP deals with current, detailed, and operational data. OLAP stores historical, summarized and aggregated data.

#### 3\. **Performance \& Queries:** OLTP requires fast, sub-second responses for simple, high-frequency transactions. OLAP handles complex, long-running, low-frequency queries.

#### 4\. **Database Design:** OLTP uses normalized, relational databases to minimize redundancy. OLAP often uses denormalized models like star or snowflake schemas to accelerate analytical queries.

#### 5\. **Users:** OLTP is designed for frontline employees and customers. OLAP is designed for knowledge workers, executives and analysts.

#### 6\. **Data Volume:** OLTP manages small, transactional updates, whereas OLAP deals with large volumes of data (terabytes/petabytes). 

#### **Examples**

#### **OLTP:** Processing a credit card transaction, booking a flight, updating inventory, bank transfers.

#### **OLAP:** Analyzing sales trends over the past five years, creating monthly financial reports, data mining. 

#### **Summary Table**

|**Feature**|**OLTP (Online Transaction Processing)**|**OLAP (Online Analytical Processing)**|
|-|-|-|
|**Goal**|Run daily operations|Data analysis \& reporting|
|**Data**	|Current, real-time|Historical, consolidated|
|**Operation**|Short, fast transactions|Complex, long-running queries|
|**Speed**|Milliseconds|Seconds to Minutes|
|**Structure**|Normalized (Relational)|Denormalized (Warehouse)|
|**Users**|Front-line users, clients|Decision-makers, Analysts|

###### 

**OLTP feeds on  Bronze/ Silver layers while OLAP lives mostly in Gold layer.**

#### 

###### **Data Pipeline:-** A data pipeline is an automated system of technologies and processes that ingests, moves, transforms, and loads raw data from various sources (APIs, databases, files) into a destination like a data warehouse or data lake for analysis, machine learning, and reporting.

### 

### **Key Components \& Concepts**

1. ###### **Source:** Where data originates (e.g., Salesforce, IoT devices, SQL databases).

###### 2\. **Processing/Transformation:** Cleaning, filtering, masking, or restructuring data to fit a target schema.

###### 3\. **Destination:** The final repository, typically a cloud data warehouse (Snowflake, BigQuery) or data lake.

###### 4\. **Pipeline Types:**

###### 	**Batch Processing:** Moves data in large, scheduled blocks.

###### &nbsp;	**Real-time/Streaming:** Processes data continuously as it is generated.



### **Key Benefits**

1. ###### **Automation:** Reduces manual data handling, improving efficiency.

###### 2\. **Data Quality:** Standardizes formats and reduces errors.

###### 3\. **Accessibility:** Centralizes disparate (means fundamentally different or distinct) data sources for faster insights. 

### 

###### **Common Tools**

###### Common technologies for building pipelines include Apache Airflow, dbt, Fivetran, Python scripts and cloud-native services (AWS Glue, Azure Data Factory). 



### **Batch Processing VS Streaming Processing**



###### Batch processing handles large data volumes in scheduled groups with high latency (minutes/hours) for accuracy (e.g., monthly reports), while streaming processes data continuously as it arrives, offering low latency (milliseconds/seconds) for real-time insights (e.g., fraud detection). Batch is simpler for bulk tasks, while streaming requires complex, continuous infrastructure to manage real-time flow and late data, with modern tools offering unified solutions. 



### **Batch Processing**

###### **Data Handling:** Collects and processes large datasets in chunks at scheduled intervals.

###### **Latency:** High (minutes to hours).

###### **Use Cases:** Monthly billing, data warehousing, end-of-day reports, backups.

###### **Pros:** Simpler to manage, cost-effective for large historical analysis, ensures data completeness and accuracy for bulk tasks.

###### **Cons:** Not suitable for immediate decisions. 



### **Streaming Processing**

###### **Data Handling:** Processes data records or micro-batches continuously as they are generated.

###### **Latency:** Low (seconds to milliseconds).

###### **Use Cases:** Live dashboards, fraud detection, real-time analytics, IoT monitoring.

###### **Pros:** Immediate insights, real-time responsiveness.

###### **Cons:** More complex infrastructure, handling out-of-order or late data is challenging. 



#### **Key Differences**

###### **Data Volume:** Batch processes large volumes at once; streaming processes individual records or small micro-batches.

###### **Latency:** Batch is slow (hours); streaming is fast (milliseconds).

###### **Infrastructure:** Batch has predictable, simpler needs; streaming requires complex, constantly running distributed systems.

###### **Accuracy vs. Freshness:** Batch prioritizes accuracy over freshness; streaming prioritizes freshness (real-time) over perfect batch-level accuracy. 



#### **Modern Approaches**

###### **Hybrid/Unified:** Tools like Databricks and Flink allow handling both, often using streaming frameworks to achieve batch-like results or Kappa architecture, treating everything as streams for simplicity. 





### **ETL VS ELT**



##### ETL (Extract, Transform, Load) transforms data in a separate staging area before loading it into a data warehouse, making it ideal for smaller, structured datasets requiring high security or complex, upfront cleaning. ELT (Extract, Load, Transform) loads raw data directly into a cloud-based destination first, utilizing its scalability for faster ingestion, flexibility, and processing of large, unstructured data.

##### 

##### **ETL Process:-**

1. ##### Extract - It is the process of extracting raw data from all available data sources such as databases, files, ERP, CRM or any other.
2. ##### Transform - The extracted data is immediately transformed as required by the user.
3. ##### Load - The transformed data is then loaded into the data warehouse from where the users can access it.



##### **ELT Process:-**

1. ##### Extract - It is the process of extracting raw data from all available data sources such as databases, files, ERP, CRM or any other.
2. ##### Load - Loading is the process of storing the extracted raw data in a data warehouse or data lake.
3. ##### Transform - Data transformation is the process in which the raw data from the source is transformed into the target format required for analysis.

#### 

##### **Key Differences:**

1. ##### **Order of Operations:** ETL transforms data before loading (at a staging area); ELT loads raw data first and transforms it inside the data warehouse.

##### 2\. **Performance \& Speed:** ELT is generally faster for loading large datasets, as it leverages the scalable compute power of modern cloud warehouses (e.g., Snowflake, BigQuery).

##### 3\. **Flexibility:** ELT allows for data to be stored in its raw state, enabling re-transformation later, whereas ETL transforms data before storage.

##### 4\. **Security \& Compliance:** ETL is better for strict compliance (e.g., GDPR, HIPAA), as it can scrub/mask sensitive data before it lands in the target system.

##### 5\. **Data Types:** ETL is traditionally used for structured data, while ELT handles structured, semi-structured, and unstructured data efficiently.



##### **When to Choose Which:**

1. ##### **Choose ETL when:** You have limited bandwidth, require highly complex transformations, need to conform to strict data privacy regulations, or use legacy on-premise data systems.

##### 2\. **Choose ELT when:** You are using cloud data warehouses, working with massive, unstructured datasets, need real-time or near-real-time data, or require high flexibility for data analysis. 

##### 

### **Medallion Architecture**



##### It is a data architecture pattern (popularized by Databricks) that organizes data into layered "quality zones". Each layer refines the data, improving cleanliness, structure and business values as it move forward.



##### **Key Layers of Medallion Architecture**



1. ###### **Bronze (Raw Layer):-** Ingest raw data from the source systems (databases, APIs, logs, streams) exactly as it arrives with little-to-no transformation. Keeps full history for traceability and reprocessing. Often messy: duplicates, null, inconsistent form.
2. ###### **Silver (Cleaned/Validation Layer**):- Data from the Bronze layer is cleaned, validated, transformed and merged to create a "single source of truth". It is structured, joined and deduplicated for analytical use.
3. ###### **Gold (Curated/Business Layer):-** Highly refined, aggregated data tailored for specific business use cases, reporting, and BI applications.



##### **Benefits and Characteristics** 

1. ##### **Incremental ETL:** Supports processing data in stages (multi-hop).
2. ##### **Data Quality Improvement:** Data matures from raw to refined, allowing data scientists to use Silver and business users to use Gold.
3. ##### **ACID Transactions:** Ensures reliability and data integrity.
4. ##### **Scalability:** Efficiently handles massive, fast-moving datasets.
5. ##### **Improved Security:** Enables role-based access control, as different users can access specific layers based on their needs. 

##### 

##### **Typical Use Case** 

##### Data flows from raw source(MySQL, APIs etc.)(Bronze) ----> Cleaned/deduplicated tables (Silver)----> Aggregated business summaries/dashboards (Gold). 



#### &nbsp;		

#### Q3. Write architecture.md answering (in your own words):

#### (a) Why raw data should not be queried directly?

##### **Ans.** Raw data should not be queried directly as it often contains duplicate records, null or missing values, wrong format and inconsistent schema. Which is still needed to be cleaned or transformed according  to business requirements. The raw data is mainly used for backup, auditing and reprocessing. While analytics should be performed on cleaned and curated layers to ensure accuracy, performance and security.



#### (b) What changes between Bronze, Silver, Gold?

##### **Ans.** In Bronze layer, raw data is ingested from multiple source like MySQL, databases, APIs and streaming systems with little or no transformation. This layer stores data in its original format mainly for backup and traceability.

##### In  Silver layer, data from bronze layer is cleaned, validated and transformed based on business requirements. Schema consistency is applied and data quality issues are resolved, making the data reliable and usable. 

##### In Gold layer, the refined data is optimized for analytics, reporting and dashboards.



#### (c) Where data quality checks should live and why?

#### Ans. Data quality checks should live in Silver Layer as this is where data is cleaned, validated, deduplicated and transformed according to the business rules, to ensure accuracy before analytics. 





