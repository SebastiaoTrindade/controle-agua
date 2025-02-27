class Medicao < ApplicationRecord
  belongs_to :user
  validates :data, presence: true
  validates :manha, :tarde, numericality: { greater_than_or_equal_to: 0 }

  self.table_name = "medicoes" 
end
