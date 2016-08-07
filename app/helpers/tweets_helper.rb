require 'awesome_print'

module TweetsHelper
  def linkify html
    html.gsub(%r{https?://[^\s<]+}) do |url|
      "<a href='#{url}' rel='nofollow' target='_blank'>#{url}</a>"
    end.gsub(%r{\@\w+}) do |sn|
      sn[0] = ''
      "<a href='https://twitter.com/#{sn}'>@#{sn}</a>"
    end
  end

  def color_hashtag html
    html.gsub(%r{(?<=\s|\b|^)\#\w+(?=\b)}) do |h|
      "<span class='hashtag'>#{h}</span>"
    end
  end

  def prettify_hash raw
    raw.ai(html: true, plain: true, index: false, indent: 2)
  end
end
