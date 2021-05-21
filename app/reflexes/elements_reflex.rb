class ElementsReflex < ApplicationReflex
  def sort
    elements = JSON.parse(element.dataset[:elements])
    elements.each do |element|
      element_record = PostElement.find(element['id'])
      element_record.update(position: element['position'])
    end
  end
end
