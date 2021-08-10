module StringHelper
    def self.generate_salt
      o = [('a'..'z'), ('A'..'Z'), (1..9)].map(&:to_a).flatten
      string = (0...8).map { o[rand(o.length)] }.join
  
      string
    end
end
  