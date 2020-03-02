### Прочитать статьи
1. https://habr.com/ru/post/143990/ - Метаклассы Ruby
1. https://habr.com/ru/post/143483/ - Include vs Extend
1. http://nashbridges.me/gem-for-end-user - Gem глазами потребителя
1. http://nashbridges.me/procs-and-lambdas - Проки и лямбды
1. http://nashbridges.me/blocks-in-ruby - Блоки в Ruby
1. https://www.komtet.ru/lib/frameworks/ruby-on-rails/bazovye-bloki-metaprogrammirovaniya-na-yazyke-ruby - Метапрограммирование в Ruby
1. http://nashbridges.me/introducing-ruby-oop - Введение в объектно-ориентированный Ruby

### Разработать программу-конвертёр.
Программа должна конвертировать данные публикаций новостей из формата rss в формат atom и json и наоборот (rss -> [atom, json], atom -> [rss, json], json -> [rss, atom]).
В качестве примера rss-файла можно взять выгрузку с https://lenta.ru/rss.
Программа должна запускаться из командной строки с определёнными опциями, а результат записывать в файл (имя файла - произвольное). Допускается вывод данных на консоль.

Пример запуска программы:
$ converter --output-format=atom --input=https://lenta.ru/rss
1. Параметр output-format (выходной формат) может принимать значения rss, atom или json. Параметр output-format обязательный.
1. Параметр input (источник данных) может принимать в качестве значения путь до файла на файловой системе или ссылку в Интернете. Параметр input обязательный.
1. Также программа должна поддерживать опцию --sort, которая может принимать значение asc или desc, который сортирует записи по полю "время публикации". Параметр необязательный.

Требования:
1. Программа должна быть написана с использованием ООП.
1. К проекту должен быть подключен gem rubocop.
1. Сдавать программу в виде pull request к репозиторию https://github.com/ulstu/rubyonrails.

Дополнительные требования:
1. Написать тесты на функционал программы, используя гем minitest.
