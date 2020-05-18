require 'pry'


module Vehicle_States
    def starter(action=nil)
        case action
        when 'on'
            self.power = 'on'
        when 'off'
            self.power = 'off'
        else
            puts 'wrong action, choose on or off'
        end
    end
    
    def age
        age_value
    end
    
    private
    
    def age_value
       puts "this car is #{Time.now.year - self.year} years old"
    end
end

class Vehicle
    attr_accessor :speed, :power
    @@instances = 0
    def initialize
        @speed = 0
        @power = 'off'
        @@instances += 1
    end
    
    include Vehicle_States
    
    def self.vehicles
        puts @@instances>0 ? "#{@@instances} created" : 'None created'
    end
    
    def gas(value=nil)
       self.speed += value if value
    end
    
    def brake
        self.speed = 0
    end
    
    def current_speed
        puts "the speed is #{self.speed}"
    end
    
    def to_s
        "this car is a #{@model}, from the year #{@year}, painted #{@color}, currently it's #{@power}"
    end
    
    def self.gas_m(gallons, miles)
        puts "#{(miles / gallons).to_f} miles per gallon of gas"
    end
    
    
end

module Vehicle_Types
   
    class MyMotorcycle < Vehicle
        NUMBER_OF_AXLES = 2
        attr_reader :year, :color, :model
        def initialize(year,color,model)
            @year = year
            @color = color
            @model = model
            super()
        end
    end
 
end


class MyCar < Vehicle
    NUMBER_OF_AXLES = 2
    attr_reader :year, :color, :model
    def initialize(year,color,model)
        @year = year
        @color = color
        @model = model
        super()
    end
end


class MyTruck < Vehicle
    NUMBER_OF_AXLES = 9
    attr_reader :year, :color, :model
    def initialize(year,color,model)
        @year = year
        @color = color
        @model = model
        super()
    end
end


some = MyCar.new(2010,'blue','Corolla')
other = MyTruck.new(2011,'green','Ford')
cycle = Vehicle_Types::MyMotorcycle.new(1999,'Black', 'BMW')

# puts some.ancestors
# puts MyTruck.ancestors
# puts MyCar.ancestors
# puts some
binding.pry