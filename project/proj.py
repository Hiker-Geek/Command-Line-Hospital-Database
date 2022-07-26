#!/usr/bin/env python
# coding: utf-8
#!/usr/bin/env python
# coding: utf-8
#River Stein project
#course: CS482
#code purpose: run sql queries from command line
#Date: 4/23/2022

import os
import mysql.connector
import pandas as pd
import numpy as np
import matplotlib
import sys

mydb = mysql.connector.connect(
        host="localhost",
        user='root',
        passwd='Riverst0ne45',
        database='sqlproject',
        auth_plugin = 'mysql_native_password',
)
cursor = mydb.cursor()
# main.py
def main(number, arg):
    if number == '1':
        procName = arg[2]
        #query 1
        query = pd.read_sql_query(
            f"SELECT p.physicianID, p.name AS physicianName, p.position as position, p.ssn \
            FROM physician AS p\
                JOIN undergoes AS u ON p.physicianID = u.physicianid \
                JOIN `procedure` AS proc ON proc.procedureID = u.procedureID\
            WHERE proc.name = '{procName}'", mydb)
    if number == '2':
        #query 2
        query = pd.read_sql_query(
            "select p.name patient_name, ph.name physician_name, n.name nurse_name,\
                a.startDateTime start_datetime, a.endDateTime end_datetime, prph.name primary_physician \
            from patient p join appointment a on p.patientID = a.patientID \
                join physician ph on ph.physicianID = a.physicianID\
                join nurse n on n.nurseID = a.nurseID\
                join physician prph on prph.physicianID = p.primaryPhysID\
            where p.primaryPhysID <> a.physicianID;", mydb)
    if number == '3':
        #query 3
        costP = float(arg[2])
        query = pd.read_sql_query(
            f"select p.patientID, p.ssn, p.name, p.address, p.dob, p.phone, p.insuranceNumber, p.primaryPhysID\
            from `procedure` pr join undergoes u on pr.procedureID = u.procedureID\
                join patient p on p.patientID = u.patientID\
            where pr.cost > {costP};", mydb)
    if number == '4':
        #query 4
        deptN = arg[2]
        query = pd.read_sql_query(
            f"select p.patientID,  p.ssn, p.name, p.address, p.dob, p.phone, p.insuranceNumber, p.primaryPhysID\
            from patient p join physician prph on prph.physicianID = p.primaryPhysID\
                join department d on d.headID = prph.physicianID\
            where d.name = '{deptN}';", mydb)
    if number == '5':
        #query 5
        medName = arg[2]
        query = pd.read_sql_query(
            f"select p.name patient_name, ph.name physician_name, pre.prescribedDate prescribed_date\
            from prescribes pre join patient p on pre.patientID = p.patientID\
                join medication m on m.medID = pre.medicationID\
                join physician ph on ph.physicianID = pre.physicianID\
            where m.name = '{medName}';", mydb)
    if number == '6':
        #query 6
        rDate = arg[2]
        query = pd.read_sql_query(
            f"select n.nurseID, n.name, n.position, n.ssn, o.startDate on_call_start_date, o.endDate on_call_end_date\
            from nurse n join oncall o on o.nurseID = n.nurseID\
            where '{rDate}' between o.startDate and o.endDate;", mydb)
    if number == '7':
        rDate = arg[2]
        query = pd.read_sql_query(
            f"select p.name Patient, s.roomID Room, s.startDate 'Stay Start Date', s.endDate 'Stay End Date'\
            from stay s join room r on s.roomID = r.roomID\
                join patient p on p.patientID = s.patientID\
            where roomType = 'Double'\
            and '{rDate}' between s.startDate and s.endDate;", mydb)
    if number == '8':
        deptN = arg[2]
        query = pd.read_sql_query(
            f"select pa.patientID, pa.ssn patient_ssn, pa.name patient_name, pa.address patient_address, pa.dob patient_dob, pa.phone patient_phone,\
                pa.insuranceNumber patient_insuranceNumber, pa.primaryPhysID patient_primaryPhysID, \
                p.physicianID, p.name physician_name, p.position physician_position, p.ssn physician_ssn, ap.appID appointmentID\
            from affiliatedWith a join physician p on a.physicianID = p.physicianID\
                join department d on a.departmentID = d.deptID\
                join appointment ap on ap.physicianID = p.physicianID\
                join patient pa on pa.patientID = ap.patientID\
            where d.name = '{deptN}';", mydb)

    if number == 'average':
        colName = arg[2]
        if arg[3] == 'procedure':
            tabName = '`Procedure`'
        if arg[3] == 'Procedure':
            tabName = '`Procedure`'
        else:
            tabName = arg[3]
        query = pd.read_sql_query(
            f"select avg({colName}) \
             from {tabName};", mydb)

    if number == 'retrieve':
        if arg[2] == 'procedure' or 'Procedure':
            tabName = '`Procedure`'
        else:
            tabName = arg[2]
        query = pd.read_sql_query(
            f"select * from {tabName};", mydb)
    #insert data into table
    if number == 'insert':
        if arg[2] == 'procedure':
            tabName = '`Procedure`'
        if arg[2] == 'Procedure':
            tabName = '`Procedure`'
        else:
            tabName = arg[2]
        query1 = pd.read_sql_query(
            f"show columns from {tabName};", mydb
        )
        print(query1)
        values = input(f"Please enter new data into {tabName} in a comma separated list in order of the column names shown to you.\nMake sure to put all strings/varchar types in double quotes \"\"!\n")
        cursor.execute(f"insert into {tabName} values({values});")
        mydb.commit()
        print("\nHere is your new table:")
        query = pd.read_sql_query(
            f"select * from {tabName};", mydb
        )

    if number == 'delete':
        if arg[2] == 'procedure':
            tabName = '`Procedure`'
        if arg[2] == 'Procedure':
            tabName = '`Procedure`'
        else:
            tabName = arg[2]
        query1 = pd.read_sql_query(
            f"show columns from {tabName};", mydb
        )
        print(query1)
        value1 = input(f"Please enter the column name of the data to delete from {tabName}.\n")
        value2 = input(f"Please enter the value from column {value1} to be deleted from {tabName}.\n If it is a string/varchar type remember to put double quotes around your answer\n")
        cursor.execute(f"delete from {tabName} where {value1} = {value2};")
        mydb.commit()
        print("\nHere is your new table:")
        query = pd.read_sql_query(
            f"select * from {tabName};", mydb
        )
    print(query)

num = sys.argv[1]
main(num, sys.argv)




