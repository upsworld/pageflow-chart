require 'nokogiri'

class HtmlFragment
  attr_reader :document

  def initialize(html)
    @document = Nokogiri::HTML(html)
  end

  def has_tag?(selector)
    !!document.at_css(selector)
  end
end
