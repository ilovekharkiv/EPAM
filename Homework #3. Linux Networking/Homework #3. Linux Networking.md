## Here is the network schema
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

Первинні налаштування `VirtualBox`

![This is a alt text.](/Screenshots/server_1_vb.png "server1")
![This is a alt text.](/Screenshots/client_1_vb.png "client1")
![This is a alt text.](/Screenshots/client_2_vb.png "client2")

## Table of contents
#### 1. [На Server_1 налаштувати статичні адреси на всіх інтерфейсах.](https://github.com/ilovekharkiv/EPAM-L1/blob/master/Homework%20%233.%20Linux%20Networking/Homework%20%233.%20Linux%20Networking.md#1-%D0%BD%D0%B0-server_1-%D0%BD%D0%B0%D0%BB%D0%B0%D1%88%D1%82%D1%83%D0%B2%D0%B0%D1%82%D0%B8-%D1%81%D1%82%D0%B0%D1%82%D0%B8%D1%87%D0%BD%D1%96-%D0%B0%D0%B4%D1%80%D0%B5%D1%81%D0%B8-%D0%BD%D0%B0-%D0%B2%D1%81%D1%96%D1%85-%D1%96%D0%BD%D1%82%D0%B5%D1%80%D1%84%D0%B5%D0%B9%D1%81%D0%B0%D1%85-1)
#### 2. [На Server_1 налаштувати DHCP сервіс, який буде конфігурувати адреси Int1 Client_1 та Client_2](https://github.com/ilovekharkiv/EPAM-L1/blob/master/Homework%20%233.%20Linux%20Networking/Homework%20%233.%20Linux%20Networking.md#2-%D0%BD%D0%B0-server_1-%D0%BD%D0%B0%D0%BB%D0%B0%D1%88%D1%82%D1%83%D0%B2%D0%B0%D1%82%D0%B8-dhcp-%D1%81%D0%B5%D1%80%D0%B2%D1%96%D1%81-%D1%8F%D0%BA%D0%B8%D0%B9-%D0%B1%D1%83%D0%B4%D0%B5-%D0%BA%D0%BE%D0%BD%D1%84%D1%96%D0%B3%D1%83%D1%80%D1%83%D0%B2%D0%B0%D1%82%D0%B8-%D0%B0%D0%B4%D1%80%D0%B5%D1%81%D0%B8-int1-client_1-%D1%82%D0%B0-client_2-1)
#### 3. [За допомогою команд ping та traceroute перевірити зв'язок між віртуальнимимашинами. Результат пояснити.](https://github.com/ilovekharkiv/EPAM-L1/blob/master/Homework%20%233.%20Linux%20Networking/Homework%20%233.%20Linux%20Networking.md#3-%D0%B7%D0%B0-%D0%B4%D0%BE%D0%BF%D0%BE%D0%BC%D0%BE%D0%B3%D0%BE%D1%8E-%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4-ping-%D1%82%D0%B0-traceroute-%D0%BF%D0%B5%D1%80%D0%B5%D0%B2%D1%96%D1%80%D0%B8%D1%82%D0%B8-%D0%B7%D0%B2%D1%8F%D0%B7%D0%BE%D0%BA-%D0%BC%D1%96%D0%B6-%D0%B2%D1%96%D1%80%D1%82%D1%83%D0%B0%D0%BB%D1%8C%D0%BD%D0%B8%D0%BC%D0%B8%D0%BC%D0%B0%D1%88%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8-%D1%80%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82-%D0%BF%D0%BE%D1%8F%D1%81%D0%BD%D0%B8%D1%82%D0%B8-1)
#### 4. [На віртуальному інтерфейсу lo Client_1 призначити дві ІР адреси за таким правилом: 172.17.D+10.1/24 та 172.17.D+20.1/24. Налаштувати маршрутизацію таким чином, щоб трафік з Client_2 до 172.17.D+10.1 проходив через Server_1, а до 172.17.D+20.1 через Net4. Для перевірки використати traceroute]()
#### 5. [Розрахувати спільну адресу та маску (summarizing) адрес 172.17.D+10.1 та 172.17.D+20.1, при чому префікс має бути максимально можливим. Видалити маршрути, встановлені на попередньому кроці та замінити їх об’єднаним маршрутом, якій має проходити через Server_1.]()
#### 6. [Налаштувати SSH сервіс таким чином, щоб Client_1 та Client_2 могли підключатись до Server_1 та один до одного.]()
#### 7. [Налаштуйте на Server_1 firewall таким чином: - Дозволено підключатись через SSH з Client_1 та заборонено з Client_2. - З Client_2 на 172.17.D+10.1 ping проходив, а на 172.17.D+20.1 не проходив]()
#### 9. [Якщо в п.3 була налаштована маршрутизація для доступу Client_1 та Client_2 до мережі Інтернет – видалити відповідні записи. На Server_1 налаштувати NAT сервіс таким чином, щоб з Client_1 та Client_2 проходив ping в мережу Інтернет]()

1. На Server_1 налаштувати статичні адреси на всіх інтерфейсах.
Початковий стан інтерфейсів
![This is a alt text.](/Screenshots/initial_settings_server1.png "server1")

Файл настрокий інтерфейсів `/etc/netplan/server_1.yaml` після внесення налаштувань всіх інтерфейсів 
![This is a alt text.](/Screenshots/server_1_yaml.png "server1")

Виконаємо команду `netplan try` та підтвердимо коректність введених даних і пеервіримо налаштування командою `ip a`
![This is a alt text.](/Screenshots/server_1_yaml_ipa.png "server1")

#### 2. На Server_1 налаштувати DHCP сервіс, який буде конфігурувати адреси Int1 Client_1 та Client_2
Встановив DHCP за допомогою команди `sudo apt install isc-dhcp-server` та почав налаштовувати у файлі `/etc/dhcp/dhcpd.conf`. Далі скрин з налаштуваннями файлу
![This is a alt text.](/Screenshots/dhcpd.png "dhcpd")

Виконаємо рестарт `sudo systemctl status isc-dhcp-server` та перевіримо чи активний сервіс `dhcp` за допомогою команди `sudo systemctl status isc-dhcp-server`
![This is a alt text.](/Screenshots/dhcpd_1.png "dhcpd")

`Client_1 - CentOS`. Налаштуємо int1(`enp0s8 - Net_2`) та одразу int2(`enp0s9 - Net_4`) 

Создамо та налаштуємо конфігураційні файли для кожного інтерфейса, це є особливістю CentOS мати конф. файл для кожного мережевого інтерфейсу.
![This is a alt text.](/Screenshots/client_1_centos.png "centos")
![This is a alt text.](/Screenshots/client_1_centos1.png "centos")

`Client_2 - Ubuntu`. Налаштуємо int1(`enp0s8 - Net_3`) та одразу int2(`enp0s9 - Net_4`) 

Налаштуємо конфігураційний файл мережевих інтерфейсів та активуемо налаштування за допомогою команди `sudo netplan try`. Нажати `Enter` якщо нема помилок і конфігурація вдала

![This is a alt text.](/Screenshots/client_2_ubuntu.png "ubuntu")

Перевіримо налаштування командою `ip a`
![This is a alt text.](/Screenshots/client_2_ubuntu1.png "ubuntu")


### 3. За допомогою команд ping та traceroute перевірити зв'язок між віртуальнимимашинами. Результат пояснити.

>Увага! Для того, щоб з Client_1 та Client_2 проходили пакети в мережу Internet (точніше щоб повертались з Internet на Client_1 та Client_2) >на Wi-Fi Router необхідно налаштувати статичні маршрути для мереж Net2 та Net3. Якщо такої можливості немає інтерфейс Int1 на Server_1 >перевести в режим NAT.

3.1 Net_1 - 192.168.1.0/24. На скріні нижче я перевіряю чи ходять пакети до моїх роутерів та в интернет. 

`int1-enp0s3` `Server_1` налаштований в режимі **Мережевий мост**, тому є можливість виходу назовні.

![This is a alt text.](/Screenshots/net_1.png "net1")

3.2 Net_2 - 10.89.1.0/24. На скріні нижче я перевіряю чи ходять пакети `Server_1 <=> Client_1` 

`int2-enp0s8` `Server_1` та `int1-enp0s8` `Client_1` налаштований в режимі **Внутрішня мережа**, тому нема можливість виходу назовні в такій конфігурації

![This is a alt text.](/Screenshots/net_2.png "net2")

3.3 Net_3 - 10.1.89.0/24. На скріні нижче я перевіряю чи ходять пакети `Server_1 <=> Client_2`  

`int3-enp0s9` `Server_1` та `int1-enp0s8` `Client_2` налаштований в режимі **Внутрішня мережа**, тому нема можливість виходу назовні в такій конфігурації

![This is a alt text.](/Screenshots/net_3.png "net3")

3.4 Net_4. На скріні нижче я перевіряю чи ходять пакети `Client_1 <=> Client_2` 

`int2-enp0s9` `Client_1` та `int2-enp0s9` `Client_2` налаштований в режимі **Внутрішня мережа**, тому нема можливість виходу назовні в такій конфігурації

![This is a alt text.](/Screenshots/net_4.png "net4")


### 4. На віртуальному інтерфейсу lo Client_1 призначити дві ІР адреси за таким правилом: 172.17.D+10.1/24 та 172.17.D+20.1/24. Налаштувати маршрутизацію таким чином, щоб трафік з Client_2 до 172.17.D+10.1 проходив через Server_1, а до 172.17.D+20.1 через Net4. Для перевірки використати traceroute

Мої айпішники - 172.17.11.1/24, 172.17.21.1/24. Создаємо конфігураційні файли для кожного нового інтерфейсу, в нашому разі аліаси дефолтного `loopback` інтерфейсі. 

![This is a alt text.](/Screenshots/two_ips.png "ips")

4.1. **Client_2**. Додамо нові маршрути для доступу до інтерфейсів `172.17.11.1`, `172.17.21.1`

![This is a alt text.](/Screenshots/route_client2.png "ips")

4.2. **Server_1**. Додамо нові маршрути для доступу до інтерфейсів `172.17.11.1`, `172.17.21.1`

![This is a alt text.](/Screenshots/route_server1.png "ips")

4.3. **Client_1** Додамо нові маршрути для доступу до інтерфейсів `172.17.11.1`, `172.17.21.1` 

![This is a alt text.](/Screenshots/route_client1.png "ips")

4.4. Перевіримо 2 сценарія в завданні через `traceroute` 

- Налаштувати маршрутизацію таким чином, щоб трафік з Client_2 до 172.17.D+10.1 проходив через Server_1

![This is a alt text.](/Screenshots/traceroute1.png "ips")

- Налаштувати маршрутизацію таким чином, щоб трафік з Client_2 до 172.17.D+20.1 проходив через Net4

![This is a alt text.](/Screenshots/traceroute2.png "ips")

### 5. [Розрахувати спільну адресу та маску (summarizing) адрес 172.17.D+10.1 та 172.17.D+20.1, при чому префікс має бути максимально можливим. Видалити маршрути, встановлені на попередньому кроці та замінити їх об’єднаним маршрутом, якій має проходити через Server_1.]()
### 6. [Налаштувати SSH сервіс таким чином, щоб Client_1 та Client_2 могли підключатись до Server_1 та один до одного.]()
### 7. [Налаштуйте на Server_1 firewall таким чином: - Дозволено підключатись через SSH з Client_1 та заборонено з Client_2. - З Client_2 на 172.17.D+10.1 ping проходив, а на 172.17.D+20.1 не проходив]()
### 9. [Якщо в п.3 була налаштована маршрутизація для доступу Client_1 та Client_2 до мережі Інтернет – видалити відповідні записи. На Server_1 налаштувати NAT сервіс таким чином, щоб з Client_1 та Client_2 проходив ping в мережу Інтернет]()


