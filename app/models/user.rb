class User < ActiveRecord::Base
  attr_accessible :username#, :admin
  attr_protected :admin
end
