class Task < ApplicationRecord
    
  validates :conntent, presence: true, length: { maximum: 10 }
  validates :status, presence: true, length: { maximum: 10 }
    
end
