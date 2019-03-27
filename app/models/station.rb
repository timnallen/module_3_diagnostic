class Station
  attr_reader :name,
              :address,
              :fuel_type,
              :distance,
              :access_times

  def initialize(attributes)
    @name = attributes[:station_name]
    @address = attributes[:street_address] + ' ' + attributes[:city] + ' ' + attributes[:state] + ' ' + attributes[:zip]
    @fuel_type = attributes[:fuel_type_code]
    @distance = attributes[:]
  end
end
