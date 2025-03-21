USE FitnessClub

INSERT Instructors(Name, Surname, Age)
VALUES('John', 'Smith', 35),
	  ('Emily', 'Johnson', 29),
	  ('Michael', 'Brown', 42),
	  ('Sarah', 'Davis', 31),
	  ('James', 'Wilson', 38)

SELECT *
FROM Instructors

INSERT Sections(Name, Price)
VALUES('Yoga', 500),
	  ('CrossFit', 700),
	  ('Pilates', 600),
	  ('Strength Training', 800),
	  ('Cardio Workout', 550)

SELECT *
FROM Sections

INSERT InstructorsSections(InstructorId, SectionId)
VALUES(1, 1),
	  (2, 3),
	  (1, 2),
	  (4, 1),
	  (5, 4)

SELECT *
FROM InstructorsSections

INSERT Visitors(Name, Surname, Age, PhoneNumber, [E-mail], IdSection, Time, Visits, LastVisit)
VALUES('Olivia', 'Moore', 26, '123-456-7890', 'alice@email.com', 1, '18:00', 2, '2025-03-21'),
	  ('Robert', 'Miller', 34, '987-654-3210', 'robert@email.com', 2, '18:00', 10, '2024-12-12'),
	  ('Olivia', 'Taylor', 28, '555-666-7777', 'olivia@email.com', 3, '17:00', 9, '2024-01-01'),
	  ('Daniel', 'Anderson', 40, '444-333-2222', 'daniel@email.com', 4, '20:00', 4, '2024-08-23'),
	  ('Emma', 'White', 30, '111-222-3333', 'emma@email.com', 5, '16:30', 13, '2025-02-18')

SELECT *
FROM Visitors
--1
SELECT COUNT(Instructors.Id) as 'Instructors', Sections.Name
FROM InstructorsSections JOIN Sections ON InstructorsSections.SectionId = Sections.Id
						 JOIN Instructors ON InstructorsSections.InstructorId = Instructors.Id
GROUP BY Sections.Name

--2
SELECT COUNT(*) as 'Visitors' ,Visitors.Time
FROM Visitors JOIN InstructorsSections ON IdSection = InstructorsSections.Id
   JOIN Sections On InstructorsSections.SectionId = Sections.Id
Group by Visitors.Time
HAVING Visitors.Time ='18:00:00'


--3
SELECT COUNT(Visitors.Id) as 'Visitors'
FROM Visitors
WHERE Visitors.PhoneNumber LIKE '123%'

--4
SELECT COUNT(Visitors.Id) as 'Visitors'
FROM Visitors
WHERE Visitors.Surname IN('Moore', 'Taylor', 'Cheban')

--5
SELECT COUNT(Visitors.Id) as 'Visitors', Visitors.Name
FROM InstructorsSections JOIN Instructors ON InstructorsSections.InstructorId = Instructors.Id, Visitors
WHERE Visitors.Name = 'Olivia' AND Visitors.IdSection = InstructorsSections.Id AND InstructorsSections.InstructorId = 1
GROUP BY Visitors.Name

--6
SELECT * 
FROM Visitors
WHERE Visitors.Visits >2

--7
SELECT COUNT(Visitors.Id) as 'Visitors'
FROM Visitors JOIN InstructorsSections ON Visitors.IdSection = InstructorsSections.Id
WHERE InstructorsSections.SectionId = 1 AND Visitors.LastVisit > '2025-01-01' AND Visitors.LastVisit < '2025-06-01'

--8
SELECT COUNT(Visitors.Id) as 'Visitors'
FROM Visitors JOIN InstructorsSections ON Visitors.IdSection = InstructorsSections.Id
WHERE Visitors.LastVisit LIKE '2024%'
