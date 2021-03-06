class Card < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :year
  belongs_to_active_hash :month 

  belongs_to :user, optional: true
  
  validates :number,                  presence: true, length: {maximum: 20}
  validates :security_code,           presence: true, length: {maximum: 4} 
  validates :expiration_month,        presence: true, length: {maximum: 2}
  validates :expiration_year,         presence: true, length: {maximum: 4}
  validates :token,                   presence: true
end

