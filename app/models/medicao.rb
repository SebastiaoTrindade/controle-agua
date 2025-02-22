class Medicao < ApplicationRecord
  belongs_to :user
  validates :data, presence: true
  validates :medicao_manha, :medicao_tarde, numericality: { greater_than_or_equal_to: 0 }
  
  
end
