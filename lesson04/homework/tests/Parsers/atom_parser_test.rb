# frozen_string_literal: true

require 'minitest/autorun'

# Module for testing OptionsParser module
class AtomParserTest < Minitest::Test
  def setup
    @atom_parser = AtomParser
  end

  def test_atom_format
    hash = {
      head: {
        id: 'http://rss.dw.com/atom/rss-ru-news',
        title: 'Example Feed 11111',
        updated: 'today',
        author: {
          name: 'John Doe',
          email: 'test@gmail.com'
        }
      },
      content: [
        {
          title: 'Example Feed',
          date: 'Thu, 12 Mar 2022 13:06:44 +0300'
        }
      ]
    }

    string = '<feed xmlns="http://www.w3.org/2005/Atom">'\
                '<title>Example Feed 11111</title>'\
                '<id>http://rss.dw.com/atom/rss-ru-news</id>'\
                '<updated>today</updated>'\
                '<author>'\
                  '<name>John Doe</name>'\
                  '<email>test@gmail.com</email>'\
                '</author>'\
                '<entry>'\
                  '<title>Example Feed</title>'\
                  '<updated>Thu, 12 Mar 2022 13:06:44 +0300</updated>'\
                '</entry>'\
              '</feed>'

    assert_equal hash, @atom_parser.parse(string)
  end

  def test_empty_hash
    hash = {
      head: {
      },
      content: [
        {
        }
      ]
    }

    string = '<feed xmlns="http://www.w3.org/2005/Atom">'\
                '<entry>'\
                '</entry>'\
              '</feed>'

    assert_equal hash, @atom_parser.parse(string)
  end
end
