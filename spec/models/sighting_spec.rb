require 'rails_helper'

RSpec.describe Sighting, type: :model do
  it 'is not valid without all fields entered' do
    sighting1 = Sighting.create longitude: nil, latitude: nil, date: nil
    sighting2 = Sighting.create longitude: nil, latitude: nil, date: nil
    sighting3 = Sighting.create longitude: 10.10, latitude: nil, date: nil
    sighting4 = Sighting.create longitude: 10.10, latitude: 10.10, date: nil
    sighting5 = Sighting.create longitude: 10.10, latitude: 10.10, date: 20200101
    expect(sighting1.errors).to_not be_empty
    expect(sighting2.errors).to_not be_empty
    expect(sighting3.errors).to_not be_empty
    expect(sighting4.errors).to_not be_empty
    expect(sighting5.errors).to_not be_empty
  end
end
