module GroupsHelper
  def display_groups(groups)
    list_item = tag.div do
      ' '
    end
    groups.each do |group|
      list_item +=
        content_tag(:div, class: 'user') do
          content_tag(:h3) do
            show_icon(group)
          end +
            content_tag(:h1) do
              link_to group.name, group_path(group)
            end +
            content_tag(:h3) do
              group.created_at
            end +
            content_tag(:h3) do
              group.created_at
            end +
            content_tag(:button) do
              link_to 'Delete', group, method: :delete
            end
        end
    end
    list_item
  end
end
