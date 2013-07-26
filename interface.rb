
p "loading interface..."


module Interface
  LETTERS = ("A".."H").to_a
  NUMBERS = ("0".."7").to_a
  
  
  def get_user_move
    begin
      puts "\nPick a piece to move (eg. a2)"
      input = gets.chomp.upcase
      start_pos = validate(input)
    rescue
      puts "Please enter a valid piece"
      retry
    end
    begin
      puts "Where to? (eg. b3)"
      input = gets.chomp.upcase
      end_pos = validate(input)
    rescue
      puts "Please enter valid destination"
      retry
    end
    [start_pos, end_pos]
  end
  
  def validate(string)
    pos = string.split("").join(" ").split
    if pos.length == 2 && LETTERS.include?(pos.first) && NUMBERS.include?(pos.last)
      pos[0] = LETTERS.find_index(pos.first)
      pos[1] = NUMBERS.find_index(pos.last)
    else
      raise "Bad input"
    end
    p pos
    pos
  end
       
end