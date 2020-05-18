Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)
 puts "API KEY"

 puts Rails.application.credentials.dig(:stripe, :secret_key)