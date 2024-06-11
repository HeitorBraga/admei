require 'rails_helper'

RSpec.describe "Countries", type: :request do
  let!(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe '#index' do
    it 'renders the index page' do
      get countries_path
      expect(response).to have_http_status(200)
    end
  end

  describe '#new' do
    it 'renders the new form' do
      get new_country_url

      expect(response).to have_http_status(200)
    end
  end

  describe '#create' do
    let(:country) { create(:country) }

    it 'creates a new country' do
      expect {
        post countries_url, params: { country: { name: country.name, ibge_code: country.ibge_code, iso_code: country.iso_code } }
      }.to change {
        Country.count
      }.by(1)
    end
  end

  describe '#show' do
    let(:country) { create(:country) }

    it 'renders the show page' do
      get country_url(country)

      expect(response).to have_http_status(200)
    end
  end

  describe '#edit' do
    let(:country) { create(:country) }

    it 'renders the edit form' do
      get edit_country_url(country)

      expect(response).to have_http_status(200)
    end
  end

  describe '#update' do
    let(:country) { create(:country) }
    let(:new_country) { build(:country) }

    it 'updates a country' do
      put country_url(country), params: { country: { name: new_country.name, ibge_code: new_country.ibge_code, iso_code: new_country.iso_code } }
      country.reload

      expect(country.ibge_code).to eq(new_country.ibge_code)
      expect(country.name).to eq(new_country.name)
      expect(country.iso_code).to eq(new_country.iso_code)
    end
  end

  describe '#destroy' do
    let(:countries) { create_list(:country, 3) }

    it 'deletes some countries' do
      countries_to_delete = countries.sample(2).pluck(:id)
      delete country_url(id: countries_to_delete.join(','))

      expect(Country.all.size).to eq(1)

      deleted_countries = Country.where(id: countries_to_delete).pluck(:id)
      expect(deleted_countries.size).to be_zero
    end
  end
end
