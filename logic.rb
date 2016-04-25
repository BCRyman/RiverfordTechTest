def lineCount(txt)
  lineCount = 0
  txt.each_line do |line|
    lineCount += 1
  end
  returnLineCount = lineCount
end

#seperates string by all non alphabetical characters
def splitStringIntoWords(txt)
  words = txt.split(/\W/)
end

def wordCount(wordsArray)
  wordCount = wordsArray.count
end

def getWordLengths(words)
  wordLengths = Array.new(words.length)
  (0..(words.length-1)).each do |i|
    wordLengths[i] = words[i].length
  end
  returnArray = wordLengths
end

def meanWordLength(wordLengths)
    overallCharacterCount = 0
    (0..(wordLengths.length-1)).each do |i|
      overallCharacterCount += wordLengths[i]
    end
    meanCharsPerWord = (overallCharacterCount.fdiv(wordLengths.count)).round(1)
end

def returnMedianLength(sortedArray)
  meanCharactersPerWord = sortedArray[sortedArray.length/2]
end

def returnModeLength(sortedArray)
  numberToLookFor = 0
  count = 0
  highestCount = 0
  currentMode = 0
  (0..sortedArray.length-1).each do |i|
    #if the number looked for is the same as the indexed value
    if(numberToLookFor == sortedArray[i])
      count += 1
    else #else check count against highest count,
      if(highestCount < count)
        highestCount = count
        currentMode = numberToLookFor
      end
      numberToLookFor = sortedArray[i]
      count = 0
      count += 1
    end
  end
  toReturn = currentMode
end


def returnMostFrequentLetter(textString)
  #split string into char array
  textString.downcase
  text = textString.chars.sort_by(&:downcase).join
  charArray = text.scan /\w/
  #Loop through array
  letterToLookFor = 'a'
  count = 0
  highestCount = 0
  currentMostPopular = 'a'
  (0..charArray.length-1).each do |i|
    #if the number looked for is the same as the indexed value
    if(letterToLookFor == charArray[i])
      count += 1
    else #else check count against highest count,
      if(highestCount < count)
        highestCount = count
        currentMostPopular = letterToLookFor
      end
      letterToLookFor = charArray[i]
      count = 0
      count += 1
    end
  end
  toReturn = currentMostPopular
  #pick letter, loop through previous letter list
end
