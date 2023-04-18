class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_at, presence: true
  validates :end_at,comparison: { greater_than_or_equal_to: :start_at, allow_blank: true }, presence: true
  validates :memo, length: { maximum: 500 }
  validates :is_all_day, inclusion: [true, false]

  
end
