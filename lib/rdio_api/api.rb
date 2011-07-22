module RdioApi
  
  module Api
    
    def method_missing(method_name, *arguments)
      response = connection.post do |request|
        request.body = {:method => method_name.to_s}.merge!(Hash[*arguments.flatten])
      end
      check_response_for_errors(response)
    end
  end
end