module UsersHelper
  def show_profile(current_user)
    return if session[:user_id].nil?

    list_item = tag.div do
      ' '
    end
    list_item +=
      content_tag(:div, class: 'user') do
        content_tag(:h3) do
          show_avatar(current_user)
        end +
          content_tag(:h4, class: 'buttonstyle') do
            link_to 'Update avatar', edit_user_path(current_user)
          end +
          content_tag(:h1) do
            current_user.name
          end +
          content_tag(:h3) do
            current_user.email
          end +
          content_tag(:h3) do
            "You have #{current_user.spendings.count} transactions"
          end +
          content_tag(:h3) do
            "You have #{current_user.groups.count - 1} groups"
          end +
          content_tag(:h3) do
            'Total Expenses'
          end +
          content_tag(:h1) do
            total_expenses(current_user).to_s
          end
      end
    list_item
  end
end
