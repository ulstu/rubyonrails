# frozen_string_literal: true

module ClassList
  def self.names(path)
    parsers = Dir[path].map do |file|
      File.basename(file, '*.rb').split('_').map(&:capitalize).join.sub!('.rb', '')
    end
    parsers
  end
end
