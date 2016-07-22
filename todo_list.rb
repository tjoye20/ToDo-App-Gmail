require "csv"

class TodoList

  attr_accessor :list

  def initialize
    @list = []
  end

  def load_list(list_data)
    csv = CSV.foreach(list_data, :headers => true, :header_converters => :symbol) do
      |row|
      @list << ListItem.new(row[:description])
    end
  end

  def display_all
    i = 1
    string = ''
    while i <= @list.length
      @list.each do |item|
         item_string = "#{i}. #{item.description} \n"
         string += item_string
        i += 1
        puts item_string
      end
    end
    #will return this string, so we can write it to a file
    string
  end

  def add_new_item(new_item)
    new_item_to_add = ListItem.new(new_item)
    @list << new_item_to_add
    self.display_all
  end

  def remove_item(num)
    @list.delete_at(num - 1)
    self.display_all
  end

  def display_one(num)
    puts @list[num - 1].description
  end

  def mark_complete(num)
    @list[num - 1].description = "#{@list[num - 1].description} [DONE]"
    self.display_all
  end


#extra feature
  def display_all_sorted
    sorted = @list.sort_by do |item|
      item.description
    end
    i = 1
    while i <= sorted.length
      sorted.each do |item|
        puts "#{i}. #{item.description}"
        i += 1
      end
    end
  end

end
