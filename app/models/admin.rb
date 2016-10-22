class Admin < ApplicationRecord
  devise :database_authenticatable, :rememberable, :trackable, :validatable, :timeoutable

  has_many :news, :dependent => :destroy

  validates_presence_of :full_name
end
