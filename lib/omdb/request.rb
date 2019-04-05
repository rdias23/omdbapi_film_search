class Request
  class << self

    def get(request_hash)
      query_str = case request_hash[:type]
                  when "title"
                    if request_hash[:plot] == "full"
                      "?t=" + request_hash[:term] + "&plot=full" + "&apikey=" + ENV['OMDB_API_KEY']
                    else
                      "?t=" + request_hash[:term] + "&apikey=" + ENV['OMDB_API_KEY']
                    end
                  end

      response, status = get_json(query_str)
      status == 200 ? response : {"Response" => "False"}
    end

    def get_json(query_str)
      response = api.get(query_str)
      [JSON.parse(response.body), response.status]
    end

    def api
      Connection.api
    end
  end
end