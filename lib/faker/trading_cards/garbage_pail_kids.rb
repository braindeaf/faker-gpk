# frozen_string_literal: true

module Faker
  class TradingCards
    class GarbagePailKids < Base
      class << self
        def series
          translate("faker.garbage_pail_kids.series")
        end

        def cards(from: 'ALL')
          from == 'ALL' ? series.flat_map { _1[:cards] } : find_series(from)[:cards]
        end

        def name(from: "ALL")
          draw_unique(:names, from) { cards(from: from).map { _1[:name] }.uniq }
        end

        def number(from: "ALL")
          draw_unique(:ids, from) { cards(from: from).map { _1[:id] }.uniq }
        end

        def card(from: "ALL")
          draw_unique(:cards, from) { cards(from: from).uniq { [_1[:id], _1[:name]] } }
        end

        def reset_unique!(from: nil)
          return @unique_bags = nil unless from

          unique_bags.each_value { _1.delete(from) }
        end

        private

        def draw_unique(kind, from)
          unique_bags[kind][from] = shuffle(yield) if unique_bags[kind][from].nil? || unique_bags[kind][from].empty?
          unique_bags[kind][from].pop
        end

        def unique_bags
          @unique_bags ||= Hash.new { |bags, kind| bags[kind] = {} }
        end

        def find_series(id)
          series.find { _1[:id] == id }
        end
      end
    end
  end
end
