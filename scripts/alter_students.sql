ALTER TABLE Students
MODIFY StudentName VARCHAR(100) COLLATE utf8mb4_bin,  -- Case-sensitive collation
MODIFY StudentPassword VARCHAR(100) COLLATE utf8mb4_bin;  -- Case-sensitive collation