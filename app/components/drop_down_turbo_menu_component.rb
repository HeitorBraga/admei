# frozen_string_literal: true

class DropDownTurboMenuComponent < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(turbo_frame_id:, menu_load_link:)
    @turbo_frame_id = turbo_frame_id
    @menu_load_link = menu_load_link
  end
end
