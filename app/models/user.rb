class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = VALID_PASSWORD_REGEX =/\A(?=.*?[a-zA-Z])(?=.*?[\d])\w{6,}\z/
  ZENKAKU_REGEXP = /\A[ぁ-んァ-ン一-龥々ー]/
  KATAKANA_REGEXP = /\A[ァ-ヶー－]+\z/

  validates :password,              format: { with: VALID_PASSWORD_REGEX }
  validates :password_confirmation, format: { with: VALID_PASSWORD_REGEX }
  validates :nickname,        presence: true
  validates :first_name,      presence: true, format: { with: ZENKAKU_REGEXP }
  validates :last_name,       presence: true, format: { with: ZENKAKU_REGEXP }
  validates :first_name_kana, presence: true, format: { with: KATAKANA_REGEXP }
  validates :last_name_kana,  presence: true, format: { with: KATAKANA_REGEXP }
  validates :birth_date,      presence: true
end
