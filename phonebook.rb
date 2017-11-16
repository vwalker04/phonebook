@phonebook = { # Default preloaded phonebook
  "Bart Simpson" => "2487721123",
  "Donald Duck" => "3130917667",
  "Jack Bauer" => "2485529736",
  "Golden Taint" => "3132692365",
  "Burt Reynolds" => "2480961286"
}

def contact_list
  puts "\n.-*`*-.Phone Book.-*`*-." # Phone book menu
  puts "Enter the number for the action you'd like to perform."
  puts "--1-- Add Contacts"
  puts "--2-- List Contacts"
  puts "--3-- Edit Contacts"
  puts "--4-- Delete Contacts"
  puts "--5-- Exit Phone Book"

  user_selection = gets.chomp.to_i
  case user_selection
  when 1 # Add Contacts
    # Name input
    puts "Enter new FIRST name"
    first_name = gets.chomp.capitalize
    puts "Enter new LAST name"
    last_name = gets.chomp.capitalize
    @full_name = first_name + " " + last_name
    # Number input
    def new_number
      puts "Enter 10 Digit Phone Number"
      phone_number = gets.chomp
      if phone_number.length != 10
        new_number
      else
        puts "______________________________\n***** #{@full_name} Added!*****\n______________________________"
        @phonebook[@full_name] = phone_number
        contact_list
      end
    end
    new_number

  when 2 # List Contacts
    @phonebook.each { |k,v| puts "#{k}: #{v}"}
    contact_list

  when 3 # Edit Contacts
    puts "Enter FIRST name you wish to EDIT"
    first_name = gets.chomp.capitalize
    puts "Enter LAST name you wish to EDIT"
    last_name = gets.chomp.capitalize
    @full_name = first_name + " " + last_name
    if @phonebook.has_key?(@full_name) == true
      puts "Type '1' to edit NAME\nType '2' to edit NUMBER"
      choice = gets.chomp
      if choice == '1'
        puts "Enter NEW first name"
        new_first_name = gets.chomp.capitalize
        puts "Enter NEW last name"
        new_last_name = gets.chomp.capitalize
        @new_full_name = new_first_name + " " + new_last_name
        @phonebook[@new_full_name] = @phonebook.delete(@full_name)
        puts "______________________________\n*****#{new_first_name} #{new_last_name} Updated!*****\n______________________________"
      elsif choice == '2'
        puts "Enter NEW 10 digit number"
        new_number = gets.chomp
        @phonebook[@full_name] = new_number
        puts "______________________________\n*****#{@full_name} Updated!*****\n______________________________"
      else
        puts "Invalid entry."
      end
    else
      puts "Sorry. Contact does not exist."
    end
    contact_list

  when 4 # Deletes Contact
    puts "Enter FIRST name you wish to DELETE"
    first_name = gets.chomp.capitalize
    puts "Enter LAST name you wish to DELETE"
    last_name = gets.chomp.capitalize
    @full_name = first_name + " " + last_name
    if @phonebook.has_key?(@full_name) == true
      @phonebook.delete(@full_name)
      puts "______________________________\n***** #{@full_name} Removed!*****\n______________________________"
    else
      puts "Sorry. Contact does not exist."
    end
  contact_list

  when 5 # Exit Program
    return
  end
end
contact_list
