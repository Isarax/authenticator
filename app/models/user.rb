class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :name, :password, :password_confirmation

  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false
  validates_format_of :name, with: /^[A-Za-z0-9.&]*\z/
  validates :password, :length => {:within => 6..40}
end
