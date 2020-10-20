class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  zenkaku = /\A[ぁ-んァ-ン一-龥]+\z/
  kananomi = /\A[ァ-ヶー－]+\z/
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  with_options presence: true do
    validates :nickname
    validates :first_name,      format: { with: zenkaku }
    validates :last_name,       format: { with: zenkaku }
    validates :first_name_kana, format: { with: kananomi }
    validates :last_name_kana,  format: { with: kananomi }
    validates :birth_date
  end
end
