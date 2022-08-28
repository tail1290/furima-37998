class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :name_kanji_sei, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :name_kana_sei, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :name_kanji_mei, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :name_kana_mei, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_day, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
end
