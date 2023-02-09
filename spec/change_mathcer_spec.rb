RSpec.describe 'change matcher' do
  subject(:my_array) { [1, 2, 3] }

  it 'checks that a method changes object state with change block syntax' do
    expect { my_array.push(4) }.to change { my_array.length }.from(3).to(4)
    expect { my_array.push(4) }.to change { my_array.length }.by(1)
  end

  it 'checks that a method changes object state change argumenst syntax' do
    expect { my_array.push(4) }.to change(my_array, :length).from(3).to(4)
    expect { my_array.push(4) }.to change(my_array, :length).by(1)
  end

  it 'accepts negative arguments' do
    expect { my_array.pop }.to change(my_array, :length).from(3).to(2)
    expect { my_array.pop }.to change(my_array, :length).by(-1)
  end
end
