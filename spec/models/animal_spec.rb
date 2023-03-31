require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'is not valid without common and scientific name' do
    bear1= Animal.create 
    bear2= Animal.create name:"name"
    bear3= Animal.create scientific_name:"scientific name"
    expect(bear1.errors).to_not be_empty
    expect(bear2.errors).to_not be_empty
    expect(bear3.errors).to_not be_empty
  end
  it 'is not valid if common name matches scientific name' do
    bear1= Animal.create name:"name", scientific_name:"name"
    expect(bear1.errors).to_not be_empty
  end

  it 'name and scientific name must both be unique' do
    bear2= Animal.create name:"name", scientific_name:"scientific name"
    bear3= Animal.create name:"name", scientific_name:"scientific name"
    expect(bear3.errors).to_not be_empty
  end
end
