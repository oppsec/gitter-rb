require 'uri'
require 'net/http'
require 'colorize'
require 'json'

def connection()

    print("[?] - What's your username? ".red)
    username = gets.chomp

    uri = URI("https://api.github.com/users/#{username}")
    response = Net::HTTP.get_response(uri)
    body = response.body

    if response.is_a?(Net::HTTPSuccess)
        puts "[!] Connected successfully\n".green
        extract_data(body)
    else
        return puts "[x] Connection error...".red
    end

end

def extract_data(body)

    parser = JSON.parse(body)

    content = {
        "[:] Username": parser['login'],
        "[:] Account ID": parser['id'],
        "[:] Repositories": parser['public_repos'],
        "[:] Followers": parser['followers'],
        "[:] Following": parser['following']
    }

    data_return(content)
end

def data_return(content)

    content.each do |key, value|
        puts "#{key}: #{value}".yellow
    end

end