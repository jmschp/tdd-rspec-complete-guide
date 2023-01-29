class School
  attr_reader :name, :students

  def initialize(name)
    @name = name
    @students = []
  end
end
