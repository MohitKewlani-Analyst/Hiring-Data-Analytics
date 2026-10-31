# Hiring-Data-Analytics

1. Project Description:

a.) Project Objective – 
The primary objective of this project is to showcase core technical 
competencies in Python data processing and build an automated pipeline 
bridging Python with relational database systems. Beyond isolated scripting, 
the project demonstrates how to connect Python to a MySQL database using 
SQLAlchemy and PyMySQL. This unified pipeline enables business stakeholders 
to run advanced analytical SQL queries—leveraging Common Table Expressions 
(CTEs), window functions, and multi-tier aggregations—to evaluate 
organizational hiring performance and workforce payroll commitments 
efficiently. 

b.) Project Overview – 
The Hiring Data Analytics project is an end-to-end data analysis project which is 
focused on evaluating recruitment throughput, department hiring rates, and 
compensation trends across 7,000+ applicant records. The workflow begins 
with systematic data cleaning in Python using Pandas, resolving real-world data 
discrepancies such as converting Excel serial timestamps into standardized 
dates, handling missing values through domain-specific imputation, stripping 
inconsistent text whitespace, and pruning statistical outliers using the 
Interquartile Range (IQR) technique. Following preparation, comprehensive 
exploratory data analysis (EDA) and visualization were performed using 
Matplotlib and Seaborn to identify critical operational trends, including 
applicant concentration across departments, gender-based selection rates, 
salary dispersion, and monthly interview volume patterns.


2. Dataset Overview:

Columns Names – 
application_id, interview_taken_on, status, gender, department, post_name, 
offered_salary 
No. of Rows         –   7168  
No. of Columns   –   7 
Data Source         –   Trainity.


3. Tech Stack Used:

Python (Jupyter Notebook) – It is used to run scripts. 
Python (Pandas) – It is used to clean dataset and performing Exploratory Data 
Analytics (EDA). 
Python (Matplotlib & Seaborn) – It is used to do EDA through Visualizing data. 
MySQL – Used for further data analysis.


4. Data Cleaning:

a.) Excel Serial Timestamp Parsing: Converted raw numeric Excel serial dates into standardized YYYY-MM-DD datetime formats using pd.to_datetime() with an origin offset.
b.) String Normalization & Categorical Imputation: Standardized textual data by stripping redundant prefixes/suffixes, cleaning irregular whitespace, and replacing missing or empty designation strings ('-', blank entries).
c.) Domain-Specific Missing Value Imputation: Imputed missing values in offered_salary using department-wise mean.
d.) Outlier Detection & Pruning: Identified extreme salary anomalies using the Interquartile Range (IQR) technique ($Q_3 + 1.5 \times \text{IQR}$), filtering out three unrepresentative executive-tier salaries ($>\$147,783$) to normalize downstream modeling and reporting.



5. Exploratory Data Analysis (EDA) using Pandas

Conducted comprehensive Exploratory Data Analysis using Pandas to understand candidate distributions, department recruitment volumes, and
compensation metrics across 7,100+ applicant records. Key numerical and categorical metrics were evaluated to uncover operational patterns,
revealing that Operations and Service represented over 67% of total candidate throughput while Human Resources achieved the highest conversion rate at 71.88%.
Visualizations built with Matplotlib and Seaborn—including multi-panel bar charts, boxplots, and stacked proportions—highlighted uniform median salaries
across core divisions, analyzed monthly interview cadences, and established demographic hiring differentials where female candidates
converted at 69.52% compared to 62.72% for males.

6. Data Analysis using MySQL

Engineered an automated ingestion pipeline using SQLAlchemy and PyMySQL to transition the cleaned dataset into an indexed, schema-optimized MySQL relational
database for downstream business querying. Formulated multi-layered SQL scripts utilizing Common Table Expressions (CTEs), window functions (SUM() OVER(), LAG()),
and conditional aggregations (CASE WHEN) to evaluate organizational workforce metrics. Key queries segmented candidates into distinct compensation tiers,
isolated top-performing job profiles (c9 and c5 driving over 51% of hires), tracked day-of-the-week interview surges (peak on Fridays at 20.57%),
and audited departmental payroll commitments, isolating a total approved expenditure of ₹89.8M in Operations alone.


Note : The project does not contain problem statement and recommendations because the core objective behind the creation of this project is to showcase
the knowledge of python and its different librarires and also the the creation of pipeline between Python and MySQL database.




