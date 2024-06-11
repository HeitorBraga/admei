require 'rails_helper'

RSpec.describe "Companies", type: :request do
  let!(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe '#index' do
    it 'renders the index page' do
      get companies_path
      expect(response).to have_http_status(200)
    end
  end

  describe '#new' do
    it 'renders the new form' do
      get new_company_url

      expect(response).to have_http_status(200)
    end
  end

  describe '#create' do
    let(:state) { create(:state) }
    let(:company) { build(:company) }

    it 'creates a new company' do
      expect {
        post companies_url, params: { company: { trade_name: company.trade_name, legal_name: company.legal_name, federal_tax_id: company.federal_tax_id  } }
      }.to change {
        Company.count
      }.by(1)
    end
  end

  describe '#show' do
    let(:company) { create(:company) }

    it 'renders the show page' do
      get company_url(company)

      expect(response).to have_http_status(200)
    end
  end

  describe '#edit' do
    let(:company) { create(:company) }

    it 'renders the edit form' do
      get edit_company_url(company)

      expect(response).to have_http_status(200)
    end
  end

  describe '#update' do
    let(:company) { create(:company) }
    let(:new_company) { build(:company) }

    it 'updates a company' do
      put company_url(company), params: { company: { trade_name: new_company.trade_name, legal_name: new_company.legal_name, federal_tax_id: new_company.federal_tax_id  } }
      company.reload

      expect(company.trade_name).to eq(new_company.trade_name)
      expect(company.legal_name).to eq(new_company.legal_name)
      expect(company.federal_tax_id).to eq(new_company.federal_tax_id)
    end
  end

  describe '#destroy' do
    let(:companies) { create_list(:company, 5) }

    it 'deletes some companies' do
      companies_to_delete = companies.sample(3).pluck(:id)
      delete company_url(id: companies_to_delete.join(','))

      expect(Company.all.size).to eq(2)

      deleted_companies = Company.where(id: companies_to_delete).pluck(:id)
      expect(deleted_companies.size).to be_zero
    end
  end
end
