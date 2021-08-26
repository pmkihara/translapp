class User < ApplicationRecord
  has_many :offers, dependent: :destroy
  has_many :jobs, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :contact, presence: true
end
