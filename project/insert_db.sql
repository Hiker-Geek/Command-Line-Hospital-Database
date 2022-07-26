INSERT INTO Physician
VALUES(0147, "James Dean", "Surgeon", 464563798);

INSERT INTO Physician
VALUES(0148, "Jannette Nice", "Resident", 78923467);

INSERT INTO Physician
VALUES(0149, "Bruno Ramirez", "Chief of Medicine", 67235478);

INSERT INTO Physician
VALUES(0150, "Mark Smith", "Psychiatrist", 12839560);

INSERT INTO Physician
VALUES(0151, "Rose White", "Intern", 99988777);

INSERT INTO Department
VALUES(1, "General Medicine", 0149);

INSERT INTO Department
VALUES(2, "Psychiatry", 0150);

INSERT INTO Department
VALUES(3, "Surgery", 0147);

INSERT INTO AffiliatedWith
VALUES(0149, 1);

INSERT INTO AffiliatedWith
VALUES(151, 2);

INSERT INTO AffiliatedWith
VALUES(150, 2);

INSERT INTO AffiliatedWIth
VALUES(0147, 3);

INSERT INTO `Procedure`
VALUES(1, "Open Heart Surgery", 40000.12);

INSERT INTO `Procedure`
VALUES(2, "Cognitive Behavorial Therapy", 200);

INSERT INTO `Procedure`
VALUES(3, "IV", 150);

INSERT INTO `Procedure`
VALUES(4, "Lung Transplant", 20000);

INSERT INTO `Procedure`
VALUES(5, "biopsy", 5000);

INSERT INTO Patient
VALUES(1, 11122333, "John Doe", "123 Mahogony Lane", "1960-04-06", "646-182-9783", 123456, 0148);

INSERT INTO Patient
VALUES(2, 222334444, "Jane Doe", "456 Applewood Drive", "1979-07-21", "555-186-9741", 232323, 0148);

INSERT INTO Patient
VALUES(3, 333445555, "Gretta Micheals", "647 Cedar Road", "1992-09-11", "234-777-1256", 456754, 0150);

INSERT INTO Patient
VALUES(4, 555778888, "Vanessa Rodriguez", "981 Falcon Roost Road", "2003-11-25", "673-655-9999", 122899, 0147);

INSERT INTO Nurse
Values(11, "Micheal Reeves", "Nurse", 44444444);

INSERT INTO Nurse
VALUES(12, "Jessica Jones", "Head Nurse", 55555555);

INSERT INTO Nurse
VALUES(13, "Esther Beaux", "Nurse", 66666666);

INSERT INTO Nurse
VALUES(14, "Marcus Cooper", "Nurse", 77777777);

INSERT INTO Medication
VALUES(77, "Abuterol sulfate");

INSERT INTO Medication
VALUES(88, "Morphine");

INSERT INTO Medication
VALUES(99, "Wellbutrin");

INSERT INTO Medication
VALUES(55, "Nitrofuren");

INSERT INTO Prescribes
VALUES(0150, 3, 99, "2013-08-14", "One 150mg tablet every morning");

INSERT INTO Prescribes
VALUES(0148, 1, 55, "2017-09-22", "One 50mg/day");

INSERT INTO Prescribes
VALUES(0148, 2, 77, "2018-02-01", "Two puffs as needed");

INSERT INTO Prescribes
VALUES(0147, 4, 88, "2020-05-07", "0.1mg per kg every 4 hours");

INSERT INTO Room
VALUES(14, "Single");

INSERT INTO Room
VALUES(24, "Double");

INSERT INTO Room
VALUES(16, "Single");

INSERT INTO Stay
VALUES(666, 4, 14, "2020-05-07", "2020-06-01");

INSERT INTO Stay
VALUES(777, 3, 24, "2011-09-18", "2011-09-20");

INSERT INTO Stay
VALUES(888, 1, 24, "2010-03-03", "2010-03-05");

INSERT INTO Stay
VALUES(999, 2, 16, "2021-01-01", "2021-01-21");

INSERT INTO Undergoes
VALUES(3, 5, 777, "2011-09-18", 0147, 13);

INSERT INTO Undergoes
VALUES(2, 4, 999, "2021-01-01", 0147, 12);

INSERT INTO Undergoes
VALUES(1, 1, 888, "2010-03-03", 0147, 14);

INSERT INTO OnCall
VALUES(11, "2022-01-04", "2022-01-08");

INSERT INTO OnCall
VALUES(12, "2021-07-08", "2021-07-08");

INSERT INTO OnCall
VALUES(13, "2021-09-10", "2021-09-13");

INSERT INTO OnCall
VALUES(14, "2021-10-11", "2021-10-15");

INSERT INTO Appointment
VALUES(78, 4, 12, 0147, "2021-12-01 10:00:00", "2021-12-01 11:00:00");

INSERT INTO Appointment
VALUES(79, 2, 13, 0148, "2021-11-05 13:00:00", "2021-11-05 14:00:00");

INSERT INTO Appointment
VALUES(80, 1, 14, 0149, "2021-06-05 9:00:00", "2021-06-05 10:00:00");