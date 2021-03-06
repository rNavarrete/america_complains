class BusinessUpdater

  def initialize(complaints)
    @complaints = complaints
    @business_names = complaints.collect {|complaint| complaint[0]}
  end

  def update
    client = GooglePlaces::Client.new(ENV["GOOGLE_API_KEY"])

    results = @complaints.map do |complaint|
      begin
        client.spots_by_query(complaint[0], :types => ['finance', 'establishment'], :exclude => ['lawyer'])
      rescue => e
        "something happened"
      end
    end
    i = 0
    results.each do |place|
      begin
        Business.create!(name: @business_names[i], lat: place.first.lat, lng: place.first.lng, address: place.first.formatted_address)
      rescue => e
      end
      i += 1
    end
  end
end