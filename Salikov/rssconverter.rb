# frozen_string_literal: true
require 'nokogiri'
require 'open-uri'
require 'json'


class RssConverter
  attr_accessor :url_file, :output_format, :result, :name_file
  
  def initialize
    self.url_file = ''
    self.result = ''
    self.name_file = {}
  end

  def data_for_rss
    html = open(self.url_file)
    doc = Nokogiri::XML(html)
    @feed = parseFeed(doc)

    @items = doc.search('item').map{ |item|
      item.children.reject(&:text?).map { |desc_child|
        if desc_child.name == 'enclosure'
          [desc_child.name, arr = tag_settings(desc_child)]
        else
          [desc_child.name, desc_child.text]
        end
      }.to_h
    }
    self.result = {'feed' => @feed,
                   'items' => @items}
  end

  def parseFeed(doc)
    feed_result = []
    f_language = doc.at_css('channel language').text.strip
    f_title = doc.at_css('channel title').text.strip
    f_description = doc.at_css('channel description').text.strip
    f_link = doc.at_css('channel link').text.strip
    f_image = {'url' => doc.css('channel image url').text.strip,
               'title' => doc.css('channel image title').text.strip,
               'link' => doc.css('channel image link').text.strip
              }

    feed_result.push(
      language: f_language,
      title: f_title,
      description: f_description,
      link: f_link,
      image: f_image
    )
  end
  def tag_settings(desc_child)
    name = desc_child.xpath('@*').map(&:name)
    enclosure_text = desc_child.xpath('@*')
    arr = {}
    for i in 0...name.length do
      arr[name[i]] = enclosure_text[i]
    end
    arr
  end

  def create_file_json
    name_file = url_file.split('/')
    name_file = name_file[-1].split('.')
    File.open("./#{name_file[0]}.json", 'w'){|file|
      file.write(JSON.pretty_generate(result))
    }
  end

  def convert_to_json(url)
    self.url_file = url
    data_for_rss
    create_file_json
  end
end