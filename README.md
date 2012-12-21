# human_date

`human_date` allows you to display times and dates in a human format.

```ruby
date = Date.current # 2012-08-28

human_date(date) # Today
human_date(date + 1.day) # Tomorrow
human_date(date - 1.day) # Yesterday
human_date(date - 2.days) # Aug 26
human_date(date - 1.year) # Aug 28, 2011

# it works with times, too

time = Time.now # 2012-08-28 17:20:54

human_time(time) # 5:20 pm
human_time(time - 1.day) # Yesterday
# ...
```

`human_date` provides you with 5 states for your Time/Date objects:

- `today` displays `Today` for Date and time for Time (`5:20 pm`)

- `tomorrow` displays: `Tomorrow`

- `yesterday` displays: `Yesterday`

- `current_year` displays the month and the day: `Aug 26`

- `other_year` displays the month, the day and the year: `Aug 28, 2011`

The default values can be overwritten in the locale file. See the I18n section for details.

## Installation

Add this line to your application's Gemfile:

    gem 'human_date'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install human_date

## Usage

- `human_date` for dates

- `human_time` for times

- `human_time_tag` generates HTML5 `<time>` tag

### Date examples
```ruby
date = Date.current
# 2012-08-28

human_date(date)
# Today

human_time_tag(date)
# <time datetime="2012-08-28">Today</time>

human_time_tag(date, pubdate: true)
# <time datetime="2012-08-28" pubdate="pubdate">Today</time>
```

### Time examples
```ruby
time = Time.zone.now
# 2012-08-28 17:20:54

human_time(time)
# 5:20 pm

human_time_tag(time)
# <time datetime="2012-08-28T17:20:54">5:20 PM</time>

```

### Namespaces

If you have several models and want each of them to have a different format (for example, for a `Post` you want to display 'Today' if it was posted today, but for a `Comment` you want to display something like '5:20 pm'), you can use namespaces.

```ruby
# config/locales/en.yml
en:
  posts:
    time:
      formats:
        today: "Today"

  comments:
    time:
      formats:
        today: "%l:%M %p"
```

```ruby
time = Time.now
# 2012-08-28 17:20:54

human_time(time, :posts)
# Today

human_time(time, :comments)
# 5:20 pm

human_time_tag(time, :posts)
# <time datetime="2012-08-28T17:20:54">Today</time>

human_time_tag(time, :comments)
# <time datetime="2012-08-28T17:20:54">5:20 pm</time>

human_time_tag(time, :comments, pubdate: true)
# <time datetime="2012-08-28T17:20:54" pubdate="pubdate">5:20 pm</time>
```

## I18n

You can overwrite the default values in your locale file.
```ruby
# config/locales/en.yml
en:
  date:
    formats:
      today: "Today"
      tomorrow: "Tomorrow"
      yesterday: "Yesterday"
      current_year: "%h %e"
      other_year: "%h %e, %Y"

  time:
    formats:
      today: "%l:%M %p"
      tomorrow: "Tomorrow"
      yesterday: "Yesterday"
      current_year: "%h %e"
      other_year: "%h %e, %Y"

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
