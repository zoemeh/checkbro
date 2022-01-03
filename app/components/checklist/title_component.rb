# frozen_string_literal: true

class Checklist::TitleComponent < ViewComponent::Base
  def initialize(checklist:)
    @checklist = checklist
  end

end
