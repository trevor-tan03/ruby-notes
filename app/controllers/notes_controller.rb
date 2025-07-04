class NotesController < ApplicationController
  def index
    @files = Dir.children(Rails.root.join("notes"))
  end
end
