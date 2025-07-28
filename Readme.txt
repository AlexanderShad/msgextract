Простенький скрипт извлечения содержимого файла сообщения электронной почты формата MSG.

Для извлечения именно содержимого запустите:

msgextract file.msg

Для конвертации в EML запустите:

msgextract --eml file.msg

либо

msgextract -e file.msg

Использует в работе пакеты
- perl-Email-Outlook-Message-scripts 
- mpack

На ALT Linux устанавливается пакетом из репозитория:

su -
apt-get install msgextract
