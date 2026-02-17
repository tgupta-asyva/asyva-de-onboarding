**What is Logging?**



Logging is the process of recording events, messages, and errors that happen while a program is running.

						**OR**

Logging is the process of recording application events, errors, and execution details to help in monitoring, debugging, auditing, and maintaining production systems.



Instead of using "print", we use Logging as it is structured, configurable, and production-ready.



**Why Logging is Needed?**



In real-world systems (ETL, APIs, AWS jobs, Spark jobs), logging is required for:



**1️⃣ Debugging Errors**



If ETL fails at 3 AM, logs tells:

* Where it failed
* Why it failed
* What data was processed



Example:

2026-02-17 10:01:32 | ERROR | Failed to connect to DB



**2️⃣ Monitoring Jobs**



You can track:

* Start time
* End time
* Row counts
* Execution duration



Example:

INFO | Extracted 25,000 rows from source

INFO | Loaded 25,000 rows to warehouse



3️⃣ **Auditing \& Compliance**



In data engineering, logs help:

* Track data movement
* Meet governance requirements
* Provide traceability



4️⃣ **Performance Analysis**



You can measure:

* Query time
* API response time
* Processing time



🔥 **Logging Levels (Very Important for Interview)**



| **Level    | Purpose**                               |

| -------- | ------------------------------------- |

| DEBUG    | Detailed debugging info               |

| INFO     | General information                   |

| WARNING  | Something unexpected but not critical |

| ERROR    | Something failed                      |

| CRITICAL | System crash level                    |



Example:

logging.debug("Variable x value: %s", x)

logging.info("Job started")

logging.warning("File is empty")

logging.error("Database connection failed")

logging.critical("System crash")



🚀 **Why Not Just Use print()?**



| **print()         | logging**             |

| --------------- | ------------------- |

| No levels       | Has levels          |

| No file storage | Can write to file   |

| No formatting   | Structured format   |

| No control      | Can filter by level |



Logging allows:

* Writing to files
* Writing to console
* Sending to monitoring systems
* Sending to CloudWatch (AWS)



**📌 Example Logging Setup**

import logging



logging.basicConfig(

&nbsp;   level=logging.INFO,

&nbsp;   format="%(asctime)s | %(levelname)s | %(message)s"

)



logging.info("ETL started")



**Output:**

2026-02-17 10:15:02 | INFO | ETL started



🔹 **Standard Logging Format**

Most production systems use:

**timestamp | log level | module name | message**



Example:

2026-02-17 10:30:01 | INFO | extract\_module | Extracted 5000 rows



**Recommended Structure in ETL Projects**



In real projects, logging is structured like this:

project/

&nbsp; main.py

&nbsp; extract.py

&nbsp; transform.py

&nbsp; load.py

&nbsp; logger.py



**## Python's logging module has several log levels indicating the severity of events.**

**The default levels are:**



Logging Levels (Lowest → Highest Severity)

**DEBUG < INFO < WARNING < ERROR < CRITICAL**



* DEBUG: Detailed information, typically of interest only when diagnosing problems.
* INFO: Confirmation that things are working as expected.
* WARNING: An indication that something unexpected happened or indicative of some problem in the near

&nbsp;	    future (eg.:disk space is low). The software is still working as expected.

* ERROR: Due to a more serious problem, the software has not been able to perform some function.
* CRITICAL: A very serious error, indicating that the program itself may be unable to continue running.





**--------------Logging Setup--------------------------------**

import logging



\## configuring logging

logging.basicConfig(

&nbsp;   filename='app.log',

&nbsp;   filemode='w',

&nbsp;   level=logging.DEBUG,

&nbsp;   format='%(asctime)s - %(levelname)s - %(message)s',

&nbsp;   datefmt='%Y-%m-%d %H:%M:%S'

)



\## log message with differenet severity levels

logging.debug('This is a debug message')

logging.info('This is an info message')

logging.warning('This is a warning message')

logging.error('This is an error message')

logging.critical('This is a critical message')



**-----------Logging with multiple logger for different parts of the application-----------**



import logging  



\## create a logger for module

logger1 = logging.getLogger("module1")

logger1.setLevel(logging.DEBUG)



\## create a logger for module2

logger2 = logging.getLogger("module2")

logger2.setLevel(logging.WARNING)



\## basic config setting

logging.basicConfig(

&nbsp;   level=logging.DEBUG,

&nbsp;   format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",

&nbsp;   datefmt="%Y-%m-%d %H:%M:%S"

)



\## log messages with different loggers

logger1.debug("This is a debug message from module1")

logger2.warning("This is a warning message from module2")

logger2.error("This is an error message from module2")



**OUTPUT:**

2026-02-17 12:08:28,017 - DEBUG - This is a debug message from module1

2026-02-17 12:08:28,019 - WARNING - This is a warning message from module2

2026-02-17 12:08:28,019 - ERROR - This is an error message from module2



**Example:**

import logging



\## logging settings

logging.basicConfig(

&nbsp;   level=logging.DEBUG,

&nbsp;   format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",

&nbsp;   datefmt="%Y-%m-%d %H:%M:%S",

&nbsp;   handlers=\[

&nbsp;       logging.FileHandler("debug.log"),

&nbsp;       logging.StreamHandler()

&nbsp;   ] 

&nbsp; ) 



logger = logging.getLogger("ArithmeticApp")



def add(a,b):

&nbsp; result = a + b

&nbsp; logger.debug(f"Adding {a} + {b} = {result}")

&nbsp; return result



def subtract(a,b):

&nbsp; result = a - b

&nbsp; logger.debug(f"Subtracting {a} - {b} = {result}")

&nbsp; return result



def multiply(a,b):

&nbsp; result = a \* b

&nbsp; logger.debug(f"Multiplying {a} \* {b} = {result}")

&nbsp; return result



def divide(a,b):

&nbsp; try:

&nbsp;   result = a / b

&nbsp;   logger.debug(f"Dividing {a} / {b} = {result}")

&nbsp;   return result

&nbsp; except ZeroDivisionError:

&nbsp;   logger.exception("Division by zero error")

&nbsp;   return None





add(10,15)

subtract(15,10)

multiply(10,20)

divide(10,0)





**OUTPUT:**

2026-02-17 12:18:28,240 - DEBUG - Adding 10 + 15 = 25

2026-02-17 12:18:28,242 - DEBUG - Subtracting 15 - 10 = 5

2026-02-17 12:18:28,245 - DEBUG - Multiplying 10 \* 20 = 200

2026-02-17 12:18:28,245 - ERROR - Division by zero error

Traceback (most recent call last):

&nbsp; File "/tmp/ipython-input-2698057620.py", line 33, in divide

&nbsp;   result = a / b

&nbsp;            ~~^~~

ZeroDivisionError: division by zero

