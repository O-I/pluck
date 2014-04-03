module ApplicationHelper
  def sortable(link_name, sort_column, sort_direction = 'DESC')
    link_to link_name, sort: "#{sort_column} #{sort_direction}"
  end
end
