module ApplicationHelper
    def locale(locale)
        locale == :en ? "Inglês" :  "Português BR"
    end

    def data_Br 
        Date.today.strftime("%d/%m/%Y")
    end
end
