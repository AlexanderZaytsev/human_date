require 'human_date/view_helpers'


module HumanTime
  class Railtie < Rails::Railtie

    initializer 'rails-i18n' do |app|
      I18n.load_path << Dir[File.join(File.expand_path(File.dirname(__FILE__) + '/../../app/config/locales'), '*.yml')]
      I18n.load_path.flatten!
    end

    initializer 'human_date.view_helpers' do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end