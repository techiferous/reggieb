Gem::Specification.new do |s|
  s.name          = "reggieb"
  s.version       = "0.0.1"
  s.author        = "Wyatt Greene"
  s.email         = "techiferous@gmail.com"
  s.summary       = "A Hex/RGB color converter."
  s.description   = %Q{
    Reggie B. converts colors between hex format and rgb format.
    It is very forgiving in the syntax it allows.
  }
  s.require_path  = "lib"
  s.files         = FileList["lib/**/*.rb", "[A-Z]*", "test/**/*"].to_a
  s.homepage      = "http://github.com/techiferous/reggieb"
  s.requirements  << "none"
  s.has_rdoc      = true
  s.test_files    = Dir.glob("test/**/*.rb")
end
