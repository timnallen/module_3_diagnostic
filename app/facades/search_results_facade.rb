class SearchResultsFacade
  def total_results
    service.total_results
  end

  def service
    NrelService.new
  end
end
