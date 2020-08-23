class Invoice < ApplicationRecord

    belongs_to :user    
    
    validates :currency, presence: true
    validates :invoice_number, presence: true, length: {minimum:3, maximum: 10} 
    validates :note, presence: true, length: {minimum:10, maximum: 150}
    validates :company_name, presence: true, length: {minimum:3, maximum: 30}
    validates :merchant_name, presence: true, length: {minimum:3, maximum: 30}
    validates :customer_name, presence: true, length: {minimum:3, maximum: 30}
    validates :merchant_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :customer_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :merchant_phone, presence: true, :numericality => true, :length => { :minimum => 10, :maximum => 15 }
    validates :amount, presence: true, :numericality => true, :length => { :minimum => 1, :maximum => 20 }
end