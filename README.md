# Systemd - создание unit-файла
## Цель: 
Научиться редактировать существующие и создавать новые unit-файлы.

Для выполнения задания были созданы следующие файлы:
- watchlog - файл с конфигурацией сервиса (/etc/sysconfig/watchlog)
- watchlog.service - сам сервис (/etc/systemd/system/watchlog.service)
- watchlog.timer - таймер для этого сервиса, который будет раз в 30 секунд мониторить лог (/etc/systemd/system/watchlog.timer)
- watchlog.sh скрипт (/opt/watchlog.sh) 
- /var/log/watchlog.log - лог файл с произвольным содержимым и ключевым словом "ALERT"\
Сервис стартует при запуске системы, проверить результат можно командой `tail -f /var/log/messages`\
![Скрин](https://github.com/FeeLinS9/lesson9/blob/master/picture.png)
- spawn-fcgi - файл с раскомментированными строками (/etc/sysconfig/spawn-fcgi)
- spawn-fcgi.service - сервис (/etc/systemd/system/spawn-fcgi.service)
- httpd.service - отредактированный сервис httpd (/usr/lib/systemd/system/httpd.service)
- файлы конфигурации httpd (/etc/sysconfig/httpd-first), (/etc/sysconfig/httpd-second)
- файлы для запуска нескольких экземпляров httpd (/etc/httpd/conf/first.conf, /etc/httpd/conf/second.conf)\
\
Проверить можно командой `ss -tnulp | grep httpd`, web сервер будет работать на двух портах - 80 и 8080.