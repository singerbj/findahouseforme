class User < ActiveRecord::Base
  attr_accessible :username
  attr_protected :admin
end
