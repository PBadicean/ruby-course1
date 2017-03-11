alphabet_range = ("a".."z")
vowels = %w(a e i u o  )
alphabet_vowels = {}
alphabet_range.each_with_index do |elem, index|
  if vowels.include?(elem)
    alphabet_vowels[elem] = index+1
  end
end
puts alphabet_vowels 
