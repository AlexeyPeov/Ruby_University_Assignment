# 1. Написать набор методов для работы с файлом:
module DB

  DB_PATH = 'textFiles/db.txt'
  TEMP = 'textFiles/temp.txt'

  # ○ index - выводит все строки;
  def index (index)
    puts File.open(index).read.split("\n")
  end

  def find_by_id(id)
    # read data from db.txt file
    data = File.readlines(DB_PATH)

    # check if id is within range
    id = id.to_i if id.is_a? String
    return unless id.positive? && id <= data.size

    # split line into fields
    fields = data[id - 1].split

    # create hash with desired format
    {
        'first_name' => fields[0],
        'second_name' => fields[1],
        'age' => fields[2].to_i,
        'balance' => fields[3].to_i
    }
  end

  # ○ where(pattern) - находит все строки, где есть указанный паттерн;
  def find_by_pattern(pattern)
    # read data from db.txt file
    data = File.readlines(DB_PATH)

    # initialize result array
    result = []

    # iterate over each line in data
    data.each_with_index do |line, index|
      # split line into fields
      fields = line.split

      # check if any field matches pattern
      next unless fields.any? { |field| field == pattern }

      arr = {
        index + 1 => {
          'first_name' => fields[0],
          'second_name' => fields[1],
          'age' => fields[2].to_i,
          'balance' => fields[3].to_i
        }
      }
      result << arr
    end
    result
  end

  # ○ update(id, text) - обновляет конкретную строку файла;
  def update(id, column_names, parameters)
    # read data from db.txt file
    data = File.readlines(DB_PATH)


    id = id.to_i if id.is_a? String

    # check if id is within range
    return unless id.positive? && id <= data.size

    # split line into fields
    fields = data[id - 1].split

    # convert column_names and parameters to arrays if they are not already
    column_names = [column_names] unless column_names.is_a?(Array)
    parameters = [parameters] unless parameters.is_a?(Array)

    # iterate over each column name and parameter
    column_names.zip(parameters).each do |column_name, parameter|
      # update specified field
      case column_name
      when 'first_name'
        fields[0] = parameter
      when 'second_name'
        fields[1] = parameter
      when 'age'
        fields[2] = parameter.to_s
      when 'balance'
        fields[3] = parameter.to_s
      end
    end

    line = fields.join(' ') + "\n"
    # join fields back into line
    data[id - 1] = line
    # write updated data back to file
    File.write(DB_PATH, data.join)

  end

  # ○ delete(id) - удаляет строку;
  def delete_by_id(id)

    id = id.to_i if id.is_a? String

    file = File.new('temp.txt', 'w')
    File.foreach(path).with_index do |person, index|
      file.puts(id == index ? text : person) if index != id
    end
    file.close
    File.write(DB_PATH, File.read(TEMP))
    File.delete(TEMP) if File.exist?(TEMP)
  end

end

