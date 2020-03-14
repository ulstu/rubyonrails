module NameFiles
  def self.find(path)
    files = Dir[path]
    files.map!{ |file| file.split('/').last.split('.').first }
    files.map!{|name| name.split('_').map(&:capitalize).join('')}
    files
  end
end
