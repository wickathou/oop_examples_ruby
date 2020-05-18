require 'pry'
class Student
    PROFESSORS = 10
    def initialize(name, grade)
        @name = name
        @grade = grade
    end
    
    def better_grade_than(other)
       case self.get_grade <=> other.get_grade
       when 1
           "#{@name} is better#{how_many_professors}"
       when -1
           "#{@name} is worse#{how_many_professors}"
       else
           "The same result#{how_many_professors}"
       end
    end
    
    protected
    
    def get_grade
       @grade 
    end
    
    private
    
    def how_many_professors
       ", based on the #{PROFESSORS} professors" 
    end
end

trial = Student.new('lol',13)
trakashy = Student.new('loli',13)
puts trial.better_grade_than(trakashy)

# binding.pry