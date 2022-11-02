# Part 1
## 1. Download MySQL server for your OS on VM.
## 2. Install MySQL server on VM. (_**However, I personally used separate SSD with Ubuntu 22.04 can combine them**_)

1.1. Use the package manager [to install MySQL](https://linuxhint.com/install-mysql-on-ubuntu-22-04/#:~:text=To%20install%20MySQL%20on%20Ubuntu%2022.04%2C%20first%2C%20execute%20the%20system,the%20%E2%80%9Csudo%20mysql_secure_installation%E2%80%9D%20command.) according to the guide.

1.2. Check the status of MySQL service

```bash
systemctl status mysql.service 
```
![This is a alt text.](/Screenshots/01.png "This is a sample image.")
