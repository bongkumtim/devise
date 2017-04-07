class Currency < ApplicationRecord
  has_many :exchanges, class_name: 'ExchangeRate'

  def convert_to_rate(currency_code)
    exchanges.find_by(currency_code:currency_code).rate
  end

  def convert_to(currency_code, amount)
    convert_to_rate(currency_code) * amount
  end
end
