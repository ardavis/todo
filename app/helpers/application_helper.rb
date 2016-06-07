module ApplicationHelper

  def submit_text(obj)
    obj.persisted? ? "Update #{obj.class}" : "Create #{obj.class}"
  end

end
