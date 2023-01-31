RSpec.describe Array do
  subject(:sally) { [1, 2] }

  it 'has 2 elements' do
    expect(sally.length).to eq(2)
    sally.pop
    expect(sally.length).to eq(1)
  end

  it 'instantiate a new sally isolating between examples' do
    expect(sally).to eq([1, 2])
  end
end
