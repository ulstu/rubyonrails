# frozen_string_literal: true

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.test_files = FileList['test/lib/**/*_test.rb']
end
desc 'Run tests'

task default: :test
