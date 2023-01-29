# frozen_string_literal: true

require_relative '../lib/card'

RSpec.describe Card do
  let(:card) { Card.new('Ace', 'Spades') }

  it 'has a rank' do
    expect(card.rank).to eq('Ace')
  end

  it 'has a suite' do
    suit = 'Spades'
    expect(card.suit).to eq(suit), "I expected #{suit} but got #{card.suit} instead"
  end
end
