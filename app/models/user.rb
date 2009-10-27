class User < ActiveRecord::Base
  has_many :images, :dependent => :destroy
  acts_as_authentic
end
