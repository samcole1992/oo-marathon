class Zoo
  attr_reader :cages, :employees
  def initialize(name, season_opening_date, season_closing_date)
    @name = name
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date
    @employees = []
    @cages = []
    10.times do
      @cages << Cage.new
    end
  end

  def add_employee(employee)
    @employees << employee
  end

  def open?(date)
    if date >= @season_opening_date && date < @season_closing_date
      true
    else
      false
    end
  end

  def add_animal(animal)
    @cages.each do |cage|
      if cage.empty?
        cage.animal = animal
        return
      end
    end
    raise ZooAtCapacity
  end

  def visit
    str = ""
    @employees.each do |e|
      str += e.greet
      str += "\n"
    end
    @cages.each do |cage|
      if !cage.empty?
        str += cage.animal.speak
        str += "\n"
      end 
    end
    str
  end

end

class ZooAtCapacity < StandardError
end
