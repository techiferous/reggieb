class ReggieB

  # converts rgb colors to hex colors and vice versa.  The input is a string representing
  # an rgb or hex color.  Many formats are allowed, including:
  #
  # - "rgb(255, 255, 255)"
  # - "rgb(255, 255, 255);"
  # - "rgb 255, 255, 255 "
  # - "(255, 255, 255)"
  # - "255, 255, 255"
  # - "255 255 255"
  # - "0xffffff"
  # - "0xFFFFFF"
  # - "#ffffff"
  # - "ffffff"
  # - "fff"
  #
  # In the case only three hex digits are given, the three digits are assumed to expand
  # into six digits like so:
  #
  # - fff => ffffff
  # - 78e => 7788ee
  # - 084 => 008844
  # - ace => aaccee
  #
  # The output is either a hex color or an rgb color.  A hex color is represented as a 
  # string formatted like "0xdddddd" where d represents a hex digit.  An rgb color is
  # represented as an array of three integers between 0 and 255.
  #
  def self.convert(s)
    s = s.downcase
    s.gsub!(';', '')
    if s =~ /^\s*((0x|#|)[0-9,a-f]{6})\s*$/
      return to_rgb($1)
    end
    if s =~ /^\s*(0x|#|)([0-9,a-f])([0-9,a-f])([0-9,a-f])\s*$/
      s = $2 + $2 + $3 + $3 + $4 + $4
      return to_rgb(s)
    end
    if s =~ /^\D*(\d{1,3})\D+(\d{1,3})\D+(\d{1,3})\D*$/
      return to_hex($1.to_i, $2.to_i, $3.to_i)
    end
    raise ArgumentError.new("Bad color format.")
  end

  # converts an rgb color to hex.  rgb values must be between 0 and 255.  The output
  # is a string formatted like "0xdddddd" where d represents a hex digit.
  #
  def self.to_hex(r, g, b)
    unless (0..255).include?(r) && (0..255).include?(g) && (0..255).include?(b)
      message = "RGB values should be between 0 and 255.  Received #{r}, #{g}, #{b}."
      raise ArgumentError.new(message)
    end
    "0x#{to_hex_byte(r)}#{to_hex_byte(g)}#{to_hex_byte(b)}"
  end
  
  # converts a hex color to rgb.  The hex string should be formatted as "0xdddddd" or
  # "dddddd" where d represents a hex digit.  An array of three integers is returned
  # representing red, green, and blue values between 0 and 255.
  #
  def self.to_rgb(hex)
    hex = hex.downcase
    if hex !~ /0x[0-9,a-f]{6}/ && hex !~ /[0-9,a-f]{6}/
      raise ArgumentError.new("Hex number should be formatted as 0xdddddd or dddddd.")
    end
    last_byte   = hex[-2, 2]
    middle_byte = hex[-4, 2]
    first_byte  = hex[-6, 2]
    return [first_byte.to_i(16), middle_byte.to_i(16), last_byte.to_i(16)]
  end

  def self.to_hex_byte(digits)
    hex_string = digits.to_s(16)
    if hex_string.length == 1
      "0" + hex_string
    else
      hex_string
    end
  end
  private_class_method :to_hex_byte

end
