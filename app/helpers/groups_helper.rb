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
            content_tag(:h4, class: 'buttonstyle') do
              link_to 'Update icon', edit_group_path(group)
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
            content_tag(:h3) do
              "Created by: #{group.user.name}"
            end +
            content_tag(:button) do
              link_to 'Delete', group, method: :delete
            end
        end
    end
    list_item
  end

  def show_group(group)
    list_item = tag.div do
      ' '
    end
    group.spendings.each do |transaction|
      list_item +=
        content_tag(:div, class: 'user') do
          content_tag(:h1) do
            transaction.name
          end +
            content_tag(:h3) do
              transaction.amount.to_s
            end
        end
    end
    list_item
  end
end
