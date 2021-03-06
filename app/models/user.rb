class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attachment :profile_image, destroy: false
  has_many :books
  validates :name, presence: true, length: {maximum: 10, minimum: 2}
  validates :introduction, length: {maximum: 50}
  has_many :skills
  has_many :hobbies
  has_many :challengings
  has_many :interests
  belongs_to :university_branch
  belongs_to :title_of_branch
  belongs_to :assigned_school

end 