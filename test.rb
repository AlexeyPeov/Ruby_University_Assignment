# Для выполнения работы необходимо: 
# 1. Написать скрипт, который будет принимать слово. Если слово заканчи-вается на “CS” - выводит на экран цифру 2 в степени (длины введенного слова), 
#если не заканчивается - выводит слово задом наперед. 

# 2. Написать скрипт, который будет выводить массив покемонов: 
# ○ Спросит, сколько покемонов добавить. 
# ○ Указанное на предыдущем этапе число раз, спросит имя и цвет каждого покемона. 
# ○ Выведет в консоль массив, содержащий хеши покемонов в форма-те: 
# [{ name: 'Pikachu', color: 'Yellow' }, … n times{}] 
# 3. Код должен быть организован в методы. 
# 4. Каждая задача должна содержать блок-схему 

def script1(word)
   
    if word[word.length-2] == "C" && word[word.length-1] == "S" 
        return 2 ** word.size
    else
        word.reverse
    end
end

puts script1("ABOBACS")
puts script1("ABOBACV")


def pokemonPrint

    $pokemons = Hash.new
    puts "How many pokemons do you wish to have in a hash map?\n"
    number = gets
    i =1;
    for i in i..number.to_i do
        puts "enter pokemon Name\n"
        name = gets.chomp 
        puts "enter pokemon Color\n"
        color = gets.chomp 
        $pokemons[name] = color 
        i+=1
    end
    return $pokemons

end

pokemons = pokemonPrint

puts pokemons

puts pokemons.fetch("A")

