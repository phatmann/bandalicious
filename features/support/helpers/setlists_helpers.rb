module SetlistsHelpers
  def find_song(list, name)
    find(list + ' .name span', :text => name).find(:xpath, '../..')
  end

  def find_break(list, opts = {})
    find(list + ' .break')
  end

  def setlist_name_from_title(title)
    title.match(/^(.*?)( \(.*\))?$/)[1]
  end

  def has_song(list, name)
    page.has_css?(list + ' .name span', :text => name)
  end

  def has_break(list)
    page.has_css?(list + ' .break')
  end
end

World(SetlistsHelpers)