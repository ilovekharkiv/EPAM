# Table of Contents
#### [Part 1](https://github.com/ilovekharkiv/EPAM/blob/master/Homework%20%232.%20Databases.md#part-1)
1. [Download MySQL server for your OS on VM](https://github.com/ilovekharkiv/EPAM/blob/master/Homework%20%232.%20Databases.md#part-1)
2. [Install MySQL server on VM](https://github.com/ilovekharkiv/EPAM/blob/master/Homework%20%232.%20Databases.md#2-install-mysql-server-on-vm) 
3. [Select a subject area and describe the database schema](https://github.com/ilovekharkiv/EPAM/blob/master/Homework%20%232.%20Databases.md#3-select-a-subject-area-and-describe-the-database-schema) 
4. [Create a database on the server through the console](https://github.com/ilovekharkiv/EPAM/blob/master/Homework%20%232.%20Databases.md#4-create-a-database-on-the-server-through-the-console) 
5. [Fill in tables](https://github.com/ilovekharkiv/EPAM/blob/master/Homework%20%232.%20Databases.md#5-fill-in-tables) 
6. [Construct and execute SELECT operator with WHERE, GROUP BY and ORDER BY](https://github.com/ilovekharkiv/EPAM/blob/master/Homework%20%232.%20Databases.md#6-construct-and-execute-select-operator-with-where-group-by-and-order-by) 
7. [Execute other different SQL queries DDL, DML, DCL.](https://github.com/ilovekharkiv/EPAM/blob/master/Homework%20%232.%20Databases.md#7-execute-other-different-sql-queries-ddl-dml-dcl) 
8. [Create a database of new users with different privileges. Connect to the database as a new user and verify that the privileges allow or deny certain actions.](https://github.com/ilovekharkiv/EPAM/blob/master/Homework%20%232.%20Databases.md#8-create-a-database-of-new-users-with-different-privileges-connect-to-the-database-as-a-new-user-and-verify-that-the-privileges-allow-or-deny-certain-actions) 
9. [Make a selection from the main table DB MySQL](https://github.com/ilovekharkiv/EPAM/blob/master/Homework%20%232.%20Databases.md#9-make-a-selection-from-the-main-table-db-mysql) 

#### [Part 2](https://github.com/ilovekharkiv/EPAM/blob/master/Homework%20%232.%20Databases.md#part-2-1)
10. [Make backup of your database](https://github.com/ilovekharkiv/EPAM/blob/master/Homework%20%232.%20Databases.md#10-make-backup-of-your-database) 
11. [Delete the table and/or part of the data in the table.](https://github.com/ilovekharkiv/EPAM/blob/master/Homework%20%232.%20Databases.md#11-delete-the-table-andor-part-of-the-data-in-the-table)
12. [Restore your database.](https://github.com/ilovekharkiv/EPAM/blob/master/Homework%20%232.%20Databases.md#12-restore-your-database) 
13. [Transfer your local database to RDS AWS.]() 
14. [Connect to your database]() 
15. [Execute SELECT operator similar step 6]() 
16. [Create the dump of your database]() 

#### [Part 3](https://github.com/ilovekharkiv/EPAM/blob/master/Homework%20%232.%20Databases.md#part-3)
17. [Create a database. Use the use command to connect to a new database (If it doesn't exist, Mongo will create it when you write to it)](https://github.com/ilovekharkiv/EPAM/blob/master/Homework%20%232.%20Databases.md#17-create-a-database-use-the-use-command-to-connect-to-a-new-database-if-it-doesnt-exist-mongo-will-create-it-when-you-write-to-it)
18. [Create a collection. Use db.createCollection to create a collection. I'll leave the subject up to you. Run show dbs and show collections to view your database and collections](https://github.com/ilovekharkiv/EPAM/blob/master/Homework%20%232.%20Databases.md#18-create-a-collection-use-dbcreatecollection-to-create-a-collection-ill-leave-the-subject-up-to-you-run-show-dbs-and-show-collections-to-view-your-database-and-collections)
19. [Create some documents. Insert a couple of documents into your collection. I'll leave the subject matter up to you, perhaps cars or hats](https://github.com/ilovekharkiv/EPAM/blob/master/Homework%20%232.%20Databases.md#19-create-some-documents-insert-a-couple-of-documents-into-your-collection-ill-leave-the-subject-matter-up-to-you-perhaps-cars-or-hats)
20. [Use find() to list documents out](https://github.com/ilovekharkiv/EPAM/blob/master/Homework%20%232.%20Databases.md#20-use-find-to-list-documents-out)


## Part 1
### 1. Download MySQL server for your OS on VM
### 2. Install MySQL server on VM 
>I didn't use VM, since i have a separate SSD with Ubuntu 22.04 for work/practice. It works faster and more convenient comparing to VMs.

2.1. Follow the instructions [to install MySQL](https://linuxhint.com/install-mysql-on-ubuntu-22-04/#:~:text=To%20install%20MySQL%20on%20Ubuntu%2022.04%2C%20first%2C%20execute%20the%20system,the%20%E2%80%9Csudo%20mysql_secure_installation%E2%80%9D%20command.) according to the guide.

2.2. Check the status of your MySQL service
![This is a alt text.](/Screenshots/01.png "mysql service")

2.3. Check the existing databases with the following command 
```bash
show databases;
```
![This is a alt text.](/Screenshots/02.png "show databases")

### 3. Select a subject area and describe the database schema
![This is a alt text.](/Screenshots/03.png "Database schema")

### 4. Create a database on the server through the console
We created the database with `CREATE TABLE Music;`, used it an checked whether it has any table or not.
![This is a alt text.](/Screenshots/04.png "Database creation")

### 5. Fill in tables
Let's make it one by one, screenshots are attached below.

5.1 Let's start with `countries` table.

```bash
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

```bash
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

```bash
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

![This is a alt text.](/Screenshots/07.png "artists")

5.4 Just to make sure that relations have been setup properly, let's check the database schema with MySQL Workbench.

![This is a alt text.](/Screenshots/08.png "workbench")

5.5 Also let's check the data in every table, just to make sure it's in place and set up properly.

![This is a alt text.](/Screenshots/09.png "countries")
![This is a alt text.](/Screenshots/010.png "labels")
![This is a alt text.](/Screenshots/011.png "artists")


### 6. Construct and execute SELECT operator with WHERE, GROUP BY and ORDER BY

6.1 `SELECT language,COUNT(language) FROM countries GROUP BY language;`

```bash 
mysql> SELECT language,COUNT(language) FROM countries GROUP BY language;
+-----------+-----------------+
| language  | COUNT(language) |
+-----------+-----------------+
| Ukrainian |               1 |
| English   |               3 |
| Polski    |               1 |
+-----------+-----------------+
3 rows in set (0,00 sec)

```
6.2 `SELECT artist_id, first_name, last_name FROM artists WHERE age<40;`
```bash
mysql> SELECT artist_id, first_name, last_name FROM artists WHERE age<40;
+-----------+------------+-----------+
| artist_id | first_name | last_name |
+-----------+------------+-----------+
|       201 | Martin     | Garrix    |
|       301 | Marika     | Rossa     |
+-----------+------------+-----------+
2 rows in set (0,00 sec)

```
6.3  Let's try a little bit more complicated query

```bash
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
### 7. Execute other different SQL queries DDL, DML, DCL

>The most commonly used commands are shown in this guide. I understand the commands and their purpose, but using ALL of them right now will slow me down a lot with this task, so that i'll leave a description with examples.

7.1 DDL commands are:
* **CREATE**: This command is used to create the database or its objects (like table, index, function, views, store procedure, and triggers).
* **DROP**: This command is used to delete objects from the database. `DROP TABLE artists` will delete my `artists` table.
* **ALTER**: This is used to alter the structure of the database. I used `ALTER TABLE` to add `FOREIGN KEY` to my table while practising;
* **TRUNCATE**: This is used to remove all records from a table, including all spaces allocated for the records are removed. `TRUNCATE TABLE artists;` will delete ALL records from my `artists` table
* **COMMENT**: This is used to add comments to the data dictionary. `SELECT artist_id /* Comment goes here */ FROM artists;` will show the `artist_id` from my `artist` table.
* **RENAME**: This is used to rename an object existing in the database. `RENAME TABLE countries TO country;` will rename the table `countries` to table `country`

7.2 DML commands are:
* **INSERT** : It is used to insert data into a table.
* **UPDATE**: It is used to update existing data within a table. `UPDATE countries SET country_name='UA';` will update the column `country_name` from the `country` table;
* **DELETE** : It is used to delete records from a database table. `DELETE FROM Music.artists WHERE artist_id=505;` will delete one of my artists from `artists` table with `artist_id` equal to `501`.
* **LOCK**: Table control concurrency. `LOCK TABLE countries READ;` will lock `countries` tables from writing.
* **CALL**: Call a PL/SQL or JAVA subprogram.
* **EXPLAIN PLAN**: It describes the access path to data.

7.3 DCL commands are:
* **GRANT**: This command gives users access privileges to the database.
* **REVOKE**: This command withdraws the user’s access privileges given by using the GRANT command.

### 8. Create a database of new users with different privileges. Connect to the database as a new user and verify that the privileges allow or deny certain actions

8.1 Let's create a user 
`CREATE USER 'testuser'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Password123#@!';`

8.2 Make sure he exists
![This is a alt text.](/Screenshots/012.png "testuser")

8.3 We need to give him access rights 
`GRANT CREATE, INSERT, UPDATE, SELECT on Music.countries TO 'testuser'@'localhost' WITH GRANT OPTION;`

8.4 Make sure `PRIVELEGES` set up
```bash
mysql> SHOW GRANTS FOR 'testuser'@'localhost';
+---------------------------------------------------------------------------------------------------------+
| Grants for testuser@localhost                                                                           |
+---------------------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `testuser`@`localhost`                                                            |
| GRANT SELECT, INSERT, UPDATE, CREATE ON `Music`.`countries` TO `testuser`@`localhost` WITH GRANT OPTION |
+---------------------------------------------------------------------------------------------------------+
2 rows in set (0,00 sec)

```
8.5 Let's just `FLUSH PRIVELEGES;` as a common practice command

8.6 Login with `testuser` and execute `SELECT current_user();`
```bash
pavlo@pavlo-Z490-UD:~$ mysql -u testuser -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 115
Server version: 8.0.31-0ubuntu0.22.04.1 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SELECT current_user();
+--------------------+
| current_user()     |
+--------------------+
| testuser@localhost |
+--------------------+
1 row in set (0,00 sec)
```

8.7 Use `Music` database and try to `SELECT` from the table `artists` which `testuser` doesn't have access to and make sure priveleges work as expected
```bash
mysql> use Music;
Database changed
mysql> SELECT artist_id FROM artists;
ERROR 1142 (42000): SELECT command denied to user 'testuser'@'localhost' for table 'artists'
```
8.7 Use `Music` database and try to `SELECT` from the table `countries` which `testuser` HAS access to and make sure priveleges work as expected
```bash
mysql> SELECT * FROM countries;
+------------+--------------+-----------+------------+
| country_id | country_name | language  | population |
+------------+--------------+-----------+------------+
|          3 | UA           | Ukrainian | 150m       |
|          5 | UK           | English   | 50m        |
|          7 | US           | English   | 250m       |
|          9 | PL           | Polski    | 35m        |
|         11 | UK           | English   | 10m        |
+------------+--------------+-----------+------------+
5 rows in set (0,00 sec)
```
### 9 Make a selection from the main table DB MySQL
```bash
mysql> SELECT Host,Db,User,Select_priv FROM db;
+-----------+--------------------+---------------+-------------+
| Host      | Db                 | User          | Select_priv |
+-----------+--------------------+---------------+-------------+
| localhost | performance_schema | mysql.session | Y           |
| localhost | sys                | mysql.sys     | N           |
+-----------+--------------------+---------------+-------------+
2 rows in set (0,00 sec)

```
## Part 2

### 10. Make backup of your database 
 
Let's make a backup of my `Music` database using `mysqldump` command. The results will be shown on the screen below. 

`mysqldump -u root -p Music > ~/Desktop/EPAM/L1/Homework\ #2.\ Databases/Music.sql`

![This is a alt text.](/Screenshots/013.png "mysqldump")

Database dump has been created sucessfully.

### 11. Delete the table and/or part of the data in the table.

Let's delete `artists` table in my `Music` database. The command and the output attached below.

```bash
mysql> SHOW TABLES;
+-----------------+
| Tables_in_Music |
+-----------------+
| artists         |
| countries       |
| labels          |
+-----------------+
3 rows in set (0,00 sec)

mysql> DROP TABLE artists;
Query OK, 0 rows affected (0,01 sec)

mysql> SHOW TABLES;
+-----------------+
| Tables_in_Music |
+-----------------+
| countries       |
| labels          |
+-----------------+
2 rows in set (0,00 sec)

```
### 12. Restore your database.

12.1 Login to MySQL from `Music.sql` dump is located and `SHOW TABLES;` to make sure our `artists` table is deleted.

```bash
pavlo@pavlo-Z490-UD:~/Desktop/EPAM/L1/Homework #2. Databases$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 17
Server version: 8.0.31-0ubuntu0.22.04.1 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> USE Music;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SHOW TABLES;
+-----------------+
| Tables_in_Music |
+-----------------+
| countries       |
| labels          |
+-----------------+
2 rows in set (0,00 sec)
```
12.2 Let's use `source Music.sql` to restore our table from the backup.
```bash
mysql> source Music.sql;

Query OK, 0 rows affected (0,00 sec)

Query OK, 0 rows affected (0,02 sec)

Query OK, 0 rows affected (0,00 sec)

Query OK, 0 rows affected (0,00 sec)

Query OK, 0 rows affected (0,00 sec)

Query OK, 5 rows affected (0,00 sec)
Records: 5  Duplicates: 0  Warnings: 0

Query OK, 0 rows affected (0,00 sec)

Query OK, 0 rows affected (0,02 sec)

Query OK, 0 rows affected (0,00 sec)

Query OK, 0 rows affected (0,00 sec)

Query OK, 0 rows affected (0,00 sec)

Query OK, 5 rows affected (0,00 sec)
Records: 5  Duplicates: 0  Warnings: 0


Query OK, 0 rows affected (0,01 sec)

Query OK, 0 rows affected (0,00 sec)

Query OK, 0 rows affected (0,00 sec)

Query OK, 0 rows affected (0,00 sec)

Query OK, 5 rows affected (0,00 sec)
Records: 5  Duplicates: 0  Warnings: 0

Query OK, 0 rows affected (0,00 sec)

Query OK, 0 rows affected (0,00 sec)

Query OK, 0 rows affected (0,00 sec)

Query OK, 0 rows affected (0,00 sec)

Query OK, 0 rows affected (0,00 sec)
```

12.3 Let's use `SHOW TABLES;` to make sure all the tables are in place.
```bash
mysql> SHOW TABLES;
+-----------------+
| Tables_in_Music |
+-----------------+
| artists         |
| countries       |
| labels          |
+-----------------+
3 rows in set (0,00 sec)
```
12.4 Let's use `SELECT` to make sure all the data is in place.
```bash
mysql> SELECT * FROM artists;
+-----------+------------+-----------------+----------+-----+--------+
| artist_id | first_name | last_name       | label_id | age | salary |
+-----------+------------+-----------------+----------+-----+--------+
|       101 | Armin      | Van Buuren      |        1 |  42 |  45.45 |
|       201 | Martin     | Garrix          |        3 |  22 |  55.45 |
|       301 | Marika     | Rossa           |        2 |  37 |  65.45 |
|       401 | Tijs       | Michiel Verwest |        5 |  47 |  45.45 |
|       501 | David      | Guetta          |        4 |  32 |  42.57 |
+-----------+------------+-----------------+----------+-----+--------+
5 rows in set (0,00 sec)
```
### 13. Transfer your local database to RDS AWS or Azure


## Part 3
### 17. Create a database. Use the use command to connect to a new database (If it doesn't exist, Mongo will create it when you write to it)
17.1 I have MongoDB installed in docker, since i have Ubuntu 22.04 and it doesn't work properly without container. Let's check if container exists.
![This is a alt text.](/Screenshots/014.png "docker")

17.2 Let's launch MongoDB in Docker with volume.
![This is a alt text.](/Screenshots/015.png "volume")

17.2 Let's dive into container and open MongoDB Shell
![This is a alt text.](/Screenshots/016.png "mongosh")

### 18. Create a collection. Use db.createCollection to create a collection. I'll leave the subject up to you. Run show dbs and show collections to view your database and collections

Let's create a collection 
```bash
test> use Music
switched to db Music
Music> db.createCollection( "artists",
...    {
...      capped: true,
...      autoIndexId: true,
...      size: 10000,
...      max: 50
...    }
... )
{ ok: 1 }
Music> show collections
artists

```

### 19. Create some documents. Insert a couple of documents into your collection. I'll leave the subject matter up to you, perhaps cars or hats
>I am a guge fan od EDM music in the past (and still is) so that it's just collection of artists
```bash
Music> db.artists.insertMany(
... 	[
... 		{
... 			First_Name: "Armin",
... 			Last_Name: "Van Buuren",
... 			Date_Of_Birth: "1960-09-26",
... 			Country: "Netherlands",
... 			Music: "Trance",
... 			Age: "43"
... 					},
... 		{
... 			First_Name: "David",
... 			Last_Name: "Guetta",
... 			Date_Of_Birth: "1990-03-03",
... 			Country: "Netherlands",
... 			Music: "Pop",
... 			Age: "41"
... 		},
... 		{
... 			First_Name: "Martin",
... 			Last_Name: "Garrix",
... 			Date_Of_Birth: "1980-02-02",
... 			Country: "Netherlands",
... 			Music: "Techno",
... 			Age: "23"
... 		},
... 		{
... 			First_Name: "Steve",
... 			Last_Name: "Aoki",
... 			Date_Of_Birth: "1970-01-01",
... 			Country: "USA",
... 			Music: "EDM",
... 			Age: "44"
... 		},
... 		{
... 			First_Name: "Joel",
... 			Last_Name: "Zimmerman",
... 			Date_Of_Birth: "1950-04-04",
... 			Country: "Canada",
... 			Music: "Techno",
... 			Age: "65"
... 		}
... 	]
... );
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId("637250496e377a3a04c39399"),
    '1': ObjectId("637250496e377a3a04c3939a"),
    '2': ObjectId("637250496e377a3a04c3939b"),
    '3': ObjectId("637250496e377a3a04c3939c"),
    '4': ObjectId("637250496e377a3a04c3939d")
  }
}

```

### 20. Use find() to list documents out

20.1 Let's try to find someone who plays `Techno` music
```bash
Music> db.artists.find({ Music: 'Techno' } ) 
[
  {
    _id: ObjectId("637250496e377a3a04c3939b"),
    First_Name: 'Martin',
    Last_Name: 'Garrix',
    Date_Of_Birth: '1980-02-02',
    Country: 'Netherlands',
    Music: 'Techno',
    Age: '23'
  },
  {
    _id: ObjectId("637250496e377a3a04c3939d"),
    First_Name: 'Joel',
    Last_Name: 'Zimmerman',
    Date_Of_Birth: '1950-04-04',
    Country: 'Canada',
    Music: 'Techno',
    Age: '65'
  }
]
```

20.2 Let's try to find someone whos age is `>40` 
```bash
Music> db.artists.find({Age: { $gt: '40' } } ) 
[
  {
    _id: ObjectId("637250496e377a3a04c39399"),
    First_Name: 'Armin',
    Last_Name: 'Van Buuren',
    Date_Of_Birth: '1960-09-26',
    Country: 'Netherlands',
    Music: 'Trance',
    Age: '43'
  },
  {
    _id: ObjectId("637250496e377a3a04c3939a"),
    First_Name: 'David',
    Last_Name: 'Guetta',
    Date_Of_Birth: '1990-03-03',
    Country: 'Netherlands',
    Music: 'Pop',
    Age: '41'
  },
  {
    _id: ObjectId("637250496e377a3a04c3939c"),
    First_Name: 'Steve',
    Last_Name: 'Aoki',
    Date_Of_Birth: '1970-01-01',
    Country: 'USA',
    Music: 'EDM',
    Age: '44'
  },
  {
    _id: ObjectId("637250496e377a3a04c3939d"),
    First_Name: 'Joel',
    Last_Name: 'Zimmerman',
    Date_Of_Birth: '1950-04-04',
    Country: 'Canada',
    Music: 'Techno',
    Age: '65'
  }
]
```

20.3 Let's find someone who has `r` in hiw 'First_Name'
```bash
Music> db.artists.find({First_Name: {$regex: /r/ }}) 
[
  {
    _id: ObjectId("637250496e377a3a04c39399"),
    First_Name: 'Armin',
    Last_Name: 'Van Buuren',
    Date_Of_Birth: '1960-09-26',
    Country: 'Netherlands',
    Music: 'Trance',
    Age: '43'
  },
  {
    _id: ObjectId("637250496e377a3a04c3939b"),
    First_Name: 'Martin',
    Last_Name: 'Garrix',
    Date_Of_Birth: '1980-02-02',
    Country: 'Netherlands',
    Music: 'Techno',
    Age: '23'
  }
]

```
