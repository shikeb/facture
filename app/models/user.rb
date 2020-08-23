class User < ApplicationRecord

  has_many :invoices

  validates :username, presence: true, uniqueness: { case_sensitive:false }, length: { minimum:3, maximum: 15 } 
  validates :first_name, presence: true, length: { minimum:3, maximum: 25 } 
  validates :last_name, presence: true, length: { minimum:3, maximum: 25 } 
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, length: { maximum: 100 }
end