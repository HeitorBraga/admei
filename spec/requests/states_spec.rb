require 'rails_helper'

RSpec.describe "States", type: :request do
  let!(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe '#index' do
    it 'renders the index page' do
      get states_path
      expect(response).to have_http_status(200)
    end
  end

  describe '#new' do
    it 'renders the new form' do
      get new_state_url

      expect(response).to have_http_status(200)
    end
  end

  describe '#create' do
    let(:state) { build(:state) }
    let(:country) { create(:country)}

    it 'creates a new state' do
      expect {
        post states_url, params: { state: { name: state.name, uf: state.uf, ibge_code: state.ibge_code, country_id: country.id } }
      }.to change {
        State.count
      }.by(1)
    end
  end

  describe '#show' do
    let(:state) { create(:state) }

    it 'renders the show page' do
      get state_url(state)

      expect(response).to have_http_status(200)
    end
  end

  describe '#edit' do
    let(:state) { create(:state) }

    it 'renders the edit form' do
      get edit_state_url(state)

      expect(response).to have_http_status(200)
    end
  end

  describe '#update' do
    let(:state) { create(:state) }
    let(:new_state) { build(:state) }

    it 'updates a state' do
      put state_url(state), params: { state: { name: new_state.name, uf: new_state.uf, ibge_code: new_state.ibge_code } }
      state.reload

      expect(state.ibge_code).to eq(new_state.ibge_code)
      expect(state.name).to eq(new_state.name)
    end
  end

  describe '#destroy' do
    let(:states) { create_list(:state, 5) }

    it 'deletes some states' do
      states_to_delete = states.sample(3).pluck(:id)
      delete state_url(id: states_to_delete.join(','))

      expect(State.all.size).to eq(2)

      deleted_states = State.where(id: states_to_delete).pluck(:id)
      expect(deleted_states.size).to be_zero
    end
  end

  describe '#cities' do
    let!(:state) { create(:state) }
    let!(:cities) { create_list(:city, 10, state_id: state.id) }

    it 'fetch cities by state' do
      get cities_state_path(state, format: :json)
      json_cities = JSON.parse(response.body)

      expect(json_cities.size).to eq(10)

      cities.each do |city|
        json_city = json_cities.select {|item| item['id'] == city.id}.first
        expect(json_city['id']).to eq(city.id)
        expect(json_city['name']).to eq(city.name)
      end

      expect(response).to have_http_status(200)
    end
  end
end
