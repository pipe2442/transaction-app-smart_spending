module ApplicationHelper
  def grouptotal(group)
    total = 0
    group.spendings.each do |spending|
      total += spending.amount
    end
    total
  end

  def total_expenses(user)
    total = 0
    user.spendings.each do |spending|
      total += spending.amount
    end
    total
  end

  def show_externals(external)
    arr = []
    external.first.spendings.each do |spending|
      arr << spending
    end
    arr
  end

  def show_avatar(user)
    image = ''
    image << image_tag(user.avatar, style: 'height:150px;width:150px;border-radius:100%;') if user.avatar.attached?
    image.html_safe
  end

  def show_icon(group)
    icon = ''
    icon << image_tag(group.icon, style: 'height:120px;width:120px;border-radius:50%;') if group.icon.attached?
    icon.html_safe
  end

  def display_spendings(spendings)
    list_item = tag.div do
      ' '
    end
    spendings.each do |spending|
      list_item +=
        content_tag(:div, class: 'user') do
          content_tag(:h1) do
            spending.name
          end +
            content_tag(:h3) do
              spending.amount.to_s
            end +
            content_tag(:h1) do
              link_to(spending.group.name, group_path(spending.group))
            end +
            content_tag(:h3) do
              show_icon(spending.group)
            end +
            content_tag(:h3) do
              spending.created_at
            end +
            content_tag(:button) do
              link_to 'Delete', spending, method: :delete
            end
        end
    end
    list_item
  end

  def display_externals(spendings)
    list_item = tag.div do
      ' '
    end
    spendings.each do |spending|
      list_item +=
        content_tag(:div, class: 'user') do
          content_tag(:h1) do
            spending.name
          end +
            content_tag(:h3) do
              spending.amount.to_s
            end +
            content_tag(:h3) do
              spending.created_at
            end +
            content_tag(:button) do
              link_to 'Delete', spending, method: :delete
            end
        end
    end
    list_item
  end
end
