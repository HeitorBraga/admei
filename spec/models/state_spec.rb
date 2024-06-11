require 'rails_helper'

RSpec.describe State, type: :model do
  it 'is valid with valid attributes' do
    state = build(:state)
    expect(state.valid?).to be_truthy
  end

  it 'is not valid without a name' do
    state = build(:state)
    state.name = nil
    expect(state.valid?).to be_falsey
  end

  it 'is not valid without a ibge_code' do
    state = build(:state)
    state.ibge_code = nil
    expect(state.valid?).to be_falsey
  end

  it 'is not valid without a country' do
    state = build(:state)
    state.country = nil
    expect(state.valid?).to be_falsey
  end
end
