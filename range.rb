range = 1..9
input = 5

def valide_move?(input)
  (1..9).each do |i|
    if i == input
      return true
    end
  end
end

puts valide_move?(input)
