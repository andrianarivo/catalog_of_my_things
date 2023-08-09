require_relative '../classes/label'
require_relative 'item_module'

module LabelModule
  include ItemModule

  def create_label
    print 'title:'
    title = gets.chomp
    print 'color:'
    color = gets.chomp
    new_label = Label.new(title, color)
    @labels << new_label
    link_label_item(new_label)
    puts 'label created successfully!'
  end

  def link_label_item(label)
    puts 'choose one item by index (NOT ID) to link with this Label: '
    list_items
    item_idx = gets.chomp.to_i
    label.add_item(@items[item_idx - 1])
  end

  def list_labels
    @labels.each_with_index do |label, index|
      puts "#{index + 1} #{label}"
    end
  end
end
