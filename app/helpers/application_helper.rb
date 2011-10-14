module ApplicationHelper
  COL_LENGTH = 25
  NUM_COLS = 2

  def title(page_title, page_stats = "")  
    content_for(:title) { page_title }  
    content_for(:stats) { page_stats }
  end

  def column_marking(index)
    column = NUM_COLS - (index / COL_LENGTH + 1) % NUM_COLS
    is_column_top = index > 0 && index % COL_LENGTH == 0
    k = 'column' + column.to_s
    k << ' column-break' if is_column_top && column > 1
    k << ' page-break' if is_column_top && column == 1
    k
  end
end
