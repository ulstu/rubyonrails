require 'rss'
require 'json'
require 'open-uri'

# Class converter /need coment
class Converter
  attr_accessor :output
  attr_accessor :input

  def initialize(output, input)
    @output = output
    @input = input
  end

  # rss2json /need coment
  def rss2json
    URI.parse(input).open do |rss|
      feed = RSS::Parser.parse(rss)
      feed_data = Hash.new(0)
      feed.channel.instance_variables.each do |channel_instance|
        prepared_feed = prepare_rss2json(feed.channel, channel_instance)
        feed_data.merge!(prepared_feed) unless prepared_feed.nil?
      end
      items_data = []
      feed.items.each do |item|
        prepared_items_hash = Hash.new(0)
        item.instance_variables.each do |item_instance|
          prepared_item = prepare_rss2json(item, item_instance)
          prepared_items_hash.merge!(prepared_item) unless prepared_item.nil?
        end
        items_data.push(prepared_items_hash)
      end

      result = {
        'feed' => feed_data,
        'items' => items_data
      }

      #need move into another method
      File.new(output, 'w+') unless File.exist?(output)
      File.write(output, result.to_json) if File.writable?(output)
    end
  end

  # prepare_rss2json
  # object -
  # property -
  # parent_property -
  # need complite comment

  def prepare_rss2json(object, property, parent_property = '')
    unless parent_property.empty?
      property_child = Hash.new(0)
      object_parent_instance = object.instance_variable_get(parent_property)
      if property.is_a?(Array)
        property.each do |instance_property|
          name = instance_property.to_s[1..-1]
          unless name == 'converter' # fix hardcode
            content = object_parent_instance.send(name)
            unless content.is_a?(TrueClass) || content.nil?
              property_child.merge!({ name => content })
            end
          end
        end
        if property.empty?
          property_name = parent_property.to_s[1..-1]
          property_child = object_parent_instance.map!(&:content) unless property_name == 'item' # fix hardcode
        end
        return property_child
      end
    end

    object_instance = object.instance_variable_get(property)
    property_name = property.to_s[1..-1]
    unless object_instance.nil? || object_instance.is_a?(TrueClass)
      if object_instance.is_a?(String) || object_instance.is_a?(Time)
        return { property_name => object.instance_variable_get(property) }
      end
      unless object_instance == []
        property_array = prepare_rss2json(object, object_instance.instance_variables, property)
        { property_name => property_array }
      end
    end
  end
end

converter = Converter.new('test.json', 'https://lenta.ru/rss')
converter.rss2json
