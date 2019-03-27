class NrelService
  def get_results(limit = nil)
    get_json("/api/alt-fuel-stations/v1.json?limit=#{limit}")
  end

  def get_json(uri)
    response = conn.get(uri)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://developer.nrel.gov') do |faraday|
      faraday.headers["X-Api-Key"] = ENV["NREL_KEY"]
      faraday.adapter Faraday.default_adapter
    end
  end
end
