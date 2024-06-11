require 'simplecov'

class LineFilter < SimpleCov::Filter
  def matches?(source_file)
    source_file.lines.count < filter_argument
  end
end

SimpleCov.start 'rails' do
  add_filter 'lib/console_helpers.rb'
  add_filter 'lib/templates'
  add_filter 'app/models/application_record.rb'
  add_filter LineFilter.new(5)

  track_files 'app/**/*.rb'
end