# frozen_string_literal: true

class AutoCompleteComponent < ApplicationComponent
  def initialize(resource, field, id = nil, text = nil, **options)
    @resource = resource
    @field = field
    @id = id
    @text = text
    @load_from = options[:load_from]
    @place_holder = options[:place_holder] || "Digite para pesquisar"
    @query_context = options[:query_context] || {}
    @frame_id = options[:frame_id] || SecureRandom.hex
    @on_select_request = options[:on_select_request] || {}
  end
end
