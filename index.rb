require 'open-uri'
require 'nokogiri'
require 'json'
require 'rss'

url1 = 'https://lenta.ru/rss'
url2 = 'http://webi.ru/index.php?webicl=art&webirss=atom'
link = '{"threads":
   [{"posts":
   {"banned":0,
   "closed":0,
   "comment":""}}]}'


class FormatJson
  def create_rss(the_path_to_the_data)
    result = JSON.parse(the_path_to_the_data)
    puts result.to_json
    File.open('file1.txt', 'w') do |file|
      file.puts result.to_json
    end
  end

  def create_atom
  end
end

class FormatRss
  def create_json(the_path_to_the_data)
    xml_feed = Nokogiri::XML(open(the_path_to_the_data))
    doc = xml_feed.xpath('//item')
    
    result = {
      'News' => []
    }
    i = 0
    doc.search('item').each do |el|
    guid = el.at('guid').text
    title = el.at('title').text
    links = el.at('link').text
    description = el.at('description').text
    pubDate = el.at('pubDate').text
    enclosure = el.at('enclosure').text
    category = el.at('category').text
    
    result['News'] << {
      guid: guid,
      title: title,
      links: links,
      description: description,
      pubDate: pubDate,
      enclosure: enclosure,
      category: category,
      }
    i += 1
    end
    File.open('file1.txt', 'w') do |file|
      file.write(result.to_json)
    end
    puts result.to_json
  end

  def create_atom(the_path_to_the_data)
    xml_feed = Nokogiri::XML(open(the_path_to_the_data))
    doc = xml_feed.xpath('//item')
      
    result = {
      'News' => []
    }
    i = 0
    doc.search('item').each do |el|
      guid = el.at('guid').text
      title = el.at('title').text
      links = el.at('link').text
      description = el.at('description').text
      pubDate = el.at('pubDate').text
      enclosure = el.at('enclosure').text
      category = el.at('category').text
      
      result['News'] << {
        guid: guid,
        title: title,
        links: links,
        description: description,
        pubDate: pubDate,
        enclosure: enclosure,
        category: category
      }
    i += 1
    end
    File.open('file1.txt', 'w') do |file|
      file.puts result
    end
    puts result
  end
end

class FormatAtom
  def create_rss(the_path_to_the_data)
  end

  def create_json(the_path_to_the_data)
    xml_feed = Nokogiri::XML(open(the_path_to_the_data))
    doc = xml_feed.xpath('//item')
    
    result = {
      'News' => []
    }
    i = 0
    doc.search('item').each do |el|
    guid = el.at('guid').text
    title = el.at('title').text
    links = el.at('link').text
    description = el.at('description').text
    pubDate = el.at('pubDate').text
    enclosure = el.at('enclosure').text
    category = el.at('category').text
    
    result['News'] << {
      guid: guid,
      title: title,
      links: links,
      description: description,
      pubDate: pubDate,
      enclosure: enclosure,
      category: category,
      }
    i += 1
    end
    File.open('file1.txt', 'w') do |file|
      file.puts result.to_json
    end
    puts result.to_json
  end
end

