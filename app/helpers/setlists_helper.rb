module SetlistsHelper
  def setlist_display_name(setlist)
    s = setlist.name
    s << " (#{setlist.date.to_formatted_s(:long)})" if setlist.date
    s
  end
end
