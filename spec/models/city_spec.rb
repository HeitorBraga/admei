require 'rails_helper'

RSpec.describe City, type: :model do
  it 'is valid with valid attributes' do
    city = build(:city)
    expect(city.valid?).to be_truthy
  end

  it 'is not valid without a name' do
    city = build(:city)
    city.name = nil
    expect(city.valid?).to be_falsey
  end

  it 'is not valid without a ibge_code' do
    city = build(:city)
    city.ibge_code = nil
    expect(city.valid?).to be_falsey
  end

  it 'is not valid without a state' do
    city = build(:city)
    city.state = nil
    expect(city.valid?).to be_falsey
  end
end
