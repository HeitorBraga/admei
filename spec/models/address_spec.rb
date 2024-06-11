require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'is valid with valid attributes' do
    address = build(:address)
    expect(address.valid?).to be_truthy
  end

  it 'is not valid without a zip' do
    address = build(:address)
    address.zip = nil
    expect(address.valid?).to be_falsey
  end

  it 'is not valid without a address' do
    address = build(:address)
    address.address = nil
    expect(address.valid?).to be_falsey
  end

  it 'is not valid without a district' do
    address = build(:address)
    address.district = nil
    expect(address.valid?).to be_falsey
  end

  describe '#state_id' do
    let(:address) { Address.new }
    let(:city) { build(:city) }

    context 'when the states_id is set' do
      it 'returns the value set' do
        address.state_id = 100
        expect(address.state_id).to eq(100)
      end
    end

    context 'when the city is set' do
      it 'returns the city state_id' do
        address.city = city
        expect(address.state_id).to eq(city.state_id)
      end
    end
  end

  describe '.permited_params' do
    it 'return the permited params' do
      expect(Address.permited_params).to eq({ address_attributes: [:id, :zip, :address, :number, :more, :district, :city_id, :state_id] })
    end
  end
end
