class User < ActiveRecord::Base
  attr_accessible :username, :isAdmin
end
