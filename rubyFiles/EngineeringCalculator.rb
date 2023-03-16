require_relative "SimpleCalculator.rb"

#Спроектировать класс EngineeringCalculator, который расширяет возможности SimpleCalculator за счет следующих методов: возведение в степень, процент.

#Во время разработки, учитывать возможность передачи неправильных аргументов, путём вывода сообщения об ошибке в удобном для пользователя виде.

class EngineeringCalculator < SimpleCalculator

    def powerOf(num,power)
        if(!(num.is_a? (Numeric)) || !(power.is_a? (Numeric)))
            puts "Error at EngineeringCalculator.powerOf() - the parameter is not a Number".chomp
        else
        return num ** power
        end
    end

    def percentageOf(num,percentage)
        if(!(num.is_a? (Numeric)) || !(percentage.is_a? (Numeric)))
            puts "Error at EngineeringCalculator.percentageOf() - the parameter is not a Number".chomp
        elsif percentage > 100
            puts "Error at EngineeringCalculator.percentageOf() - the percentage is over 100, setting persentage to 100".chomp
            return num
        elsif percentage <= 0
            puts "Error at EngineeringCalculator.percentageOf() - the percentage is less than 0, setting percentage to 0".chomp
            return 0
        else
        return num /100 * percentage
        end
    end

end
