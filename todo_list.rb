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
    string = ''
    @list.each do |item|
      item_string = "#{item.description} \n"
      string += item_string
    end
    string
  end

  def display_all_with_numbers
    i = 1
    string = ''
    @list.each do |item|
      item_string = "#{i}. #{item.description} \n"
      string += item_string
      i += 1
      puts item_string
    end
    string
  end

  def add_new_item(new_item)
    new_item_to_add = ListItem.new(new_item)
    @list << new_item_to_add
    File.write("todo_list_data.csv", "description \n#{self.display_all}")
    self.display_all_with_numbers
  end

  def remove_item(num)
    @list.delete_at(num - 1)
    File.write("todo_list_data.csv", "description \n#{self.display_all}")
    self.display_all_with_numbers
  end

  def display_one(num)
    puts @list[num - 1].description
  end

  def mark_complete(num)
    @list[num - 1].description = "#{@list[num - 1].description} [DONE]"
    File.write("todo_list_data.csv", "description \n#{self.display_all}")
    self.display_all_with_numbers
  end

  def display_all_sorted
    sorted = @list.sort_by do |item|
      item.description
    end
    i = 1
    sorted.each do |item|
      puts "#{i}. #{item.description}"
      i += 1
    end
  end


  def email_list
    puts "What's your Gmail username?"
    username = STDIN.gets.chomp
    puts "What's your Gmail password?"
    password = STDIN.gets.chomp
    puts "What email address do you want to send this list to?"
    email_address = STDIN.gets.chomp
    list_items = self.display_all_with_numbers

    gmail = Gmail.connect(username, password)
    gmail.deliver do
      to email_address
      subject "ToDo List"
      text_part do
        body list_items
      end
    end
  end
end
