show DATABASES;

use ytdatabase;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL
);

INSERT INTO users (username, password, email) 
VALUES 
('Anand', 'Anand123', 'Anandkumaran2003@gmail.com'),
('Ezhilkumar', 'Ezhil123', 'ezhilkumarv2003@gmail.com'),
('Gowtham', 'Gowtham123', 'gowthamsuriya2003@gmail.com');

SELECT * FROM users;