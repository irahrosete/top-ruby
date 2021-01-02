def caesar_cipher(string, num)
  arr = string.split("")
  final_cipher = arr.map {|ch|
  if ch.match?(/[a-zA-Z]/) == true
    ch.ord + num
  else
    ch
  end
  }
  final_cipher.map(&:chr).join
end

puts caesar_cipher("Hello", 5)
puts "a".match?(/[a-zA-Z]/)
