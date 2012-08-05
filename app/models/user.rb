class User < ActiveRecord::Base
  attr_accessible :email, :login
  
  has_many :products
  
  def self.from_storenvy(auth)
    Rails.logger.info(auth.inspect)
    user = find_by_storenvy_id(auth["uid"]) || create_with_storenvy(auth)
    user.update_column(:access_token, auth['credentials']['token']) unless user.nil?
    user
  end

  def self.create_with_storenvy(auth)
    create! do |user|
      user.storenvy_id = auth["uid"]
      user.login       = auth["info"]["login"]
      user.email       = auth["info"]["email"]
    end
  end
  
end
