module WelcomeHelper
    def ambiente
        if Rails.env.development?
            'Desenvolvimente'
        elsif Rails.env.production?
            'Produção'
        else
            'Teste'
        end
    end
            
end
