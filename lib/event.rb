require 'time'
require "pry"

class Event
  attr_accessor :start_date, :duration, :title, :attendees
  @attendees = []

  def initialize(event_start_date, event_duration, event_title, email_list_of_attendees)
    @start_date = Time.parse(event_start_date)
    @duration = event_duration / 60
    @title = event_title
    @attendees = email_list_of_attendees
  end

  def postpone_24h
    return @start_date += 24 * 60 * 60 #décale la date initiale de 24h  
  end 

  def end_date
    return @start_date + @duration  # l'heure de fin d'un événement
  end

  # Créé une méthode is_past? 
  # pour savoir si un événement est passé ou pas. 
  # Si l'événement est dans le passé, en faisant my_event.is_past? on doit obtenir true. 
  # Sinon on obtient false.
  # Indice : Pour savoir si un évènement est passé, il suffit de comparer sa start_date avec la date et 
  # l'heure actuelle. Sache par ailleurs que tu peux comparer deux Time en faisant time_1 < time_2 qui va 
  # te retourner un booléen true/false en fonction de la réponse.
  def is_past? 
    if @start_date < Time.now
      true 
    else 
      false 
    end
  end

  def is_future?
    return !is_past? 
  end

  def is_soon?
    if @start_date <  Time.now
      false
    elsif @start_date - Time.now <= 30 * 60
      true
    else 
      false
    end
  end

  # pour afficher les détails de l'évènement joliment 
  def to_s
    output = "Titre : #{@title}\n"
    output = output + "Date de début : #{@start_date}\n"
    output = output + "Durée : #{@duration} minutes\n"
    output = output + "Invités : #{@attendees}"
    return output
  end

end

binding.pry
puts "end of file"

# my_event = Event.new("2019-04-20 19:45", 60, "standup quotidien", ["truc@machin.com", "bidule@chose.fr"])
# my_event.postpone_24h
# my_event.end_date
# my_event.is_past?
# my_event.is_future?
# my_event.is_soon?
# print my_event.to_s
