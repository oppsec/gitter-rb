require 'colorize'

def get_banner()
  
  file = File.open("src/ui/banner.txt", "r")
  file_content = file.read

  print(file_content.red)

  file.close()
end


def clear()
  system("clear") || system("cls")
end