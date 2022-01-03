class PagesController < ApplicationController
  def home
    @checklists = Checklist.all
  end

  def up
    Redis.current.ping
    ActiveRecord::Base.connection.execute("SELECT 1")

    head :ok
  end
end
