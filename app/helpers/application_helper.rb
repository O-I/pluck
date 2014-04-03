module ApplicationHelper
  def sortable(link_name, sort_by)
    link_to link_name, sort: sort_by
  end
end
