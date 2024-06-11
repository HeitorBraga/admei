require 'rails_helper'

RSpec.describe "Cities", type: :request do
  let!(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe '#index' do
    it 'renders the index page' do
      get cities_path
      expect(response).to have_http_status(200)
    end
  end

  describe '#new' do
    it 'renders the new form' do
      get new_city_url

      expect(response).to have_http_status(200)
    end
  end

  describe '#create' do
    let(:state) { create(:state) }
    let(:city) { build(:city) }

    it 'creates a new city' do
      expect {
        post cities_url, params: { city: { name: city.name, ibge_code: city.ibge_code, state_id: state.id } }
      }.to change {
        City.count
      }.by(1)
    end
  end

  describe '#show' do
    let(:city) { create(:city) }

    it 'renders the show page' do
      get city_url(city)

      expect(response).to have_http_status(200)
    end
  end

  describe '#edit' do
    let(:city) { create(:city) }

    it 'renders the edit form' do
      get edit_city_url(city)

      expect(response).to have_http_status(200)
    end
  end

  describe '#update' do
    let(:city) { create(:city) }
    let(:new_city) { build(:city) }

    it 'updates a city' do
      put city_url(city), params: { city: { name: new_city.name, ibge_code: new_city.ibge_code } }
      city.reload

      expect(city.ibge_code).to eq(new_city.ibge_code)
      expect(city.name).to eq(new_city.name)
    end
  end

  describe '#destroy' do
    let(:cities) { create_list(:city, 5) }

    it 'deletes some cities' do
      cities_to_delete = cities.sample(3).pluck(:id)
      delete city_url(id: cities_to_delete.join(','))

      expect(City.all.size).to eq(2)

      deleted_cities = City.where(id: cities_to_delete).pluck(:id)
      expect(deleted_cities.size).to be_zero
    end
  end
end
