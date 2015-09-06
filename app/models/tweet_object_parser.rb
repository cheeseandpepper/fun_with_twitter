class TweetObjectParser

  attr_reader :data
  
  def initialize(tweet_object)
    @data = build_object_for!(tweet_object)
  end

  def build_object_for!(tweet_object)
    object = {}
    linkified_text  = linkify_links_for!(tweet_object.text)
    at_mention_text = parse_at_mention_for!(linkified_text)
    
    object[:text           ] = at_mention_text.html_safe
    object[:screen_name    ] = tweet_object.user.screen_name
    object[:image_url      ] = tweet_object.user.profile_image_url_https.to_s
    object[:followers_count] = tweet_object.user.followers_count
    object[:id             ] = tweet_object.id
    object[:favorite_count ] = tweet_object.favorite_count
    object[:retweet_count  ] = tweet_object.retweet_count
    object
  end

  def parse_at_mention_for!(tweet_text)
    modified_text = tweet_text.dup
    matches       = modified_text.scan(/@\w+/)
    
    matches.each do |match| 
      modified_text.gsub!(match, "<a href='http://twitter.com/#{match[1..-1]}' target='_blank'>#{match}</a>")
    end
    
    modified_text.html_safe
  end

  def linkify_links_for!(tweet_text)
    modified_text = tweet_text.dup
    matches       = modified_text.scan(/https?:\/\/[\S]+/)
  
    matches.each do |match|
      modified_text.gsub!(match, "<a href='#{match}' target='_blank'>#{match}</a>")
    end
    
    modified_text.html_safe
  end
end
