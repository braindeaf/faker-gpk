# frozen_string_literal: true

module Faker
  class TradingCards
    class GarbagePailKids < Base
      class << self
        ##
        # Produces the name of a Garbage Pail Kid.
        #
        # @return [String]
        #
        # @example
        #   Faker::TradingCards::GarbagePailKids #=> "Nasty NICK"
        #
        # @faker.version next
        def name
          fetch("garbage_pail_kids.names")
        end
      end
    end
  end
end
