use ruby_student;

create table if not exists students(
    id INT primary key not null auto_increment,
    surname VARCHAR(50) not null,
    name VARCHAR(50) not null,
    patronymic VARCHAR(50) not null,
    phone VARCHAR(50),
    email VARCHAR(50),
    telegram_username VARCHAR(50),
    github_username VARCHAR(50)
    );