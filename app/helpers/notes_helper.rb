module NotesHelper
  def file_content
    filename = params[:filename]
    file_path = Rails.root.join("notes", filename)
    if File.exist?(file_path)
      content = File.read(file_path)
      render plain: content
    else
      render plain: "File not found", status: :not_found
    end
  end

  def set_selected
    # Set the @selected variable to equal to the innerText of clicked element
  end
end
