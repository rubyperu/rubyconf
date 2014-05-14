require "erb"
require "yaml"

class Site
  def initialize(lang, output)
    @lang = lang
    @output = output
    @text = YAML.load_file("locale/#{lang}.yml")
  end

  def t(key)
    @text[key]
  end

  def generate
    write("index.html", render("index"))
  end

  private

  def write(file, content)
    File.open(output_path(file), "w") { |f| f.write(content) }
  end

  def render(t)
    ERB.new(template(t)).result(binding)
  end

  def template(t)
    File.open("templates/#{t}.erb").read
  end

  def output_path(file)
    File.join(@output, @lang, file)
  end
end

if ARGV.length != 2
  printf("usage: %s [en|es] output\n", $0)
  exit
end

Site.new(ARGV[0], ARGV[1]).generate
