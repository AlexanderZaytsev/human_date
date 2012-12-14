require 'rspec'
require 'human_date'
require 'timecop'

I18n.locale = :en
Time.zone = 'London'

I18n.load_path << Dir[File.join(File.expand_path(File.dirname(__FILE__) + '/locales'), '*.yml')]