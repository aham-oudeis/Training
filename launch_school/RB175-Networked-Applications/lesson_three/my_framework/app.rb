# app.rb

require_relative "monroe"
require_relative "advice"

# class App
# 	def call(env)
# 		case env['REQUEST_PATH']
# 		when '/'
# 			['200', {'Content-Type'=> 'text/html'}, [erb(:index)]]
# 		when '/advice'
# 			piece_of_advice = Advice.new.generate
# 			['200', {'Content-Type'=> 'text/html'}, [ebr(:advice, message: piece_of_advice)]]
# 		else
# 			['404', 
# 			 {"Content-Type" => 'text/html', "Content-Length" => '61'}, 
# 			 [erb(:not_found)]
# 			]
# 		end
# 	end

#   private

#   def erb(filename, local = {})
#     b = binding
#     message = local[:message]
#     content = File.read("views/#{filename}.erb")
#     ERB.new(content).result(b)
#   end
# end

class App < Monroe
  def call(env)
    case env['REQUEST_PATH']
    when '/'
      status = '200'
      headers = {"Content-Type" => 'text/html'}
      response(status, headers) do
        erb :index      
      end
    when '/advice'
      piece_of_advice = Advice.new.generate
      status = '200'
      headers = {"Content-Type" => 'text/html'}
      response(status, headers) do
        erb :advice, message: piece_of_advice
      end
    else
      status = '404'
      headers = {"Content-Type" => 'text/html', "Content-Length" => '54'}
      response(status, headers) do
        erb :not_found
      end
    end
  end
end


