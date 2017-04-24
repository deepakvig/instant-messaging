class ConvertMessage

  TRANSLATOR_URL = 'http://api.funtranslations.com/translate/'

  def self.to_yoda msg
    url = TRANSLATOR_URL + 'yoda.json?text=' + URI.encode(msg)
    return get_data( url )
    #puts HTTP.get().body.to_json
    #puts HTTP.get(TRANSLATOR_URL + 'yoda.json?text=' + msg).body.to_json.contents
    #return HTTP.get(TRANSLATOR_URL + 'yoda.json?text=' + msg).body
  end

  def self.to_valley_girl msg
    url = TRANSLATOR_URL + 'valspeak.json?text=' + URI.encode(msg)
    return get_data( url )
  end

  def self.to_binary_code msg

  end

  def self.get_data url
    data = JSON.parse( HTTP.get(url).body )
    if data["contents"] && data["contents"]["translated"]
      return data["contents"]["translated"]
    else
      return nil
    end
  end

end