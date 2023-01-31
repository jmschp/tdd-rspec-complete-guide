RSpec.describe Array do
  it 'start of empty' do
    expect(subject).to be_empty
    subject << 1
    expect(subject.length).to eq(1)
  end
end
