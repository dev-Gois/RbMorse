morse_codes = { '.-': 'a', '-...': 'b', '-.-.': 'c', '-..': 'd', '.': 'e', '..-.': 'f', '--.': 'g', '....': 'h', '..': 'i', '.---': 'j', '-.-': 'k', '.-..': 'l', '--': 'm', '-.': 'n', '---': 'o', '.--.': 'p', '--.-': 'q', '.-.': 'r', '...': 's', '-': 't', '..-': 'u', '...-': 'v', '.--': 'w', '-..-': 'x', '-.--': 'y', '--..': 'z', '.----': '1', '..---': '2', '...--': '3', '....-': '4', '.....': '5', '-....': '6', '--...': '7', '---..': '8', '----.': '9', '-----': '0'}

puts "Welcome to the Ruby based Morse Encoder/Decoder"
print "What u want? encode or decode? (d/e): "
choice = gets.chomp.downcase

if choice == 'd'
    puts 'Write the message you want to decode: (use two spaces to symbolize word change)'
    puts 'Ex: .-.. --- ...- .'
    word = gets.chomp.split("")
    current_decode = []
    current_element = []
    count = 0
    for element in word do
        if element == " "
            current_word = current_element.join
            current_decode.push(morse_codes[:"#{current_word}"])
            current_element.clear
        elsif element == " " && current_element.length == 0
            current_decode.push(" ")
        elsif count == word.length - 1
            current_element.push(element)
            current_word = current_element.join
            current_decode.push(morse_codes[:"#{current_word}"])
            current_element.clear
        else
            current_element.push(element)
        end
        count += 1
    end
    current_decode = current_decode.join
    puts "The decoded message is: #{current_decode}"

elsif choice == 'e'
    puts 'Write the message you want to encode:'
    puts 'Ex: Pray for Jesus'

    word = gets.chomp.split("")
    encoded = []
    for element in word do
        if element == " "
            encoded.push("  ")
        else
            morse = morse_codes.key(element).to_s.delete(':')
            encoded.push(morse)
            encoded.push(" ")
        end
    end
    encoded = encoded.join
    puts "The encoded message is: #{encoded}"
else
    puts 'Invalid option!'
end