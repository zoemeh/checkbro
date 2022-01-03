# frozen_string_literal: true

class Checklist::ItemComponent < ViewComponent::Base
  def initialize(checklist_item:)
    @checklist_item = checklist_item
  end
end
