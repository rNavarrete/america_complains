require 'yelp_business_id_scraper'
class AddYelpID
  def initialize(businesses)
    @businesses = businesses
  end

  def add_ids
    @businesses.each do |business|
      begin
      split_address = business.address.split(",")
      city_and_state = split_address[1] + " " + split_address[2][0..-7]
        business.yelp_id = YelpBizIdScraper.new(business.name, city_and_state).scrape
        puts "Found #{business.yelp_id}"
        business.save
      rescue => e
      end
    end
  end
end