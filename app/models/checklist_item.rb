class ChecklistItem < ApplicationRecord
  belongs_to :checklist

  def done?
    self.is_done
  end
end
