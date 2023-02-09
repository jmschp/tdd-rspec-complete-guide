RSpec.describe 'a random double' do
  it 'only allows defined methods to be invoked' do
    stuntman = double('Mr. Danger', fall_off_ladder: 'Ouch', light_on_fire: true)

    expect(stuntman.fall_off_ladder).to eq('Ouch')
    expect(stuntman.light_on_fire).to eq(true)
  end

  it 'only allows defined methods to be invoked, with allow, receive and return' do
    stuntman = double('Mr. Danger')
    allow(stuntman).to receive(:fall_off_ladder).and_return('Ouch')

    expect(stuntman.fall_off_ladder).to eq('Ouch')
  end

  it 'only allows defined methods to be invoked, allow and with receive_messages' do
    stuntman = double('Mr. Danger')
    allow(stuntman).to receive_messages(fall_off_ladder: 'Ouch', light_on_fire: true)

    expect(stuntman.fall_off_ladder).to eq('Ouch')
    expect(stuntman.light_on_fire).to eq(true)
  end
end
