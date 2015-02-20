require_relative "./lib/models/bathroom"

class Bathroom < Thor
  desc "status", "Bathroom status"
  def status
    puts "The john #{::Bathroom.new.occupied? ? "is" : "is not"} occupied."
  end
end
