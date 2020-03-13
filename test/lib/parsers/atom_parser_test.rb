# frozen_string_literal: true

require 'require_all'
require_rel '../../lib'
require 'minitest/autorun'
require 'minitest/pride'
require '../../../lib/parsers/atom_parser'

class AtomParserTest < MiniTest
  def test_parse_file
    file = File.open('fixtures/file1')
    data = AtomParser.parse(file)
    assert_equal 'Заголовок', data[0]['titie']
  end
end
