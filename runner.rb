require "pry"
require_relative "list_item"
require_relative "todo_list"

if ARGV.any?

  new_list = TodoList.new
  new_list.load_list("todo_list_data.csv")

  case ARGV[0]
  when "display"
    new_list.display_all_with_numbers
  when "sort"
    new_list.display_all_sorted
  when "add"
    new_list.add_new_item(ARGV[1])
  when "delete"
    new_list.remove_item(ARGV[1].to_i)
  when "done"
    new_list.mark_complete(ARGV[1].to_i)
  when "print"
    File.write("text_file.txt", "#{new_list.display_all_with_numbers}")
  else
    puts "I don't understand that command. \nPlease try again."
  end
end
