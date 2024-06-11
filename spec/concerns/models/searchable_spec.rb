require 'rails_helper'

RSpec.describe Models::Searchable do
  let(:test_class) do
    Struct.new(:id, :name, :address) do
      include Models::Searchable

      def self.where(*args); end
    end
  end

  describe 'setup search capabilities' do
    it 'sets the search for name and id' do
      test_class.search_by :name, id: :equals
      expect(test_class.search_options).to eq([:name, {id: :equals}])
    end

    it 'sets the default search fields' do
      test_class.search_by
      expect(test_class.search_options).to eq([{id: :equals}])
    end
  end

  describe '.search' do
    let(:query) { 'QUERY' }
    let(:search_options) { [:name, { id: :equals }, { address: :any }] }
    let(:sql_query) { ['name ILIKE ? OR id = ? OR address ILIKE ?', "%#{query}%", query, "%#{query}%"] }

    it 'build and perform search' do
      expect(test_class).to receive(:where).with(sql_query)

      test_class.search_by(*search_options)

      test_class.search(query)
    end
  end
end
