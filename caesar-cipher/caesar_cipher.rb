def caesar_cipher(string, num)
  arr = string.split("")
  final_cipher = arr.map {|ch|
  if ch.match?(/[A-Z]/) == true
    ch.ord + num
    if ch.ord + num > 90
      ch.ord + num - 26
    else
      ch.ord + num
    end
  else
    ch
  end

  if ch.match?(/[a-z]/) == true
    ch.ord + num
    if ch.ord + num > 122
      ch.ord + num - 26
    else
      ch.ord + num
    end
  else
    ch
  end
  }
  final_cipher.map(&:chr).join
end

puts caesar_cipher("Hello World!", 5)
puts "a".match?(/[a-zA-Z]/)

# A = 65
# Z = 90
# a = 91
# z = 122