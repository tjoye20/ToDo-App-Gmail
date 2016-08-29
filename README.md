# Command-line To-Do List

To-do list program with full functionality from the command line, including emailing the list (requires a Gmail account).

### Project Goal

Used this project to solidify parsing CSV files and manipulating them as Ruby objects.

### Quickstart

After cloning the repository onto your local machine,```` bundle install ```` to download the gems used to build the program. Make sure your Ruby version is 2.2.5

Running the ```` runner.rb ```` file launches the program. But, you have to run it with an ARGV command. See below.

List of available commands: display, sort, add, delete, done, and email.

Example: In your terminal, entering ```` ruby runner.rb display ```` will display the full list.

To add an item, use this format: ```` ruby runner.rb add go grocery shopping ```` this will add "go grocery shopping" to your to-do list items.

To delete or mark an item as "done", you put the command first, then the number of the item. Ex: ```` ruby runner.rb delete 2 ```` will delete item number 2 from the list.


Running the command: ```` ruby runner.rb email ```` will prompt you through emailing the ToDo list.
