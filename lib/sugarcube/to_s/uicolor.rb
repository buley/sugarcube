class UIColor
  def to_s
    inside = nil
    Symbol.uicolors.each_pair do |color, method|
      if UIColor.send(method) == self
        if self.alpha < 1
          inside = "UIColor.#{method}(#{alpha})"
        else
          inside = "UIColor.#{method}"
        end
        break
      end
    end
    return inside if inside

    red = (self.red * 255).to_i << 16
    green = (self.green * 255).to_i << 8
    blue = (self.blue * 255).to_i
    my_color = red + green + blue

    inside = "0x#{my_color.to_s(16)}"
    Symbol.css_colors.each_pair do |color, hex|
      if hex == my_color
        inside = color.inspect
        break
      end
    end

    if self.alpha < 1
      return "UIColor.color(#{inside}, #{alpha})"
    else
      return "UIColor.color(#{inside})"
    end
  end
end
