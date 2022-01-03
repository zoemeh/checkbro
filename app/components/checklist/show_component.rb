# frozen_string_literal: true

class Checklist::ShowComponent < ViewComponent::Base
  def initialize(checklist:)
    @checklist = checklist
  end

end
