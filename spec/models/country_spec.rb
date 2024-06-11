require 'rails_helper'

RSpec.describe Country, type: :model do
  it 'is valid with valid attributes' do
    country = build(:country)
    expect(country.valid?).to be_truthy
  end

  it 'is not valid without a name' do
    country = build(:country)
    country.name = nil
    expect(country.valid?).to be_falsey
  end

  it 'is not valid without a ibge_code' do
    country = build(:country)
    country.ibge_code = nil
    expect(country.valid?).to be_falsey
  end

  it 'is not valid without a iso_code' do
    country = build(:country)
    country.iso_code = nil
    expect(country.valid?).to be_falsey
  end
end
