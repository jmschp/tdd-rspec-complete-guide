require_relative '../lib/task_2'

RSpec.describe School do
  it 'has a name' do
    school = School.new('Beverly Hills High School')
    expect(school.name).to eq('Beverly Hills High School')
  end

  it 'starts off with no students' do
    school = School.new('Notre Dame High School')
    expect(school.students).to eq([])
  end
end
