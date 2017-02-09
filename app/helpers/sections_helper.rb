module SectionsHelper

  def which_pages(pages)
    pages.map { |page| [page.name, page.id] }
  end
end
