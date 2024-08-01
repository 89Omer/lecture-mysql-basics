ALTER TABLE `univeristy_db`.`tutors` 
ADD COLUMN `Designation` VARCHAR(100) NOT NULL DEFAULT 'Lecturer' AFTER `TutorName`;

UPDATE `univeristy_db`.`tutors` SET `Designation` = 'Senior Lecturer' WHERE (`TutorID` = '1');
UPDATE `univeristy_db`.`tutors` SET `Designation` = 'Program Leader' WHERE (`TutorID` = '4');
