require 'rails_helper'

RSpec.describe Trader, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      trader = build(:trader)
      expect(trader.valid?).to be_truthy
    end

    it 'is not valid without a name' do
      trader = build(:trader, name: nil)

      expect(trader.valid?).to be_falsey
    end

    context 'when the trader is natural person' do
      it 'is valid without a legal name' do
        trader = build(:trader, person_type: :natural, legal_name: nil)

        expect(trader.valid?).to be_truthy
      end
    end

    context 'when the trader is legal person' do
      it 'is not valid without a legal name' do
        trader = build(:trader, person_type: :legal, legal_name: nil)

        expect(trader.valid?).to be_falsey
      end
    end
  end

  describe '.person_types' do
    it 'has the person_types' do
      expect(Trader.person_types['natural']).to eq(0)
      expect(Trader.person_types['legal']).to eq(1)
    end
  end

  describe '#profiles' do
    let(:trader) { Trader.new }

    it 'store the :customer profile' do
      trader.profiles = [:customer]

      expect(trader.customer?).to be_truthy
      expect(trader.supplier?).to be_falsey
      expect(trader.carrier?).to be_falsey
      expect(trader.profiles).to include(:customer)
    end

    it 'store the :supplier profile' do
      trader.profiles = [:supplier]

      expect(trader.customer?).to be_falsey
      expect(trader.supplier?).to be_truthy
      expect(trader.carrier?).to be_falsey
      expect(trader.profiles).to include(:supplier)
    end

    it 'store the :carrier profile' do
      trader.profiles = [:carrier]

      expect(trader.customer?).to be_falsey
      expect(trader.supplier?).to be_falsey
      expect(trader.carrier?).to be_truthy
      expect(trader.profiles).to include(:carrier)
    end

    it 'store the :carrier and :supplier profile' do
      trader.profiles = [:carrier, :supplier]

      expect(trader.customer?).to be_falsey
      expect(trader.supplier?).to be_truthy
      expect(trader.carrier?).to be_truthy
      expect(trader.profiles).to include(:carrier, :supplier)
    end

    it 'store the :customer and :supplier profile' do
      trader.profiles = [:customer, :supplier]

      expect(trader.customer?).to be_truthy
      expect(trader.supplier?).to be_truthy
      expect(trader.carrier?).to be_falsey
      expect(trader.profiles).to include(:customer, :supplier)
    end
  end
end
