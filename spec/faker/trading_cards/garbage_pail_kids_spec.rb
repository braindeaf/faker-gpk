# frozen_string_literal: true

RSpec.describe Faker::TradingCards::GarbagePailKids do
  describe ".name" do
    it "generates a name" do
      100.times do
        expect(described_class.name).to be_a(String)
      end
    end
  end
end
