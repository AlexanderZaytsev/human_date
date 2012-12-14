include ActionView::Helpers::TagHelper

module HumanDate
  module ViewHelpers
    def human_date(object, namespace = nil)
      I18n.localize(object, format: format_for_object(object, namespace)).strip
    end
    alias_method :human_time, :human_date

    def human_time_tag(object, namespace_or_options = nil, options = nil)
      if namespace_or_options.is_a? Hash
        namespace = nil
        options = namespace_or_options
      else
        namespace = namespace_or_options
        options ||= {}
      end

      options.merge! datetime: object.iso8601

      content_tag :time, human_time(object, namespace), options
    end

  private
    def format_for_object(object, namespace = nil)
      if namespace
        format_for_namespace(object, namespace)
      else
        format_name_for_object(object)
      end
    end

    def format_for_namespace(object, namespace)
      object_type = object.respond_to?(:sec) ? 'time' : 'date'
      format_name = format_name_for_object(object)
      I18n.translate "#{namespace}.#{object_type}.formats.#{format_name}"
    end

    def format_name_for_object(object)
      date = object.to_date
      if date == Date.current
        format = :today
      elsif date == Date.yesterday
        format = :yesterday
      elsif date == Date.tomorrow
        format = :tomorrow
      elsif date.year == Date.today.year
        format = :current_year
      elsif date.year != Date.today.year
        format = :other_year
      end
      format
    end
  end
end