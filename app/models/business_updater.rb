class BusinessUpdater

  def initialize(complaints)
    @complaints = complaints
  end

  def update
    client = GooglePlaces::Client.new("AIzaSyCZ5hhE15pCws_eQivuDxuK__G7_fOAPeM")
    results = @complaints.map do |complaint|
      begin
        client.spots_by_query(complaint[0])
      rescue => e
        "something happened"
      end
    end
    results.map do |place|
      begin
        Business.create!(name: place.first.name, lat: place.first.lat, lng: place.first.lng, address: place.first.formatted_address)
      rescue => e
      end
    end
  end
end