/*CREATE TABLE [dbo].[company]
(
  [companyId] INT NOT NULL PRIMARY KEY,
[companyName] varchar (300) not null,
[website] varchar (350) not null
)
create table job(
[job_id] int primary key,
[jobtitle] varchar(255) not null,
[description] varchar(355) not null,
[location] varchar(255) not null,
[posted_date] datetime,
[employment_type] varchar (250) not null,
[company_id] int,
FOREIGN KEY (job_id) references company(company_id)

);*/

create table details(
  candidate_id INT PRIMARY KEY,
  name varchar(255) not null,
  email varchar(255) unique,
  phone_number INT(30) unique,
  address varchar(399) not NULL
);
INSERT INTO details(candidate_id,name, email,phone_number,address)
VALUES(01, 'SINDI','Sndiaa2gmail.com','0987687654','lehae'),
(02,'thandi','thandiwe@gmai.com','087912345','bramfontein'),
(03,'Korner','korner1@gmail.com','0678995445','new town'),
(04, 'tai', 'tia123@gmail.com', '0768911243','protea glen soweto');


  INSERT INTO job (job_id, jobtitle, description, location, posted_date, employment_type, company_id)
       VALUES (1, 'Software Engineer', 'Develop software applications', 'New York', '2022-01-01 00:00:00', 'Remote',1 ),
       (2, 'Data Analyst', 'Analyze data for business insights', 'Chicago', '2022-02-01 00:00:00', 'Part-time',2),
	   (3, 'Marketing Manager', 'Develop marketing campaigns', 'San Francisco', '2022-03-01 00:00:00', 'Full-time',3);
	   select * from job

INSERT INTO company (company_id, companyName, website)
VALUES (1, 'Microsoft', 'https://www.microsoft.com'),
       (2, 'Google', 'https://www.google.com'),
 (3, 'Amazon', 'https://www.amazon.com');
 
 ```Create the Jobs table
CREATE TABLE Jobs (
  job_id INT PRIMARY KEY IDENTITY(1,1),
  user_id INT FOREIGN KEY REFERENCES Users(user_id),
  category_id INT FOREIGN KEY REFERENCES Categories(category_id),
  title NVARCHAR(255) NOT NULL,
  description NVARCHAR(MAX) NOT NULL,
  location NVARCHAR(255),
  salary NVARCHAR(100),
  created_at DATETIME DEFAULT GETDATE(),
  updated_at DATETIME DEFAULT GETDATE(),
  status NVARCHAR(20) CHECK (status IN ('open', 'closed')) NOT NULL DEFAULT 'open'
);
GO


-- Create the Applications table
CREATE TABLE Applications (
  application_id INT PRIMARY KEY IDENTITY(1,1),
  job_id INT FOREIGN KEY REFERENCES Jobs(job_id),
  user_id INT FOREIGN KEY REFERENCES Users(user_id),
  cover_letter NVARCHAR(MAX),
  resume_link NVARCHAR(255),
  status NVARCHAR(20) CHECK (status IN ('submitted', 'under_review', 'accepted', 'rejected')) NOT NULL DEFAULT 'submitted',
  applied_at DATETIME DEFAULT GETDATE()
);
GO


-- Create the Reviews table
CREATE TABLE Reviews (
  review_id INT PRIMARY KEY IDENTITY(1,1),
  user_id INT FOREIGN KEY REFERENCES Users(user_id),
  job_id INT FOREIGN KEY REFERENCES Jobs(job_id),
  rating INT CHECK (rating BETWEEN 1 AND 5),
  comments NVARCHAR(MAX),
  created_at DATETIME DEFAULT GETDATE()
);
GO


-- Create the Skills table
CREATE TABLE Skills (
  skill_id INT PRIMARY KEY IDENTITY(1,1),
  user_id INT FOREIGN KEY REFERENCES Users(user_id),
  skill_name NVARCHAR(100) NOT NULL,
  proficiency_level NVARCHAR(20) CHECK (proficiency_level IN ('beginner', 'intermediate', 'advanced')) NOT NULL
);
GO


-- Insert sample data into Categories
INSERT INTO Categories (category_name)
VALUES 
  ('Software Development'),
  ('Marketing'),
  ('Finance'),
  ('Customer Support');
GO


-- Insert sample data into Users
INSERT INTO Users (username, email, password, role, phone, bio)
VALUES 
  ('admin1', 'admin@example.com', 'hashed_password_here', 'admin', '1234567890', 'Admin of the platform'),
  ('employer1', 'employer1@example.com', 'hashed_password_here', 'employer', '1234567891', 'Employer with 10+ years of experience'),
  ('seeker1', 'seeker1@example.com', 'hashed_password_here', 'job_seeker', '1234567892', 'Aspiring software developer looking for opportunities');
GO


-- Insert sample data into Jobs
INSERT INTO Jobs (user_id, category_id, title, description, location, salary)
VALUES 
  (2, 1, 'Software Developer', 'Develop and maintain software applications.', 'Remote', '$70,000'),
  (2, 3, 'Financial Analyst', 'Analyze financial data and provide insights.', 'New York, NY', '$85,000');
GO


-- Insert sample data into Applications
INSERT INTO Applications (job_id, user_id, cover_letter, resume_link)
VALUES 
  (1, 3, 'I am a passionate developer...', '(link unavailable)'),
  (2, 3, 'I am interested in finance...', '(link unavailable)');
GO


-- Insert sample data into Skills
INSERT INTO Skills (user_id, skill_name, proficiency_level)
VALUES 
  (3, 'JavaScript', 'advanced'),
  (3, 'Python', 'intermediate');
