class CreditCardFlag
  FLAGS = {
    'Visa' => 1,
    'Mastercard' => 2,
    'Elo' => 3,
    'Hiper' => 4,
    'Hipercard' => 5,
    'Amex' => 6,
    'Dinner' => 7,
    'Ticket' => 8,
    'Sodexo' => 9,
    'VR' => 10
  }

  def self.options_for_select
    FLAGS.map { |flag, id| [flag, id] }
  end
end
