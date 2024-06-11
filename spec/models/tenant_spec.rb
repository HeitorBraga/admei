require 'rails_helper'

RSpec.describe Tenant, type: :model do
  describe 'Tenant setup' do
    context 'when a new tenant is created' do
      let(:subdomain) { 'tenant' }
      it 'creates a new apartment' do
        expect(Apartment::Tenant).to receive(:create).with(subdomain)
        expect(Apartment::Tenant).to receive(:switch!).with(subdomain)

        Tenant.create(subdomain: subdomain)
      end
    end
  end
end