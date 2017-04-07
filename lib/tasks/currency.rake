namespace :currency do
  desc "Call exchange rate from api"
  task get_exchange_rate: :environment do
    currency_array = %w(MYR THB IDR SGD)
    currency_array.each do |currency|
      money = Currency.find_by(code:currency)
      response = HTTParty.get("https://v3.exchangerate-api.com/bulk/#{ENV['exchange_api_key']}/#{currency}")
      result = JSON.parse response.body
      currency_array.each do |curr|
        unless result['rates']["#{curr}"].nil?
          exchange_rate = result['rates']["#{curr}"]
          new_rate = money.exchanges.find_or_initialize_by(currency_code:curr)
          new_rate.update(rate:exchange_rate)
        end
      end
    end
  end
end


