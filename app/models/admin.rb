class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable,
  # :registerable, and :recoverable
  devise :database_authenticatable, :rememberable, :validatable
end
