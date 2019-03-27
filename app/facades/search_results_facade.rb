class SearchResultsFacade
  def total_results
    service.get_results.count
  end

  def service
    NrelService.new
  end

  def results
    service.get_results(15)
  end
end
