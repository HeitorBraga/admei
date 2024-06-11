# frozen_string_literal: true

class AutoCompleteItemComponent < ApplicationComponent
  def initialize(id:, text:, detail_info: {}, details: [])
    @id = id
    @text = text
    @details = details
    @detail_info = detail_info
  end

  def self.many(items)
    items.map do |item|
      self.new(
        id: item[:id],
        text: item[:text],
        detail_info: item[:detail_info],
        details: item[:details] || {}
      )
    end
  end
end
