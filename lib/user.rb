require "pry"

class User
  attr_accessor :email, :age
  @@all_users = [] # on declare une variable de class qui est un array
  @@all_count = 0 # on declare une variable de class qu'on initialise a 0

  def initialize(email_to_save, age_to_save)
    @email = email_to_save
    @age = age_to_save
    @@all_users << self #on rajoute chaque nouveau user dans notre array
    @@all_count = @@all_count + 1 #on calcule combien de user y-a-t'il
  end

  def self.all
    return @@all_users
  end

  def self.count
    return @@all_count
  end

  def self.find_by_email(email)
    @@all_users.each do |user_1|
      if user_1.email == email
        return "Voici l'age du User trouvé : #{user_1.age}"
      end
    end
  end
end

binding.pry
puts "end of file"