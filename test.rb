def convert_to_snake_cases(text)
  return_val = ""
  text.each_char.with_index do |char,idx|
    unless idx == 0
      return_val << "_" if char == char.upcase
    end
    return_val << char.downcase
  end  
  return_val
end