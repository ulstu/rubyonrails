# frozen_string_literal: true

module AtomParser
  def self.parse(data)
    doc = Nokogiri::XML(data)

    # feed_inf = parse_feed(doc)
    items = parse_items(doc)
    result = { item: items }
  end

  def self.parse_feed(doc)
    f_id = doc.at_css('feed id').text.strip
    f_title = doc.at_css('feed title').text.strip
    f_author = { 'name' => doc.css('feed author name').text.strip,
                 'email' => doc.css('feed author email').text.strip,
                 'uri' => doc.css('feed author uri').text.strip }

    f_link1 = doc.at_css('feed link').text.strip
    f_link2 = doc.at_css('feed link').text.strip
    f_image = { 'url' => doc.css('channel image url').text.strip,
                'title' => doc.css('channel image title').text.strip,
                'link' => doc.css('channel image link').text.strip }

    feed_result = {
      id: f_id,
      title: f_title,
      author: f_author,
      link1: f_link1,
      link2: f_link2,
      image: f_image
    }
  end

  def self.parse_items(doc)
    doc.search('entry').map do |item|
      item.children.reject(&:text?).map do |desc_child|
        if desc_child.name == 'link'
          [desc_child.name, arr = tag_settings(desc_child)]
        elsif desc_child.name == 'category'
          [desc_child.name, arr = tag_settings(desc_child)]
        else
          [desc_child.name, desc_child.text]
        end
      end.to_h
    end
  end

  def self.tag_settings(desc_child)
    name = desc_child.xpath('@*').map(&:name)
    enclosure_text = desc_child.xpath('@*')
    arr = {}
    (0...name.length).each do |i|
      arr[name[i]] = enclosure_text[i].text
    end
    arr
  end

  def self.can_parse?(data)
    data.include?('<feed')
  end
end
