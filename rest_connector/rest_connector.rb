class RestConnector
    def get(uri, headers)
        url = URI.parse(uri)

        request = Net::HTTP::Get.new(url.to_s)

        if (headers)
            headers.each do |key, value|
                request[key] = value
            end
        end

        http = Net::HTTP.new(url.host, url.port)

        http.use_ssl = url.scheme == "https"

        response = http.request(request)

        JSON.parse response.body
    end

    def post(uri, headers, body)
        url = URI.parse(uri)

        Net::HTTP.start(url.host, url.port, :use_ssl => url.scheme == 'https') do |http|
            request = Net::HTTP::Post.new(url)
            
            if (headers)
                headers.each do |key, value|
                    request[key] = value
                end
            end
            
            request.body = body.to_json
            
            response = http.request request
            
            response.body
        end
    end
end