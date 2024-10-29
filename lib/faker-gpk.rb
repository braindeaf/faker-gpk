require "faker"
require_relative "faker/trading_cards/garbage_pail_kids"

I18n.load_path += Dir[File.join(__dir__, "faker", "locales", "**/*.yml")]
