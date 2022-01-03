# frozen_string_literal: true

class Sidebar::ChecklistComponent < ViewComponent::Base
  attr_reader :checklist
  def initialize(checklist:)
    @checklist = checklist
  end
end
