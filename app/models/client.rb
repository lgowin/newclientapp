class Client < ActiveRecord::Base
  has_many :sessions, :dependent => :destroy
  def fullname
    firstname + " " + lastname
  end
  validates_presence_of :firstname
  validates_presence_of :lastname
end
