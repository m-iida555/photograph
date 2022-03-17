class User < ApplicationRecord
  before_save :downcase_email
  validates :name, presence: true, length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 200 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :address, presence: true, length: { maximum: 200 }, on: :create, allow_blank: true
  validates :birth_year, presence: true, numericality: true, length: { is: 4 }, on: :create, allow_blank: true
  validates :birth_month, presence: true, numericality: true, length: { in: 1..2 }, on: :create, allow_blank: true
  validates :birth_day, presence: true, numericality: true, length: { in: 1..2 }, on: :create, allow_blank: true
  validates :telephone, presence: true, numericality: true, length: { in: 10..11 }, on: :create, allow_blank: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  private

    def downcase_email
      self.email = email.downcase
    end
end
