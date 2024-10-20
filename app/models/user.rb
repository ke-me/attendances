class User < ApplicationRecord
  # email　小文字に変換する
  before_save { self.email = email.downcase }

  # nameのバリデーション
  validates :name, presence: true

  # emailのバリデーション（存在性と最大入力文字数の制限、大文字小文字を区別しない、メールアドレスが有効な値かどうかチェック）
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }

  # passwordのバリデーション
  has_secure_password
  validates :password, presence: true

  has_many :works, dependent: :destroy
end