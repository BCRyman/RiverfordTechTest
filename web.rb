require 'sinatra/base'
require 'logger'
class Web < Sinatra::Base

  set :views, File.join(File.dirname(__FILE__), 'views')
  set :public_folder, File.join(File.dirname(__FILE__), 'public')
  set :files, File.join(settings.public_folder, 'files')
  set :unallowed_paths, ['.', '..']

  get '/' do
    erb :index
  end

  post '/getstats/' do
      filename = params[:myFile][:filename]
      file = params[:myFile][:tempfile]
      passInFile = open(file)
      passInFileText = passInFile.read
      lines = lineCount passInFileText
      words = wordCount passInFileText
      passInFile.close
      #lines = 0
      erb :index1, :locals => {'fileNam' => filename,
        'lineCount' => lines, 'numWords' => words}
  end

  def lineCount(txt)
    lineCount = 0
    txt.each_line do |line|
      lineCount += 1
    end
    returnLineCount = lineCount
  end

  def wordCount(txt)
    words = txt.split(/\W/)
    wordCount = words.count
  end
end
