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

  def results
    service.get_results(@zip, 15)
  end
end
