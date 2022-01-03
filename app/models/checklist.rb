class Checklist < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  has_many :checklist_items, dependent: :delete_all

  def items
    checklist_items
  end

  def items=(v)
    checklist_items = v
  end
end
