require 'digest/sha1'

class URL

    def initialize(url)
        @url = url
        validation
        if validation == false 
            exit
        else 
            @prefix = ENV.fetch('APP_WEBSITE','http://www.higirls.com')
            @SHORT_URL_KEY_POSITION = 0
            @ORIGINAL_URL_POSITION = 1
        end       
     
    end

    def validation
        begin
            unless @url.match(/^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix)
             raise StandardError, "Não foi possível encontrar sua URL."        
            end
        rescue StandardError => e
            puts e.message
        return false
        end
    end

    def shorter(short_url)
        @short_url = short_url
        
        File.foreach("urls.csv") do |line|    
            keyFromUser =@short_url.delete_prefix("#{@prefix}/")
            breakedLine = line.split(',')
            keyFromFile = breakedLine[@SHORT_URL_KEY_POSITION]
            
            if (keyFromUser == keyFromFile)
                 return "#{breakedLine[@ORIGINAL_URL_POSITION]}" 
                #exit 0
                end
                if File.file?("urls.csv")
                end 
                #puts "Essa url não tem correspondência no nosso banco de dados"
                #exit 1
            end
            
    end

    def longer()
        hashUrl = Digest::SHA1.hexdigest(@url)[0..7]
        File.write("urls.csv", "#{hashUrl},#{@url}\n", mode: "a+")
        return "#{@prefix}/#{hashUrl}"
    end

    require_relative 'index'

end
