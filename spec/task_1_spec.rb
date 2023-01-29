RSpec.describe 'math calculations' do
  it 'does basic math' do
    expect(1 + 1).to eq(2)
    expect(6 / 3).to eq(2)
    expect(5 * 5).to eq(25)
    expect(5 - 2).to eq(3)
  end
end
