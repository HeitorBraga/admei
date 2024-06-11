require 'rails_helper'

RSpec.describe Company, type: :model do
  it 'is valid with valid attributes' do
    company = build(:company)
    expect(company.valid?).to be_truthy
  end

  it 'is not valid without a trade name' do
    company = build(:company)
    company.trade_name = nil
    expect(company.valid?).to be_falsey
  end

  it 'is not valid without a legal name' do
    company = build(:company)
    company.legal_name = nil
    expect(company.valid?).to be_falsey
  end
end
