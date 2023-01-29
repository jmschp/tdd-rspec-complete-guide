RSpec.describe Integer do
  describe '#even?' do
    context 'when number is even' do
      it 'returns true' do
        expect(2.even?).to be(true)
      end
    end

    context 'when number is odd' do
      it 'returns false' do
        expect(3.even?).to be(false)
      end
    end
  end

  describe '#odd?' do
    context 'when number is even' do
      it 'returns false' do
        expect(2.odd?).to be(false)
      end
    end

    context 'when number is odd' do
      it 'returns true' do
        expect(3.odd?).to be(true)
      end
    end
  end
end
