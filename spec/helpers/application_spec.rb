require 'rails_helper'

describe ApplicationHelper do
  describe '.page_title' do
    it 'returns Title' do
      allow(I18n).to receive(:t).and_return('NCM')

      expect(helper.page_title).to eq('NCM')
    end
  end
  describe '.bool' do
    it 'renders a true indicator' do
      expect(helper.bool(true)).to eq('<i class="fas fa-check-circle"></i>'.html_safe)
    end

    it 'renders a false indicator' do
      expect(helper.bool(false)).to eq('<i class="fas fa-times-circle"></i>'.html_safe)
    end
  end
end