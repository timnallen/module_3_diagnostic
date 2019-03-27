class NrelService
  def get_results(limit = 0)
    get_json("/api/alt-fuel-stations/v1.json?limit=#{limit}&api_key=#{ENV['NREL_KEY']}")
  end
end
