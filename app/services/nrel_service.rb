class NrelService
  def get_results(zip, limit = nil)
    endpoint = "/api/alt-fuel-stations/v1.json?zip=#{zip}"
    if limit
      limit_param = "&limit=#{limit}"
    else
      limit_param = ''
    end
    get_json(endpoint + limit_param)
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
