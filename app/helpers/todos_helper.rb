module TodosHelper

  def complete_or_reopen_button(todo)
    if todo.completed?
      link_to [:reopen, todo.list, todo], class: 'btn btn-info', method: :post do
        content_tag :span, '', class: 'glyphicon glyphicon-arrow-up'
      end
    else
      link_to [:complete, todo.list, todo], class: 'btn btn-success', method: :post do
        content_tag :span, '', class: 'glyphicon glyphicon-check'
      end
    end
  end

end
