## Нижче схема мережі для домашнього завдання
![This is a alt text.](/Screenshots/networking_1.png "networking")

Host – це комп’ютер, на якому запущений Virtual Box;
Server_1 – Віртуальна машина, на якій розгорнуто ОС Linux. Int1 цієї машини в
режимі «Мережевий міст» підключений до мережі Net1, тобто знаходиться в адресному
просторі домашньої мережі. IP-адреса Int1 встановлюється статично відповідно до
адресного простору, наприклад 192.168.1.200/24. Інтерфейси Int2 та Int3 відповідно
підключено в режимі «Внутрішня мережа» до мереж Net2 та Net3.
Client_1 та Client_2 – Віртуальні машини, на яких розгорнуто ОС Linux (бажано
різні дистрибутиви, наприклад Ubuntu та CentOS). Інтерфейси підключені в режимі
«Внутрішня мережа» до мереж Net2, Net3 та Net4 як показано на рисунку 1.
- Адреса мережі Net2 – 10.Y.D.0/24, де Y – дві останні цифри з вашого року
народження, D – дата народження.
- Адреса мережі Net3 – 10.M.Y.0/24, де M – номер місяця народження.
- Адреса мережі Net4 – 172.16.D.0/24

### Базові настройки з віртуалбокса
![This is a alt text.](/Screenshots/server_1_vb.png "server1")
![This is a alt text.](/Screenshots/client_1_vb.png "server1")
![This is a alt text.](/Screenshots/client_2_vb.png "server1")

1. [qwerty](https://github.com/ilovekharkiv/EPAM-L1/blob/master/Homework%20%232.%20Databases/Homework%20%232.%20Databases.md#1-download-mysql-server-for-your-os-on-vm)
