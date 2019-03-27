require 'rails_helper'

describe NrelService do
  context 'instance methods' do
    it '#results' do
      VCR.use_cassette('nrel_service') do
        service = NrelService.new

        response = service.get_results

        expect(response).to be_an_instance_of(Hash)
        expect(response['fuel_stations']).to be_an_instance_of(Array)
        expect(response['fuel_stations'].size).to > 0
      end
    end
  end
end
