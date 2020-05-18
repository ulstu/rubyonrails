# frozen_string_literal: true

require 'minitest/autorun'

# Module for testing OptionsParser module
class RssParserTest < Minitest::Test
  def setup
    @rss_parser = RssParser
  end

  def test_rss_format
    hash = {
      head: {
        language: 'ru',
        title: 'Lenta.ru : Новости',
        description: 'Новости, статьи, фотографии, видео. Семь дней в неделю, 24 часа в сутки.',
        image: {
          url: 'https://assets.lenta.ru/small_logo.png',
          title: 'Lenta.ru'
        }
      },
      content: [
        {
          guid: 'https://lenta.ru/news/2020/03/12/climber/',
          title: 'Альпинист сорвался с горы, пролетел 180 метров и выжил',
          description: 'some text',
          date: 'Thu, 15 Mar 2021 13:06:44 +0300',
          enclosure: 'https://icdn.lenta.ru/images/2020/03/11/18/20200311180318744/pic_d9be187c38adbb863e1b210cccc0b48d.jpg',
          category: 'Из жизни'
        }
      ]
    }

    string = '<?xml version="1.0" encoding="UTF-8"?>'\
              '<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">'\
                '<channel>'\
                  '<language>ru</language>'\
                  '<title>Lenta.ru : Новости</title>'\
                  '<description>Новости, статьи, фотографии, видео. Семь дней в неделю, 24 часа в сутки.</description>'\
                  '<image>'\
                    '<url>https://assets.lenta.ru/small_logo.png</url>'\
                    '<title>Lenta.ru</title>'\
                  '</image>'\
                  '<item>'\
                    '<guid>https://lenta.ru/news/2020/03/12/climber/</guid>'\
                    '<title>Альпинист сорвался с горы, пролетел 180 метров и выжил</title>'\
                    '<description>'\
                      'some text'\
                    '</description>'\
                    '<pubDate>Thu, 15 Mar 2021 13:06:44 +0300</pubDate>'\
                    '<enclosure url="https://icdn.lenta.ru/images/2020/03/11/18/20200311180318744/pic_d9be187c38adbb863e1b210cccc0b48d.jpg" type="image/jpeg" length="53601"/>'\
                    '<category>Из жизни</category>'\
                  '</item>'
    assert_equal hash, @rss_parser.parse(string)
  end

  # need complite test
  def test_empty_hash
    hash = {
      head: {
      },
      content: [
        {
        }
      ]
    }

    string = '<?xml version="1.0" encoding="UTF-8"?>'\
              '<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">'\
                '<item>'\
                '</item>'\
              '</rss>'

    assert_equal hash, @rss_parser.parse(string)
  end
end
