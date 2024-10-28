# frozen_string_literal: true

RSpec.describe Faker::TradingCards::GarbagePailKids do
  describe '.name' do
    it 'generate valid bik without arguments' do
      100.times do
        expect(described_class.name).to be_a(String)
      end
    end
  end
end