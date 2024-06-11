class App < ApplicationRecord
  validates :name, presence: true

  before_create :generate_secret

  def self.valid?(app_id, app_secret)
    return false if app_id.blank? || app_secret.blank?

    App.where(id: app_id, secret: app_secret).exists?
  end

  private

  def generate_secret
    begin
      self.secret = SecureRandom.hex(16)
    end while App.where(secret: secret).count > 0
  end
end
