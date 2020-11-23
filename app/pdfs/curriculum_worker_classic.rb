require "open-uri"
class CurriculumWorkerClassic < Prawn::Document
      def initialize(worker, view)
        super(margin: 20)
        @worker = worker
        @view = view
        font_setup
        header
        personnal_informations
        graduates
        tranings
        site_cards 
    end



    def font_setup
    font_families.update("Nunito" => {
      :normal => "app/assets/fonts/Nunito/Nunito-Regular.ttf",
      :italic => "app/assets/fonts/Nunito/Nunito-Italic.ttf",
      :bold => "app/assets/fonts/Nunito/Nunito-Bold.ttf",
    })
    end

    def header
        bounding_box([0, cursor], width: 570, height: 450) do
            # stroke_bounds
            font "Nunito"
            pad(10) { text "#{@worker.first_name} <b>#{@worker.last_name}</b>", inline_format: true }
            # text @view.worker_photo(@worker)
            image_url = open @view.worker_photo(@worker, transformation: {:width=>150, :height=>150, :gravity=>"face", :crop=>"thumb"})
            pad(100) { image image_url, position: :right, vposition: :top }
        end
    end

    def personnal_informations
    end

    def graduates
        stroke do
            rectangle [cursor + 300, cursor], 10, 20  
            rounded_rectangle [300, 300], 100, 200, 20
        end
        @worker.graduates.each do |graduate|
            text "#{graduate.name} - #{graduate.school_name}"
        end
    end

    def tranings
        @worker.trainings.each do |training|
            text "#{training.training_type} - #{training.name}"
        end
    end

    def site_cards
        text "#{@worker.positions.last.site.name}"
    end
end