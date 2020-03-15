class Model
    attr_accessor :guid
    attr_accessor :title
    attr_accessor :links
    attr_accessor :description
    attr_accessor :pubDate
    attr_accessor :enclosure
    attr_accessor :category

    def initilize(guid, title, links, description, pub_date, enclosure, category)
        @guid = guid
        @title = title
        @links = links
        @description = description
        @pub_date = pubDate
        @enclosure = enclosure
        @category = category
    end
end