-- Create Tables
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);

CREATE TABLE IF NOT EXISTS user_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    action VARCHAR(50),
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Trigger
DELIMITER $$

CREATE TRIGGER after_user_insert
AFTER INSERT ON users
FOR EACH ROW
BEGIN
    INSERT INTO user_logs (user_id, action)
    VALUES (NEW.id, 'New user added');
END $$

DELIMITER ;

-- Create Stored Procedure
DELIMITER $$

CREATE PROCEDURE GetUsersAboveAge(IN age_limit INT)
BEGIN
    SELECT * FROM users WHERE age > age_limit;
END $$

DELIMITER ;
