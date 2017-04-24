class Message < ApplicationRecord

  validates :body, presence: true

  def self.convert msg, dialect
    puts dialect
    data = case dialect
    when 'yoda'
      ConvertMessage.to_yoda msg
    when 'valley_girl'
      ConvertMessage.to_valley_girl msg
    when 'binary_code'
      ConvertMessage.to_binary_code msg
    end

    return data
  end
end
