# Basic CI/CD

Разработка простого **CI/CD** для проекта на Си. Сборка, тестирование, развертывание.

## Chapter III
**P.S. Ни в коем случае не сохраняй дампы в гит!**
### Part 1. Настройка **gitlab-runner**
**== Задание ==**
##### Подними виртуальную машину *Ubuntu Server 22.04 LTS*.
*Будь готов, что в конце проекта нужно будет сохранить дамп образа виртуальной машины.*
##### Скачай и установи на виртуальную машину **gitlab-runner**.
##### Запусти **gitlab-runner** и зарегистрируй его для использования в текущем проекте (*DO6_CICD*).
- Для регистрации понадобятся URL и токен, которые можно получить на страничке задания на платформе.
### Part 2. Сборка
**== Задание ==**
Напиши этап для **CI** по сборке приложений из проекта *C2_SimpleBashUtils*.
В файле _gitlab-ci.yml_ добавь этап запуска сборки через мейк файл из проекта _C2_.
Файлы, полученные после сборки (артефакты), сохрани в произвольную директорию со сроком хранения 30 дней.
**== Если проект *C2_SimpleBashUtils* не выполнен ==**
Напиши этап для **CI** по сборке приложения из папки code-samples *DO*.
В файле _gitlab-ci.yml_ добавь этап запуска сборки через мейк файл из папки code-samples.
Файлы, полученные после сборки (артефакты), сохрани в произвольную директорию со сроком хранения 30 дней.
### Part 3. Тест кодстайла
**== Задание ==**
#### Напиши этап для **CI**, который запускает скрипт кодстайла (*clang-format*).
##### Если кодстайл не прошел, то «зафейли» пайплайн.
##### В пайплайне отобрази вывод утилиты *clang-format*.
### Part 4. Интеграционные тесты
**== Задание ==**
#### Напиши этап для **CI**, который запустит интеграционные тесты.
##### Для проекта *C2_SimpleBashUtils* можешь взять свои уже написанные интеграционные тесты.
##### Для проекта из папки code-samples напиши интеграционные тесты самостоятельно. Тесты могут быть написаны на любом языке (c, bash, python и т.д.) и должны вызывать собранное приложение для проверки его работоспособности на разных случаях.
##### Запусти этот этап автоматически только при условии, если сборка и тест кодстайла прошли успешно.
##### Если тесты не прошли, то «зафейли» пайплайн.
##### В пайплайне отобрази вывод, что интеграционные тесты успешно прошли / провалились.
### Part 5. Этап деплоя
`-` Для завершения этого задания ты должен перенести исполняемые файлы на другую виртуальную машину, которая будет играть роль продакшна. Удачи.
**== Задание ==**
##### Подними вторую виртуальную машину *Ubuntu Server 22.04 LTS*.
#### Напиши этап для **CD**, который «разворачивает» проект на другой виртуальной машине.
##### Запусти этот этап вручную при условии, что все предыдущие этапы прошли успешно.
##### Напиши bash-скрипт, который при помощи **ssh** и **scp** копирует файлы, полученные после сборки (артефакты), в директорию */usr/local/bin* второй виртуальной машины.
##### В файле _gitlab-ci.yml_ добавь этап запуска написанного скрипта.
##### В случае ошибки «зафейли» пайплайн.
В результате ты должен получить готовое к работе приложения из проекта *C2_SimpleBashUtils* (*cat* и *grep*) или приложение из папки code-samples (*DO*) на второй виртуальной машине (в зависимости от того, что ты выполнял).
##### Сохрани дампы образов виртуальных машин.
**P.S. Ни в коем случае не сохраняй дампы в гит!**
- Не забудь запустить пайплайн с последним коммитом в репозитории.
### Part 6. Дополнительно. Уведомления
**gitlab-runner**.
**== Задание ==**
#### Настрой уведомления об успешном/неуспешном выполнении пайплайна через бота с именем «[твой nickname] DO6 CI/CD» в *Telegram*.
- Текст уведомления должен содержать информацию об успешности прохождения как этапа **CI**, так и этапа **CD**.
- В остальном текст уведомления может быть произвольным.
