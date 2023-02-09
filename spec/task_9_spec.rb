# Provide code samples for the questions below.

# Perguntas dessa tarefa
# Write a compound expectation that asserts the string firetruck starts with the substring "fire" and ends with the substring "truck".

# Write a compound expectation that asserts that the number 20 is even and that it responds to the times mthod.

# Write a compound expectation that asserts that the array [4, 8, 15, 16, 23, 42] includes the value 42 and starts with the values 4, 8, and 15.

RSpec.describe 'compound expectations' do
  describe 'firetruck' do
    it { is_expected.to start_with('fire').and end_with('truck') }
  end

  describe 20 do
    it { is_expected.to be_even.and respond_to(:times) }
  end

  describe [4, 8, 15, 16, 23, 42] do
    it { is_expected.to include(42).and start_with(4, 8, 15) }
  end
end
