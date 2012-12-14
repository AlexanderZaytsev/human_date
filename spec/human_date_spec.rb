# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

include HumanDate::ViewHelpers


describe HumanDate::ViewHelpers do

  before do
    Timecop.freeze Time.parse('2012-08-28 17:20:54 +01:00').in_time_zone
    @now = Time.zone.now
    @today = Date.current
  end

  describe '#human_time' do
    it 'returns date in human format' do
      human_date(@today).should eq('Today')
    end

    it 'returns time in human format' do
      human_time(@now).should eq('5:20 PM')
    end

    it 'works with namespaces' do
      human_time(@now, :comments).should eq('17:20')
    end

    it 'works with locales' do
      I18n.locale = :ru
      human_time(@now).should eq('17:20:54')
      I18n.locale = :en
    end
  end

  describe '#human_time_tag' do
    it 'returns <time> tag for time' do
      human_time_tag(@now).should eq('<time datetime="2012-08-28T17:20:54+01:00">5:20 PM</time>')
    end

    it 'returns <time> tag for date' do
      human_time_tag(@today).should eq('<time datetime="2012-08-28">Today</time>')
    end

    it 'allows passing options to <time> tag' do
      human_time_tag(@today, pubdate: true).should eq('<time datetime="2012-08-28" pubdate="pubdate">Today</time>')
    end

    it 'allows using namespace' do
      human_time_tag(@now, :comments).should eq('<time datetime="2012-08-28T17:20:54+01:00">17:20</time>')
    end

    it 'allows using namespace and passing options to <time> tag' do
      human_time_tag(@now, :comments, pubdate: true).should eq('<time datetime="2012-08-28T17:20:54+01:00" pubdate="pubdate">17:20</time>')
    end
  end

  describe '#format_name_for_object' do
    it 'returns the valid format for Time' do
      format_name_for_object(@now).should == :today
      format_name_for_object(@now + 1.day).should == :tomorrow
      format_name_for_object(@now - 1.day).should == :yesterday
      format_name_for_object(@now - 2.days).should == :current_year
      format_name_for_object(@now - 1.year).should == :other_year
    end

    it 'returns the valid format for Date' do
      format_name_for_object(@today).should == :today
      format_name_for_object(@today + 1.day).should == :tomorrow
      format_name_for_object(@today - 1.day).should == :yesterday
      format_name_for_object(@today - 2.days).should == :current_year
      format_name_for_object(@today - 1.year).should == :other_year
    end
  end
end