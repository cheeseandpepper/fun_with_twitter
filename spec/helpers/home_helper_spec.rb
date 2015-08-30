require 'rails_helper'

RSpec.describe HomeHelper, type: :helper do
  
  describe "#parse_at_mention_for!" do
    it "replaces @ mentions with links to the handle page" do
      tweet_text  = "Hey @person.  You are cool. @thisotherperson is also cool!"
      parsed_text = "Hey <a href='http://twitter.com/person' target='_blank'>@person</a>.  You are cool. <a href='http://twitter.com/thisotherperson' target='_blank'>@thisotherperson</a> is also cool!"
      expect(helper.parse_at_mention_for!(tweet_text)).to eq(parsed_text)
    end
  end

  describe "#linkify_links_for!" do
    it "converts html text into clickable links" do
      link_text   = "bla bla http://t.co/path/index.html bla bla"
      parsed_text = "bla bla <a href='http://t.co/path/index.html' target='_blank'>http://t.co/path/index.html</a> bla bla" 
      expect(helper.linkify_links_for!(link_text)).to eq(parsed_text)
    end
  end

  describe "#apply_text_modifications_for!" do
    let(:original_string  ) { "Hey @person. Visit http://mike.is.cool.com for fun!" }
    let(:linked_string    ) { "Hey @person. Visit <a href='http://mike.is.cool.com' target='_blank'>http://mike.is.cool.com</a> for fun!" }
    let(:at_mention_string) { "Hey <a href='http://twitter.com/person' target='_blank'>@person</a>. Visit <a href='http://mike.is.cool.com' target='_blank'>http://mike.is.cool.com</a> for fun!"}

    it "invokes the linkify_links_for! method" do
      expect(helper).to receive(:linkify_links_for!).with(original_string).and_return(linked_string)
      helper.apply_text_modifications_for!(original_string)
    end

    it "invokes the parse_at_mention_for! method" do
      expect(helper).to receive(:parse_at_mention_for!).with(linked_string).and_return(at_mention_string)
      helper.apply_text_modifications_for!(original_string)
    end
  end

end
