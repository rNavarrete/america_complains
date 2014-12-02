require 'mechanize'

class YelpBizIdScraper
  def initialize(business_name, business_city)
    @agent = Mechanize.new
    @business_name = business_name
    @business_city = business_city
  end


  def scrape
    page = @agent.get('http://yelp.com/')
    form = page.forms.first
    form.find_desc = @business_name
    form.find_loc = @business_city
    page = form.submit
    sleep(1)
    page = page.links_with(:dom_class => "biz-name")[1].click
    slug = page.forms.last.action
    slug.scan(/[a-z0-9-]+$/).join
  end
end


