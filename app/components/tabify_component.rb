# frozen_string_literal: true

class TabifyComponent < ViewComponent::Base
  renders_many :tabs, "TabifyItemComponent"

  def initialize(classes: [])
    @classes = classes
  end

  class TabifyItemComponent < ViewComponent::Base
    attr_reader :id, :title, :errors

    def initialize(title:, errors: 0, id: nil)
      @title = title
      @errors = errors
      @id = id
    end

    def call
      content
    end
  end
end
