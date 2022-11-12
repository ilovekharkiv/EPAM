## Part 1
### 1. Download MySQL server for your OS on VM.
### 2. Install MySQL server on VM. 
>However, I didn't use VM, since i have a separate SSD with Ubuntu 22.04 for work/practice. It works faster and more convenient comparing to VMs.

2.1. Follow the instructions [to install MySQL](https://linuxhint.com/install-mysql-on-ubuntu-22-04/#:~:text=To%20install%20MySQL%20on%20Ubuntu%2022.04%2C%20first%2C%20execute%20the%20system,the%20%E2%80%9Csudo%20mysql_secure_installation%E2%80%9D%20command.) according to the guide.

2.2. Check the status of your MySQL service
![This is a alt text.](/Screenshots/01.png "mysql service")

2.3. Check the existing databases with the following command 
```
show databases;
```
![This is a alt text.](/Screenshots/02.png "show databases")

### 3. Select a subject area and describe the database schema.
![This is a alt text.](/Screenshots/03.png "Database schema")

### 4. Create a database on the server through the console.
We created the database with `CREATE TABLE Music;`, used it an checked whether it has any table or not.
![This is a alt text.](/Screenshots/04.png "Database creation")

### 5. Fill in tables.
Let's make it one by one, screenshots are attached below.

5.1 Let's start with `countries` table.

```
CREATE TABLE countries(
country_id int NOT NULL,
country_name varchar(25) NOT NULL,
language varchar(15) NOT NULL,
population varchar(5),
PRIMARY KEY (country_id)
);

INSERT INTO countries (country_id, country_name, language, population)
VALUES 
(3,'UA','Ukrainian','150m'),
(5,'UK','English','50m'),
(7,'USA','English','250m'),
(9,'PL','Polski','35m'),
(11,'CAN','English','10m');
```
![This is a alt text.](/Screenshots/05.png "countries")


5.2 Let's continue with `labels` table

```
CREATE TABLE labels(
label_id int NOT NULL AUTO_INCREMENT,
release_name varchar(50) NOT NULL,
country_id int NOT NULL,
established_at date,
PRIMARY KEY (label_id),
FOREIGN KEY (country_id) REFERENCES countries(country_id) 
);

INSERT INTO labels (release_name, country_id, established_at)
VALUES 
('Ukraine The Best',03,'2022-11-11'),
('Ukraine The Best',05,'2022-11-10'),
('Thx Poland releases',07,'2022-11-09'),
('Random one',09,'2022-11-08'),
('Test task for Epam',011,'2022-11-07');
```
![This is a alt text.](/Screenshots/06.png "labels")

5.3 The last but not least is `artists` table

```
CREATE TABLE artists(
artist_id int NOT NULL,
first_name varchar(60) NOT NULL,
last_name varchar(60) NOT NULL,
label_id int NOT NULL,
age int NOT NULL,
salary dec(4,2) NOT NULL,
PRIMARY KEY (artist_id),
FOREIGN KEY (label_id) REFERENCES labels(label_id)
);

INSERT INTO artists (artist_id, first_name, last_name, label_id, age, salary)
VALUES 
(101, 'Armin','Van Buuren',1,42,45.45),
(201, 'Martin','Garrix',3,22,55.45),
(301, 'Marika','Rossa',2,37,65.45),
(401, 'Tijs','Michiel Verwest',5,47,45.45),
(501, 'David','Guetta',4,40,15.45);
```

![This is a alt text.](/Screenshots/07.png "labels")

5.4 Just to make sure that relations have been setup properly, let's check the database schema with MySQL Workbench.

![This is a alt text.](/Screenshots/08.png "labels")

5.5 Also let's check the data in every table, just to make sure it's in place and set up properly.

![This is a alt text.](/Screenshots/09.png "labels")
![This is a alt text.](/Screenshots/010.png "labels")
![This is a alt text.](/Screenshots/011.png "labels")


### 6. Construct and execute SELECT operator with WHERE, GROUP BY and ORDER BY.

6.1 `SELECT country_id, language FROM countries GROUP BY country_id;`

``` 
mysql> SELECT country_id, language FROM countries GROUP BY country_id;
+------------+-----------+
| country_id | language  |
+------------+-----------+
|          3 | Ukrainian |
|          5 | English   |
|          7 | English   |
|          9 | Polski    |
|         11 | English   |
+------------+-----------+
5 rows in set (0,00 sec)

```
6.2

6.3  Let's try a little bit more complicated query

```
mysql> SELECT artists.artist_id, artists.first_name, artists.last_name, countries.country_name, countries.language, labels.release_name
    -> FROM labels
    -> RIGHT JOIN countries ON labels.country_id=countries.country_id
    -> LEFT JOIN artists ON labels.label_id=artists.label_id
    -> ORDER BY artists.artist_id;
+-----------+------------+-----------------+--------------+-----------+---------------------+
| artist_id | first_name | last_name       | country_name | language  | release_name        |
+-----------+------------+-----------------+--------------+-----------+---------------------+
|       101 | Armin      | Van Buuren      | UA           | Ukrainian | Ukraine The Best    |
|       201 | Martin     | Garrix          | USA          | English   | Thx Poland releases |
|       301 | Marika     | Rossa           | UK           | English   | Ukraine The Best    |
|       401 | Tijs       | Michiel Verwest | CAN          | English   | Test task for Epam  |
|       501 | David      | Guetta          | PL           | Polski    | Random one          |
+-----------+------------+-----------------+--------------+-----------+---------------------+
5 rows in set (0,00 sec)

```
