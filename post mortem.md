# post mortem


Post-Mortem Отчёт: Недоступность сайта
1. Описание инцидента
Сайт по адресу http://3.77.35.146 оказался недоступен. Проблема была выявлена в ходе ручной проверки.

2. Влияние
Пользователи не могли получить доступ к сайту.
Возможная потеря трафика и снижение доверия пользователей.

3. Хронология (таймлайн событий)
⏱ T0 — Обнаружена недоступность сайта при проверке вручную.
⏱ T1 — Выполнена проверка доступности сервера с помощью команды ping <адрес сервера>.



⏱ T2 — Подключение к серверу через SSH выполнено успешно.

Проверена работоспособность веб-сервера (httpd) с помощью команды:

service httpd status


Сервис httpd загружен (Loaded: loaded), но не активен (Active: inactive (dead)).
Последнее отключение произошло 12 февраля 2025 года в 08:14 UTC.
В логах видно, что сервис Apache (httpd) был запущен, перезагружен, а затем остановлен.
👉 Следующим шагом необходимо выяснить причину остановки сервиса. Это можно сделать с помощью команд:

Запустили сервис.  sudo service  httpd start

⏱ T3 — Перезапуск веб-сервера Apache.

Для восстановления работы веб-сервера была выполнена команда:

sudo service httpd start
Ожидаемый результат:
Статус сервиса httpd должен измениться на active (running).
Сайт должен снова начать работать.
👉 Следующим шагом необходимо проверить доступность сайта по адресу http://3.77.35.146 и убедиться, что он работает корректно.


job for http .service failed because a configured resource limit was exceeded


⏱ T4 — Ошибка при запуске веб-сервера Apache.

Возможные причины ошибки:

Недостаточно ресурсов (CPU, RAM, дисковое пространство).
Ограничения в конфигурации systemd (например, LimitNOFILE, LimitNPROC).
Ошибки в конфигурации Apache (например, слишком много открытых соединений).

⏱ T5 почистили дисковое пространство.
 df -h посмотреть дисковое пространство 

⏱ T6  Перенесли файл в нужно место.
Настройки приложения есть в файле: /home/ec2-user/LocalSettings\ \(5\).php
Для работоспособности файл должен лежать в /var/www/html/mediawiki/
Попытаемся скопировать этот файл.

скопировали все заработало.




Написать отчет "post mortem" по выполненной на уроке работе.
В контексте инцидента, "post mortem" означает процесс анализа и оценки инцидента после того,
как проблема была решена и работоспособность веб-сервиса восстановлена. Этот процесс
направлен на изучение причин инцидента, выявление ошибок или недочетов, которые привели к
сбою, и разработку мер для предотвращения подобных инцидентов в будущем.
В рамках учебного "post mortem" могут быть рассмотрены следующие вопросы и аспекты:
● Причины инцидента
● Предпринятые шаги для восстановления сервиса и устранения проблемы и полученные
результаты
● Формулирование рекомендаций и предложений по улучшению процессов

Предпринятые шаги для восстановления сервиса и устранения проблемы и полученные
результаты
