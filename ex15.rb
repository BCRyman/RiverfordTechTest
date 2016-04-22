filename = ARGV.first || "ex15_sample.txt"
txt = open(filename)

lineCount = 0
wordCount = 0
modeCharsPerWord = 0.0
meanCharsPerWord = 0
medianCharsPerWord = 0.0

puts "Here's your file #{filename}"

fileText = txt.read
words = fileText.split(/\W/)
wordLengths = Array.new(words.length)

(0..(words.length-1)).each do |i|
  wordLengths[i] = words[i].length
end

overallCharCount = 0
(0..(wordLengths.length-1)).each do |i|
  overallCharCount += wordLengths[i]
end

puts "Overall Char Count: #{overallCharCount}"

#find mean value
meanCharsPerWord = (overallCharCount.fdiv(wordLengths.count)).round(1)

#find median value
sortedWordLength = wordLengths.sort
medianCharsPerWord = sortedWordLength[words.count/2]
txt.close

#find mode value
numberToLookFor = 0
count = 0
highestCount = 0
currentMode = 0
(0..sortedWordLength.length-1).each do |i|
  #if the number looked for is the same as the indexed value
  if(numberToLookFor == sortedWordLength[i])
    count += 1
  else #else check count against highest count,
    if(highestCount < count)
      highestCount = count
      currentMode = numberToLookFor
    end
    numberToLookFor = sortedWordLength[i]
    count = 0
    count += 1
  end
end
puts "Current Mode #{currentMode}"
#end mode value
txt = open(filename)

txt.each_line do |line|
  lineCount = lineCount + 1
end


puts "Line Count: #{lineCount}"
puts "Word Count: #{words.count}"
puts "Mean Word Length: #{meanCharsPerWord}"
puts "Median Word Length: #{medianCharsPerWord}"

txt.close
