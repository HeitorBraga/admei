require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TradersHelper. For example:
#
# describe TradersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TradersHelper, type: :helper do
  describe '.available_profiles' do
    let(:profiles) do
      [:customer, :supplier, :carrier]
    end

    it 'returns the profiles' do
      expect(helper.available_profiles).to include(*profiles.map {|item| [I18n.t("simple_form.labels.trader.profiles_list.#{item}"), item]})
    end
  end

  describe '.available_genders' do
    it 'returns the genders' do
      expect(helper.available_genders).to include(['Masculino', 'M'], ['Feminino', 'F'], ['Outros', 'O'])
    end
  end

  describe '.available_person_types' do
    it 'returns the person_types' do
      expect(helper.available_person_types).to include(*['natural', 'legal'].map {|item| [I18n.t("simple_form.labels.trader.person_type_enum.#{item}"), item]})
    end
  end
end
