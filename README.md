# Command-Line-Hospital-Database

This project is from my SQL college course in which I created a SQL database based on a hospital scenario with ajoining
 python code that could run commands from the command line for retrieving data and entering new data into the database. See instructions below.

The code in this project is written in a python project named proj.py. To start, navigate to where the project is stored on your computer, and type python proj.py into the command line. You'll be greeted by a menu of options similar to the one below.

## Displaying Menu in Command Prompt
https://user-images.githubusercontent.com/77985155/192671550-89d7cbba-18dd-4a92-935b-871f68608280.mp4


## Retrieve Data from SQL Table
https://user-images.githubusercontent.com/77985155/192671665-4d8cea93-9de8-4f4f-9b7c-ce42fc616c90.mp4


## Alter Data in SQL tables
https://user-images.githubusercontent.com/77985155/192674477-5e692773-3a19-44ee-b1e9-dbd45b1afff8.mp4

## How proj.py works:

proj.py is a code file meant to be executed from the command line in the form of "python proj.py [argument type] [additional argument, if any] [additional argument, if any]." 

### Passing arguments that contain spaces in between words or characters:
Note that for any arguments that include several words with spaces in between, space separated characters, or anything containing spaces such as "h e l l o", "a 17 3", or "good morning to you", they must be enclosed in double quotes like so: "[Enter mutlicharacter space-separated argument]". This indicates to the computer's command line where the multiword argument starts and ends, whereas its default is to take each word as a command itself with the spaces as separators. 

**Notes:** <br>
	1. If you get errors when passing arguments, check to make sure your multicharacter space-separated commands are enclosed in quotes, and that everything is spelled and capitalized correctly. <br>
	2. If you need a reference to specific information in a table's attribute like "Lung Transplant" in the name attribute of the Procedures table, I would recommend using the retrieve command outlined below.

## To begin: <br> 
First navigate to where proj.py is stored on your computer. Make sure your database is set up and your credentials are entered for the database conncection request in python. The queries you can execute the interact with the database are outlined below.

**Query 1:** Find physicians that have performed a given procedure name. Show the detailed information of each physician.<br>
	***To run query 1:*** python proj.py 1 <procedure_name>

**Query 2:** Find appointments where a patient met with a physician other than their primary physician. Show patient name, physician name, nurse name, 
	start and end datetime of appointment, and the name of the patient's primary physician.<br>
	***To run query 2:*** python proj.py 2

**Query 3:** Find the patients that have undergone a procedure with a cost larger than a given cost. Show the detailed information of each patient.<br>
	***To run query 3:*** python proj.py 3 <given_cost in float form>

**Query 4:** Find the patients that their primary physician is the head of a given department name. Show the detailed information of each patient.<br>
	***To run query 4:*** python proj.py 4 <department_name>

**Query 5:** Find information about a prescribed medication name. Show the patients name, physicians names, and the prescribed dates.<br>
	***To run query 5:*** python proj.py 5 <medication_name>

**Query 6:** Find nurses who have been on call at a given date. Show the detailed information of each nurse and their on call start date and end date.<br>
	***To run query 6:*** python proj.py 6 <date in yyyy-mm-dd format>

**Query 7:** Find all patients that have stayed together in a "Double" room at a given date. For each room ID, show each patient's name and 
	their start and end date of stay<br>
	***To run query 7:*** python proj.py 7 <date in yyyy-mm-dd format>

**Query 8:** Find information about all appointments with physicians affiliated with a given department name. Show the detailed information of 
	each patient along with the detailed information of the physician with whom they have met and the appointment ID. 
	<br> ***To run query 8:*** python proj.py 8 <'department_name'>

**To Find the average of a table's attribute:** Given a table name and a column name, return the average of the column. Here the assumption is that the column type 
	will be numeric (e.g., cost column).<br>
		     	***To run the query:*** python proj.py average <'column name'> <'table name'>

**To retrieve a table's data:** Given a table name, retrieve all data from the table and present it to the user. <br>
			***To run the query:*** python proj.py retrieve <'table name'>

**To insert a row into a table:**  Given a table name, your program should show the column names of that table and ask the users to input new data to the table. 
				<br>In case of errors, your program should directly show the MySQL errors to the users. 
				<br>Assumption 1: Users will enter data according to the database constraints.
				<br>Assumption 2: Users will input one record at a time.
				<br>***To run query:***  python proj.py insert <'table name'>
				<br>Then follow the prompts' instructions given to enter more information. 
				<br>After the information is entered the altered table is shown

**To delete a row from the table:** Given a table name, your program should show the column names of that table and ask the users to input data that they want to delete.
				<br>Assumption 1: Users will enter data according to the database constraints.
				<br>Assumption 2: Users will input one record at a time.
				<br>***To run query:*** python proj.py delete <'table name'>
				<br>Then follow the prompts' instructions given to enter more information
				<br>After the information is entered the altered table is shown

