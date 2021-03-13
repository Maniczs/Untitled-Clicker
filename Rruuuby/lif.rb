require 'ruby2d'
@backgroundimg = Image.new('assets/gradient.jpg',y:-275)
set width: 780, height: 700, title: "Ruby", background: @backgroundimg

@clickbutton = Image.new('assets/button.png',z:5,width:200,height:100,y:335,x:290)
@upgrade1 = Image.new('assets/button.png',z:5,width:100,height:50,y:5,x:3.5)
@upgrade1text = Text.new("+3",z:6,x:(@upgrade1.x + 33),y:(@upgrade1.y + 12),size:20)
@upgrade1.remove
@upgrade1text.remove

@upgrade2 = Image.new('assets/button.png',z:5,width:100,height:50,y:50,x:3.5)
@upgrade2text = Text.new("+4",z:6,x:(@upgrade2.x + 33),y:(@upgrade2.y + 12),size:20)
@upgrade2.remove
@upgrade2text.remove
#buttons and indicators^^

@upgradestat = 1
@pointsperclick = Text.new("points per click: #{@upgradestat}",z:6,y:50,x:500)

@devmode = false
#set this to true to active dev cheats

@songplayed = false

@clicknum = 0
@clicktext = Text.new("Clicks: #{@clicknum}",z:6,y:(@clickbutton.y + 25),x:(@clickbutton.x + 27),font:'fonts/pixelated.ttf',size: 40)
#size is set equal to 50

@pop1 = Sound.new ('audio/pop.wav')
@pop2 = Sound.new ('audio/popsound2.wav')
@pop3 = Sound.new ('audio/popsound3.wav')
@pop4 = Sound.new ('audio/popsound4.wav')

@achsound1 = Sound.new ('audio/achsound1.wav')

@popsounds = [@pop1,@pop2,@pop3,@pop4]



on :mouse_down do |event|

  if @clickbutton.contains?(event.x,event.y)
     case event.button
     when :left

        @popsounds.sample.play
        @clicknum += @upgradestat


        if @clicknum >= 50
          @upgrade1.add
          @upgrade1text.add
        end
        if @clicknum >= 150
          @upgrade2.add
          @upgrade2text.add
        end
      end
    end
  if @upgrade1.contains?(event.x,event.y)
    case event.button
    when :left
      if @clicknum > 50
      @popsounds.sample.play

      @clicknum = @clicknum - 50

      @upgradestat += 2
    end

      if @clicknum < 50
      @upgrade1.remove
      @upgrade1text.remove
      end
    end
  end
  if @upgrade2.contains?(event.x,event.y)
    case event.button
    when :left
      if @clicknum > 150
      @popsounds.sample.play

      @clicknum = @clicknum - 150

      @upgradestat += 4
    end

      if @clicknum < 150
      @upgrade2.remove
      @upgrade2text.remove
      end
    end
  end
    if @clicknum >= 50 && @songplayed == false
        @achsound1.play
        @songplayed = true
      end

      if @clicknum == 10
          @clicktext.size = 40
      end
      #^^^This seems to do nothing for now. Have to wait until a fix is added to ruby2d

      #-------------------------------------------
      if @devmode == true
      on :key_held do |event|
        if event.key == '6'
          @clicknum = 48
          elsif event.key == '7'
            @clicknum = -1
          elsif event.key == '8'
            @clicknum = 98
          elsif event.key == '9'
            @clicknum = 998
          elsif event.key == '0'
            @clicknum = 9998
          elsif event.key == '-'
            @clicknum = 99998
          elsif event.key == '='
            @clicknum = 999998
          elsif event.key == 'backspace'
            @clicknum = 9999998
          elsif event.key == '`'
            @clicknum = 99999998
          end
  #^^dev cheats to make it easier to check for bugs. Set @devmode to true to use.

          end
        end

  end
update do
  @pointsperclick.text = "points per click: #{@upgradestat}"
  @clicktext.text = "Clicks: #{@clicknum}"

  if @clicknum >= 100 || @clicknum < 0
    @clicktext.text = "#{@clicknum}"
  end
end




show
