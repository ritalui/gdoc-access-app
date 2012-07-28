class User < ActiveRecord::Base
  has_secure_password
  has_many :submitted_works
  has_many :assignments, :through => :submitted_works
  has_many :provider_auths

  attr_accessible :email, :password, :password_confirmation

  validates_uniqueness_of :email

end
