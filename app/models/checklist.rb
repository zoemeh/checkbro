class Checklist < ApplicationRecord
  validates :title, uniqueness: true, presence: true
end
