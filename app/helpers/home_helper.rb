module HomeHelper

  def apply_text_modifications_for!(tweet_text)
    linkified_text  = linkify_links_for!(tweet_text.dup)
    at_mention_text = parse_at_mention_for!(linkified_text)
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
