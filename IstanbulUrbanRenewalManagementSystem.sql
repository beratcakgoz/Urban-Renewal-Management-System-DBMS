CREATE TABLE districts ( 
    district_id INT PRIMARY KEY, 
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE owners ( 
    owner_id INT PRIMARY KEY, 
    name VARCHAR(100) NOT NULL, 
    phone VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE contractors (
    contractor_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    company VARCHAR(100) NOT NULL
);

CREATE TABLE buildings ( 
    building_id INT PRIMARY KEY, 
    district_id INT NOT NULL,
    address VARCHAR(100) NOT NULL,
    build_year INT CHECK (build_year >= 1900),
    floor_count INT CHECK (floor_count >= 0),
    FOREIGN KEY (district_id) REFERENCES districts(district_id)
);

CREATE TABLE risk_assessments (
    assessment_id INT PRIMARY KEY,
    building_id INT NOT NULL,
    assessment_date DATE NOT NULL,
    risk_score INT CHECK (risk_score >= 0 AND risk_score <= 100),
    FOREIGN KEY (building_id) REFERENCES buildings(building_id)
);

CREATE TABLE structural_details (
    detail_id INT PRIMARY KEY,
    building_id INT NOT NULL UNIQUE,
    material VARCHAR(50) NOT NULL,
    foundation_type VARCHAR(50) NOT NULL,
    soil_type VARCHAR(50) NOT NULL,
    FOREIGN KEY (building_id) REFERENCES buildings(building_id)
);

CREATE TABLE inspection_reports ( 
    report_id INT PRIMARY KEY, 
    building_id INT NOT NULL,
    inspector_name VARCHAR(100) NOT NULL,
    report_date DATE NOT NULL,
    result VARCHAR(300) NOT NULL,
    FOREIGN KEY (building_id) REFERENCES buildings(building_id)
);

CREATE TABLE building_owners ( 
    id INT PRIMARY KEY,
    building_id INT NOT NULL, 
    owner_id INT NOT NULL,
    ownership_rate DECIMAL(5,2) CHECK (ownership_rate > 0 AND ownership_rate <= 100),
    FOREIGN KEY (building_id) REFERENCES buildings(building_id),
    FOREIGN KEY (owner_id) REFERENCES owners(owner_id)
);

CREATE TABLE transformation_projects ( 
    project_id INT PRIMARY KEY, 
    building_id INT NOT NULL, 
    start_date DATE NOT NULL,
    status VARCHAR(50) CHECK (status IN ('Planning', 'In Progress', 'Completed', 'Cancelled')),
    FOREIGN KEY (building_id) REFERENCES buildings(building_id)
); 

CREATE TABLE project_contractors (
    id INT PRIMARY KEY,
    project_id INT NOT NULL,
    contractor_id INT NOT NULL,
    FOREIGN KEY (project_id) REFERENCES transformation_projects(project_id),
    FOREIGN KEY (contractor_id) REFERENCES contractors(contractor_id)
);

INSERT INTO districts (district_id, name) VALUES
    (1, 'Basaksehir'),
    (2, 'Esenyurt'),
    (3, 'Avcilar'),
    (4, 'Beylikduzu'),
    (5, 'Bakirkoy');

INSERT INTO owners (owner_id, name, phone) VALUES
    (1, 'Ahmet Yilmaz', '1133027057'),
    (2, 'Ayse Demir', '1113053058'),
    (3, 'Mehmet Kaya', '1113523059'),
    (4, 'Fatma Celik', '1113028860'),
    (5, 'Ali Can', '1114023061'),
    (6, 'Zeynep Sahin', '1113063062'),
    (7, 'Burak Ozturk', '1113553063');

INSERT INTO contractors (contractor_id, name, company) VALUES
    (1, 'Kemal Yildiz', 'Yildiz Construction'),
    (2, 'Yusuf Yanik ', 'Yanik Building'),
    (3, 'Elif Mutlu', 'Mutlu Architecture'),
    (4, 'Melek Erdem', 'Erdem Engineering'),
    (5, 'Ozan Kilic', 'Kilic Excavation');

INSERT INTO buildings (building_id, district_id, address, build_year, floor_count) VALUES
    (1, 1, 'Bahcesehir Black Villas', 2005, 3),
    (2, 2, 'Ruzgar Villas', 2000, 3),
    (3, 2, 'Dinc Houses, Asik Veysel', 2012, 6),
    (4, 5, 'Polat Yali Residences, Yesilyurt', 1995, 5),
    (5, 5, 'Vadi Mansions, Yesilkoy', 1985, 4),
    (6, 5, 'Bilgi Florya Complex, Florya', 2014, 7),
    (7, 4, 'Sehrilalezar Estates, Beylikduzu', 1998, 11),
    (8, 3, 'Ok Panorama, Avcilar', 2020, 14);

INSERT INTO structural_details (detail_id, building_id, material, foundation_type, soil_type) VALUES
    (1, 1, 'Reinforced Concrete', 'Raft Foundation', 'Sandy'),
    (2, 2, 'Brick Masonry', 'Strip Foundation', 'Clayey'),
    (3, 3, 'Reinforced Concrete', 'Isolated Footing', 'Rocky'),
    (4, 4, 'Reinforced Concrete', 'Raft Foundation', 'Fill'), 
    (5, 5, 'Steel', 'Raft Foundation', 'Rocky'),
    (6, 6, 'Timber', 'Stone Foundation', 'Weak'),
    (7, 7, 'Reinforced Concrete', 'Pile Foundation', 'Rocky'),
    (8, 8, 'Reinforced Concrete', 'Strip Foundation', 'Sandy');

INSERT INTO risk_assessments (assessment_id, building_id, assessment_date, risk_score) VALUES
    (1, 1, '2023-01-15', 75),
    (2, 2, '2022-02-20', 88),
    (3, 3, '2022-03-10', 45),
    (4, 4, '2021-04-05', 92),
    (5, 5, '2020-05-12', 30),
    (6, 6, '2025-06-18', 95),
    (7, 7, '2026-07-22', 15),
    (8, 8, '2013-08-30', 60);

INSERT INTO inspection_reports (report_id, building_id, inspector_name, report_date, result) VALUES
    (1, 1, 'Canan Er', '2023-01-20', 'Retrofitting Required'),
    (2, 2, 'Ali Veli', '2023-02-25', 'Urgent Demolition'),
    (3, 3, 'Canan Er', '2023-03-15', 'Low Risk'),
    (4, 4, 'Veli Goc', '2023-04-10', 'Urgent Demolition'),
    (5, 5, 'Ayse Nur', '2023-05-18', 'Safe'),
    (6, 6, 'Veli Goc', '2023-06-25', 'Urgent Demolition'),
    (7, 7, 'Ali Veli', '2023-07-28', 'Safe'),
    (8, 8, 'Ayse Nur', '2023-09-05', 'Retrofitting Required');

INSERT INTO building_owners (id, building_id, owner_id, ownership_rate) VALUES
    (1, 1, 1, 50.00),
    (2, 1, 2, 50.00),
    (3, 2, 3, 100.00),
    (4, 3, 4, 100.00),
    (5, 4, 5, 60.00),
    (6, 4, 6, 40.00),
    (7, 5, 7, 100.00),
    (8, 6, 1, 100.00),
    (9, 7, 2, 100.00),
    (10, 8, 3, 100.00);

INSERT INTO transformation_projects (project_id, building_id, start_date, status) VALUES
    (1, 2, '2023-10-01', 'In Progress'),
    (2, 4, '2023-11-15', 'Planning'),
    (3, 6, '2024-01-10', 'In Progress'),
    (4, 1, '2023-02-20', 'Planning'),
    (5, 8, '2024-03-05', 'Planning');

INSERT INTO project_contractors (id, project_id, contractor_id) VALUES
    (1, 1, 1),
    (2, 1, 5),
    (3, 2, 2),
    (4, 3, 3),
    (5, 4, 4),
    (6, 5, 1);