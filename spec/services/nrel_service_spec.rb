require 'rails_helper'

describe NrelService do
  context 'instance methods' do
    it '#results' do
      service = NrelService.new

      response = JSON.parse(service.results)

      expect(response.body).to be_an_instance_of(Hash)
      expect(response.body['data']).to be_an_instance_of(Array)
      expect(response.body['data'].size).to > 0
    end
  end
end
