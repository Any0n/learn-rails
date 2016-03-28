require 'nokogiri'
require 'open-uri'

html_data = open('https://simple.wikipedia.org/wiki/List_of_countries').read
nokogiri_object = Nokogiri::HTML(html_data)

nokogiri_object.css('div#content div#bodyContent div#mw-content-text').each do |a|
	puts a.text
# tagcloud_elements = nokogiri_object.xpath("//ul[@class='tagcloud']/li/a")

# tagcloud_elements.each do |tagcloud_element|
#   puts tagcloud_element.text
end