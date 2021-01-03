array = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string, dictionary)
  arr = string.gsub(/[^a-zA-Z\s]/, "").downcase.split(" ") + dictionary
  p arr.each_with_object(Hash.new(0)) {|word, count| count[word] += 1}
end

substrings("BElow. down", array)