RSpec.describe 'nested hooks' do
  before(:context) do
    puts 'OUTER Before context'
  end

  after(:context) do
    puts 'OUTER After context'
  end

  before do
    puts 'OUTER Before example'
  end

  after do
    puts 'OUTER After example'
  end

  it 'does basic math' do
    puts 'In example 1'
    expect(1 + 1).to eq(2)
  end

  context 'with condition A' do
    before(:context) do
      puts 'INNER Before context'
    end

    before do
      puts 'INNER Before example'
    end

    it 'does some more basic math' do
      puts 'In example 2'
      expect(1 + 1).to eq(2)
    end

    it 'does subtraction as well' do
      puts 'In example 3'
      expect(5 - 3).to eq(2)
    end
  end
end
