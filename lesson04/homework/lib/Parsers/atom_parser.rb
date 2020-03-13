# frozen_string_literal: true

require 'nokogiri'

# Module for parsing atom format
module AtomParser
  def self.parse(input)
    xml_doc = Nokogiri::XML(input)
    acc = []
    array_of_hashes = run(acc, xml_doc.children)
    data_hash_format(array_of_hashes)
  end

  def self.run(acc, xml)
    nested_content = []
    xml.children.each do |xml_child|
      if xml_child.first_element_child.nil?
        if xml_child.attributes != {}
          acc.push(xml_child.name => attributes_parse(xml_child.attributes))
        elsif xml_child.name == 'text' || xml_child.name == '#cdata-section'
          unless xml_child.content.strip.empty?
            nested_content.push(xml_child.parent.name => xml_child.parent.content)
          end
        else
          acc.push(xml_child.name => xml_child.content)
        end
      else
        acc.push(xml_child.name => run(acc, xml_child.children))
      end
    end

    return acc if nested_content.empty?

    nested_content
  end

  def self.attributes_parse(attrs)
    result = Hash.new(0)
    attrs.each do |att|
      result.merge!({ '@' + att[0] => att[1].to_s })
    end
    result
  end

  def self.data_hash_format(data_hash)
    formated = Hash.new(0)
    data_hash.each do |hash|
      hash.map do |key, values|
        if formated.key?(key)
          formated[key].push(values) if formated[key].is_a?(Array)
        else
          formated.merge!(key => values)
        end
      end
    end
    formated
  end

  # more precise conditions are needed
  def self.can_parse?(input)
    return true unless (input =~ /feed/).nil?

    false
  end
end
