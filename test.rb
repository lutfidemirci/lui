def pagination(page, total_page, range)
  html = ""
  return html if ((page < 1) || (page > total_page))
  i = 1
  if (page > (range+3))
    html += "1 "
    html += "... "
    i = page - range
  end
  while i < page
    html += "#{i} "
    i += 1
  end
  html += "(#{page})"
  html += " " unless page == total_page
  if page < (total_page - (range + 2))
    range.times { |i| html += "#{page + i + 1} " }
    html += "... "
  elsif page >= (total_page - (range + 2))
    i = page + 1
    while i < total_page
      html += "#{i} "
      i += 1
    end
  end
  html += "#{total_page}" unless page == total_page
  return html
end