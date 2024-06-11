require 'rails_helper'

RSpec.describe "Traders", type: :request do
  let!(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe '#index' do
    it 'renders the index page' do
      get traders_path
      expect(response).to have_http_status(200)
    end
  end

  describe '#new' do
    it 'renders the new form' do
      get new_trader_url

      expect(response).to have_http_status(200)
    end
  end

  describe '#create' do
    let(:trader) { build(:trader) }

    it 'creates a new trader' do
      expect {
        post traders_url, params: {
          trader: {
            name: trader.name,
            person_type: trader.person_type,
            federal_tax_id: trader.federal_tax_id,
            gender: trader.gender,
            phone: trader.phone,
            mobile: trader.mobile,
            birth_date: trader.birth_date,
            email: trader.email
          }
        }
      }.to change {
        Trader.count
      }.by(1)
    end
  end

  describe '#show' do
    let(:trader) { create(:trader) }

    it 'renders the show page' do
      get trader_url(trader)

      expect(response).to have_http_status(200)
    end
  end

  describe '#edit' do
    let(:trader) { create(:trader) }

    it 'renders the edit form' do
      get edit_trader_url(trader)

      expect(response).to have_http_status(200)
    end
  end

  describe '#update' do
    let(:trader) { create(:trader) }
    let(:new_trader) { build(:trader) }

    it 'updates a trader' do
      put trader_url(trader), params: {
        trader: {
          name: new_trader.name,
          person_type: new_trader.person_type,
          federal_tax_id: new_trader.federal_tax_id,
          gender: new_trader.gender,
          phone: new_trader.phone,
          mobile: new_trader.mobile,
          birth_date: new_trader.birth_date,
          email: new_trader.email
        }
      }
      trader.reload

      expect(trader.name).to eq(new_trader.name)
      expect(trader.federal_tax_id).to eq(new_trader.federal_tax_id)
      expect(trader.gender).to eq(new_trader.gender)
      expect(trader.phone).to eq(new_trader.phone)
      expect(trader.mobile).to eq(new_trader.mobile)
      expect(trader.birth_date).to eq(new_trader.birth_date)
      expect(trader.email).to eq(new_trader.email)
    end
  end

  describe '#destroy' do
    let(:traders) { create_list(:trader, 5) }

    it 'deltes some traders' do
      traders_to_delete = traders.sample(3).pluck(:id)
      delete trader_url(id: traders_to_delete.join(','))

      expect(Trader.all.size).to eq(2)

      deleted_traders = Trader.where(id: traders_to_delete).pluck(:id)
      expect(deleted_traders.size).to be_zero
    end
  end
end
