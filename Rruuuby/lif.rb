require 'ruby2d'

@backgroundimg = Image.new('assets/gradient.jpg',y:-275)
set width: 780, height: 700, title: "Ruby", background: @backgroundimg

@button = Image.new('assets/button.png',z:5,width:200,height:100,y:335,x:290)

@clicknum = 0
@defsize = 50
#defsize is declared here
@clicktext = Text.new("Clicks: #{@clicknum}",z:6,y:(@button.y + 20),x:(@button.x + 20),font:'fonts/pixelated.ttf',size: 50)
#size is set equal to @defsize

@pop1 = Sound.new ('audio/pop.wav')
@pop2 = Sound.new ('audio/popsound2.wav')
@pop3 = Sound.new ('audio/popsound3.wav')
@pop4 = Sound.new ('audio/popsound4.wav')

@achsound1 = Sound.new ('audio/achsound1.wav')

@popsounds = [@pop1,@pop2,@pop3,@pop4]


on :mouse_down do |event|

  if @button.contains?(event.x,event.y)
     case event.button
      when :left

        @popsounds.sample.play
        @clicknum += 1
        @clicktext.text = "Clicks: #{@clicknum}"

      end
    end

    if @clicknum == 100
        @achsound1.play
      end

      if @clicknum == 10
          @clicktext.size = 40
          @clicktext.remove
          @clicktext.add
      end
      #^^^This seems to do nothing
  end


show
