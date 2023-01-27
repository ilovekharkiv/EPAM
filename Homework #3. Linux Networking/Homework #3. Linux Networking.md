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

### 1. На Server_1 налаштувати статичні адреси на всіх інтерфейсах.
Початковий стан інтерфейсів
![This is a alt text.](/Screenshots/initial_settings_server1.png "server1")

Файл настрокий інтерфейсів `/etc/netplan/server_1.yaml` після внесення налаштувань всіх інтерфейсів 
![This is a alt text.](/Screenshots/server_1_yaml.png "server1")

Виконаємо команду `netplan try` та підтвердимо коректність введених даних і пеервіримо налаштування командою `ip a`
![This is a alt text.](/Screenshots/server_1_yaml_ipa.png "server1")

### 2. На Server_1 налаштувати DHCP сервіс, який буде конфігурувати адреси Int1 Client_1 та Client_2
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

### 5. Розрахувати спільну адресу та маску (summarizing) адрес 172.17.D+10.1 та 172.17.D+20.1, при чому префікс має бути максимально можливим. Видалити маршрути, встановлені на попередньому кроці та замінити їх об’єднаним маршрутом, якій має проходити через Server_1.

Розрахував підмережу на яка могла б об'єднати мої підмережі = `172.17.0.0/19`

![This is a alt text.](/Screenshots/summ.png "summ")

5.1. `Server_1` - попередні маршрути були видалені. Додаю новий маршрут в конфігураційний файл.

![This is a alt text.](/Screenshots/summ_server1.png "summ")

5.2. `Client_1` - попередні маршрути були видалені. Додаю новий маршрут в конфігураційний файл.

![This is a alt text.](/Screenshots/summ_client1.png "summ")

5.3. `Client_2` - попередні маршрути були видалені. Додаю новий маршрут в конфігураційний файл.

![This is a alt text.](/Screenshots/summ_client2.png "summ")

5.4. Перевіряємо чи вииконали ми завдання і чи ходять пакети у напрямку `Client_2 => Server_1 => Client_1`. Запустимо `traceroute` на обидва айпішніка щоб перевірити напрямок пакетів.

    traceroute 172.17.11.1

![This is a alt text.](/Screenshots/summ_traceroute1.png "summ")

    traceroute 172.17.21.1`

![This is a alt text.](/Screenshots/summ_traceroute2.png "summ")

5.5. Перевіряємо чи ходять пакети в зворотньому напрямку `Client_1 => Server_1 => Client_2`, щоб знати що маршрут працює належним чином

![This is a alt text.](/Screenshots/summ_traceroute3.png "summ")

### 6. Налаштувати SSH сервіс таким чином, щоб Client_1 та Client_2 могли підключатись до Server_1 та один до одного.

6.1. **Client_1** - перевірив чи працює `OpenSSH` дємон, згенерував ssh-ключи та за допомогою команди `ssh-copy-id server1@10.89.1.8` скопіював ключи на **Server_1**, та на **Client_2** командою `ssh-copy-id client2@10.1.89.50` відповідно.

![This is a alt text.](/Screenshots/ssh_1.png "ssh1")

6.2. **Server_1** - перевірив чи працює `OpenSSH` дємон, згенерував ssh-ключи та за допомогою команди `ssh-copy-id client1@10.89.1.50` скопіював ключи на **Client_1**, та на **Client_2** командою `ssh-copy-id client2@10.1.89.50` відповідно.

![This is a alt text.](/Screenshots/ssh_2.png "ssh2")

6.3. **Client_2** - перевірив чи працює `OpenSSH` дємон, згенерував ssh-ключи та за допомогою команди `ssh-copy-id server1@10.1.89.9` скопіював ключи на **Server_1**, та на **Client_2** командою `ssh-copy-id client1@10.89.1.50` відповідно.

![This is a alt text.](/Screenshots/ssh_3.png "ssh2")

Переконаємось, що ssh налаштован належним чином на всіх машинах і є можливість зайди на кожну з них з будь якої іншої

6.4. Перевіримо **Client_1 <=> Client_2** 
![This is a alt text.](/Screenshots/ssh_1.png "ssh")

6.5. Перевіримо **Server_1 => Client_1/Client_2** 
![This is a alt text.](/Screenshots/ssh_2.png "ssh")

6.6. Перевіримо **Client_1/Client_2 => Server_1** 
![This is a alt text.](/Screenshots/ssh_3.png "ssh")


### 7. Налаштуйте на Server_1 firewall таким чином: - Дозволено підключатись через SSH з Client_1 та заборонено з Client_2. - З Client_2 на 172.17.D+10.1 ping проходив, а на 172.17.D+20.1 не проходив
### 8. Якщо в п.3 була налаштована маршрутизація для доступу Client_1 та Client_2 до мережі Інтернет – видалити відповідні записи. На Server_1 налаштувати NAT сервіс таким чином, щоб з Client_1 та Client_2 проходив ping в мережу Інтернет


