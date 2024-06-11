# frozen_string_literal: true

class ModalDialogComponent < ApplicationComponent
  include ApplicationHelper

  def initialize(title:, url:, id: SecureRandom.alphanumeric)
    @title = title
    @url = url
    @id = id
  end
end
