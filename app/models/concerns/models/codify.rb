module Models::Codify
  extend ActiveSupport::Concern

  included do
    before_create :set_code
  end

  class_methods do
    def codify_field(field)
      @codify_field = field
    end

    def codify_field_name
      @codify_field
    end
  end

  def set_code
    code = SecureRandom.alphanumeric(6).upcase.gsub(/(\w{3})(\w{3})/, '\1-\2')
    begin
      send("#{self.class.codify_field_name}=", code)
    end while self.class.where(self.class.codify_field_name => code).size > 0
  end
end
