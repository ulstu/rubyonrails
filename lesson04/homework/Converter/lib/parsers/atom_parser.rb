# frozen_string_literal: true

module ParseAtom
  def self.parseFeed(doc)
    parsedString = []
    feed_title = doc.at_css('feed title').text.strip
    feed_updated = doc.at_css('feed updated').text.strip
    feed_author = doc.at_css('feed author name').text.strip
    feed_id = doc.at_css('feed id').text.strip

    parsedString.push(
     title: feed_title,
     link: feed_link,
     updated: feed_updated,
     author: feed_author,
     id: feed_id
    )
  end

  def self.parseEntry(doc)
    items = []

    doc.css('entry').each do |item|
      entry_title = doc.at_css('entry title').text.strip
      entry_id = doc.at_css('entry id') .text.strip
      entry_updated = doc.at_css('entry updated').text.strip
      entry_summary = doc.at_css('entry summary').text.strip
      
      items.push(
        title: entry_title,
        id: entry_id,
        updated: entry_updated,
        summary: entry_summary
      )

    end

    items
  end

  def self.parse(doc)
    doc = Nokogiri::XML(doc)
    result = { feed: parseFeed(doc),
               entry: parseEntry(doc) }
  end
end
