# frozen_string_literal: true

RSpec.describe Faker::TradingCards::GarbagePailKids do
  after do
    described_class.reset_unique!
  end

  describe ".series" do
    it "returns the original series metadata" do
      series = described_class.series

      expect(series.length).to eq(16)
      expect(series.first).to include(id: "OS1", name: "Original Series 1", year: 1985)
      expect(series.first[:cards].first).to eq(id: "1a", name: "Nasty NICK")
    end
  end

  describe ".cards" do
    it "returns cards for a specific series" do
      expect(described_class.cards(from: "OS2").first).to eq(id: "42a", name: "PATTY Putty")
    end

    it "returns the cleaned original series 10 cards" do
      cards = described_class.cards(from: "OS10")

      expect(cards.length).to eq(78)
      expect(cards.first).to eq(id: "379a", name: "Locked DORIAN")
      expect(cards.last).to eq(id: "417b", name: "Swingin' SOPHIE")
    end

    it "returns cards from all series" do
      expect(described_class.cards.length).to be > described_class.cards(from: "OS1").length
    end
  end

  describe ".name" do
    it "generates a name" do
      100.times do
        expect(described_class.name).to be_a(String)
      end
    end

    it "does not repeat a name until all names in the set have been returned" do
      names = described_class.cards(from: "OS1").map { _1[:name] }.uniq

      expect(Array.new(names.length) { described_class.name(from: "OS1") }.uniq.length).to eq(names.length)
    end
  end

  describe ".number" do
    it "generates a number" do
      100.times do
        expect(described_class.number).to match(/\A\d{1,3}[ab]\z/)
      end
    end

    it "does not repeat an id until all ids in the set have been returned" do
      ids = described_class.cards(from: "OS4").map { _1[:id] }.uniq

      expect(Array.new(ids.length) { described_class.number(from: "OS4") }.uniq.length).to eq(ids.length)
    end
  end

  describe ".card" do
    it "does not repeat an id and name combination until all cards in the set have been returned" do
      cards = described_class.cards(from: "OS4").uniq { [_1[:id], _1[:name]] }

      generated_cards = Array.new(cards.length) { described_class.card(from: "OS4") }

      expect(generated_cards.uniq { [_1[:id], _1[:name]] }.length).to eq(cards.length)
    end
  end
end
