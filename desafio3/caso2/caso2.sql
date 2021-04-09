---creamos la base de datos donde vamos a trabajar---
CREATE DATABASE caso2;

---cambiamos a base de datos caso1---
\c caso2;

---creamos tabla de datos---
CREATE TABLE classes(
    id SERIAL,
    course_name VARCHAR(50),
    PRIMARY KEY (id));

CREATE TABLE students(
    rut VARCHAR(20),
    student_name VARCHAR(50),
    class_id INT,
    PRIMARY KEY (rut),
    FOREIGN KEY (class_id) REFERENCES classes (id));

CREATE TABLE teachers(
    id SERIAL,
    teacher_name VARCHAR(50),
    department VARCHAR(100), 
    PRIMARY KEY (id));

CREATE TABLE tests(
    id SERIAL,
    score INT,
    student_rut VARCHAR(20),
    teacher_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (student_rut) REFERENCES students (rut),
    FOREIGN KEY (teacher_id) REFERENCES teachers (id));