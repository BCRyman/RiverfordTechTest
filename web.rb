require 'sinatra/base'

class Web < Sinatra::Base

  set :views, File.join(File.dirname(__FILE__), 'views')
  set :public_folder, File.join(File.dirname(__FILE__), 'public')
  set :files, File.join(settings.public_folder, 'files')
  set :unallowed_paths, ['.', '..']

  get '/' do
    erb :index
  end

  post '/getstats/' do
    #gets file from form
      filename = params[:myFile][:filename]
      file = params[:myFile][:tempfile]
      #open file
      passInFile = open(file)
      passInFileText = passInFile.read
      #get line count
      lines = lineCount passInFileText
      #create array of words in string
      wordArray = splitStringIntoWords passInFileText
      #get word count
      words = wordCount wordArray
      #create array for word lengths
      wordLengthArray = getWordLengths wordArray
      #get mean word lengths
      meanLength = meanWordLength(wordLengthArray)
      #sorts the array from lowest to highest
      sortedWordLength = wordLengthArray.sort
      #gets median value
      medianWordLength = returnMedianLength sortedWordLength
      passInFile.close
      #lines = 0
      erb :index1, :locals => {'fileNam' => filename,
        'lineCount' => lines, 'numWords' => words,
        'meanLen' => meanLength, "medianLen" => medianWordLength}
  end

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
end
