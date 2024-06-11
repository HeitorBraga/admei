# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate
  end

  private

    def authenticate
      Current.user = current_user if current_user
    end
end
