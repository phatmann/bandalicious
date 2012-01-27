module SetlistsHelpers
  def find_song(list, name)
    find(list + ' .name span', :text => name).find(:xpath, '../..')
  end

  def find_break(list)
    find(list + ' .break')
  end

  def setlist_name_from_title(title)
    title.match(/^(.*?)( \(.*\))?$/)[1]
  end
end

World(SetlistsHelpers)