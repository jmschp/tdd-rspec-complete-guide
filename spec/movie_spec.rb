require_relative '../lib/movie'

RSpec.describe Movie do
  subject(:movie) { described_class.new(stuntmen) }

  let(:stuntmen) { double('Mr. Danger', ready?: true, act: 'I am acting', fall_off_lader: 'Sure', light_on_fire: true) }

  describe '#start_shotting' do
    it 'expect an actor to do 3 actions' do
      expect(stuntmen).to receive(:ready?).once
      expect(stuntmen).to receive(:act).twice
      expect(stuntmen).to receive(:fall_off_lader).once
      expect(stuntmen).to receive(:light_on_fire).once

      movie.start_shotting
    end
  end
end
