# frozen_string_literal: true

class Checklist::EditTitleComponent < ViewComponent::Base
  def initialize(checklist:)
    @checklist = checklist
  end

end
