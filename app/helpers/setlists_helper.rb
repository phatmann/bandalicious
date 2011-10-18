module SetlistsHelper
  def setlist_display_name(setlist)
    s = setlist.name
    s << " (#{setlist.date.to_formatted_s(:long)})" if setlist.date
    s
  end

  def setlist_item_class(setlist_item, index)
    k = 'setlist_item ' + column_marking(index)
    k << ' break' unless setlist_item.song
    k
  end
end
