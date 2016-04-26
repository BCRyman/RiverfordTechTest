require 'sinatra/base'
require './logic.rb'
require 'sass'

class Web < Sinatra::Base

  set :views, File.join(File.dirname(__FILE__), 'views')
  set :public_folder, File.join(File.dirname(__FILE__), 'public')
  set :files, File.join(settings.public_folder, 'files')
  set :unallowed_paths, ['.', '..']

  get '/' do
    erb :index
  end

  get '/styles.css' do
    scss :styles
  end

  post '/getstats/' do
    if params[:myFile].nil?
      erb :index
    else
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
      #gets mode word length
      modeLength = returnModeLength sortedWordLength
      #gets the most common letter in the file
      mostComLetter = returnMostFrequentLetter passInFileText
      passInFile.close
      #lines = 0
      erb :index1, :locals => {'fileNam' => filename,
        'lineCount' => lines, 'numWords' => words,
        'meanLen' => meanLength, "medianLen" => medianWordLength,
        'modeLen' => modeLength, "mostCommonLetter"=> mostComLetter}
    end
  end


end
