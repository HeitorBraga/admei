class FederalTaxIdValidator < ActiveModel::Validator
  INVALID_NATURAL_TAX_ID_NUMBERS = %w(
    12345678909 11111111111 22222222222 33333333333
    44444444444 55555555555 66666666666 77777777777
    88888888888 99999999999 00000000000
  )

  def validate(record)
    if !is_natural_person?(record.federal_tax_id) && !is_legal_person?(record.federal_tax_id)
      record.errors.add :federal_tax_id, 'CPF/CNPJ inválido.'
    elsif is_natural_person?(record.federal_tax_id) && !natural_tax_id_number_valid?(record.federal_tax_id)
      record.errors.add :federal_tax_id, 'CPF inválido.'
    elsif is_legal_person?(record.federal_tax_id) && !legal_tax_id_number_valid?(record.federal_tax_id)
      record.errors.add :federal_tax_id, 'CNPJ inválido.'
    end
  end

  private

  def is_legal_person?(tax_id_number)
    tax_id_number.to_s.gsub(/\W+/, '').length == 14
  end

  def is_natural_person?(tax_id_number)
    tax_id_number.to_s.gsub(/\W+/, '').length == 11
  end

  def legal_tax_id_number_valid?(value)
    return false if (value =~ /\A\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}\z/).nil?

    value.gsub!(/\W+/, '')

    digit = value.slice(-2, 2)
    control = ''
    if value.size == 14
      factor = 0
      2.times do |i|
        sum = 0
        12.times do |j|
          sum += value.slice(j, 1).to_i * ((11 + i - j) % 8 + 2)
        end
        sum += factor * 2 if i == 1
        factor = 11 - sum % 11
        factor = 0 if factor > 9
        control << factor.to_s
      end
    end
    control == digit
  end

  def natural_tax_id_number_valid?(value)
    return false if (value =~ /\A\d{3}\.\d{3}\.\d{3}-\d{2}\z/).nil?
    return false if INVALID_NATURAL_TAX_ID_NUMBERS.member?(value.gsub(/\W+/, ''))

    value.gsub!(/\W+/, '')
    digit = value.slice(-2, 2)
    control = ''
    if value.size == 11
      factor = 0
      2.times do |i|
        sum = 0
        9.times do |j|
          sum += value.slice(j, 1).to_i * (10 + i - j)
        end
        sum += (factor * 2) if i == 1
        factor = (sum * 10) % 11
        factor = 0 if factor == 10
        control << factor.to_s
      end
    end

    control == digit
  end
end
