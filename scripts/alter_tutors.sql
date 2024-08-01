ALTER TABLE `univeristy_db`.`tutors` 
ADD COLUMN `Designation` VARCHAR(100) NOT NULL DEFAULT 'Lecturer' AFTER `TutorName`;
