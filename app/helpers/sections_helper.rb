module SectionsHelper

  def which_pages(pages)
    pages.all.collect {|page| page.name}
  end
end
