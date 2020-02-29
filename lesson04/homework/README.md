### Прочитать статьи
1. https://habr.com/ru/post/143990/ - Метаклассы Ruby
1. https://habr.com/ru/post/143483/ - Include vs Extend
1. http://nashbridges.me/gem-for-end-user - Gem глазами потребителя
1. http://nashbridges.me/procs-and-lambdas - Проки и лямбды
1. http://nashbridges.me/blocks-in-ruby - Блоки в Ruby
1. https://www.komtet.ru/lib/frameworks/ruby-on-rails/bazovye-bloki-metaprogrammirovaniya-na-yazyke-ruby - Метапрограммирование в Ruby
1. http://nashbridges.me/introducing-ruby-oop - Введение в объектно-ориентированный Ruby

### Разработать программу (ТЗ)
Разработать программу-конвертёр.
Программа должна конвертировать данные из формата rss в формат atom и json и наоборот.
В качестве примера rss-файла можно взять выгрузку с https://lenta.ru/rss.
Программа должна запускаться из командной строки с определёнными опциями, а результат записывать в файл. Допускается вывод данных на консоль.

Пример запуска программы:
$ converter --output=atom --input=https://lenta.ru/rss
Параметр output (выходной формат) может принимать значение rss или json. Параметр output обязательный.
Параметр input (источник данных) может принимать в качестве значения путь до файла на файловой системе. Параметр input обязательный.
Также программа должна поддерживать опцию --sort, которая может принимать значение asc или desc, который сортирует записи по полю "время публикации". Параметр необязательный.
Программа должна быть написана с использованием ООП практик. К проекту должен быть подключен gem rubocop.
Сдавать программу в виде pull request к репозиторию https://github.com/ulstu/rubyonrails.
