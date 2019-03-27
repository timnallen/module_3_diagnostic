class SearchResultsFacade
  def initialize(zip)
    @zip = zip
  end

  def total_results
    service.get_results(@zip).count
  end

  def service
    NrelService.new
  end

  def stations
    stations = service.get_results(@zip, 15)[:fuel_stations]
    stations.map do |result|
      Station.new(result)
    end
  end
end
