class Admin < ApplicationRecord
  devise :database_authenticatable, :rememberable, :trackable, :validatable, :timeoutable

  validates_presence_of :full_name
end
