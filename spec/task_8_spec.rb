RSpec.describe 'Task 8' do
  describe [10, 20, 30] do
    it { is_expected.to all(be_even) }
  end

  describe [0, 1, 2] do
    it { is_expected.to all(be >= 0) }
  end
end
