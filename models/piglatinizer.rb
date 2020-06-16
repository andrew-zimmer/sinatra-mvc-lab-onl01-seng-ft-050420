class PigLatinizer
    attr_reader :text

    def initialize (text = nil)
        @text = text
    end

    def piglatinize(text = @text)
        text_array = text.split(" ")
        text_PL = []
        text_array.each do |word|
            if word.match?(/^[aeiou]|^[AEIOU]/)
                text_PL << "#{word}way"
            elsif word.match?(/^st|^sm|^sp|^sk|^sn|^sl|^sf|^th|^str|^pl|^spr|^pr|^wh|^Str/)
                if word.match?(/^spr|^str|^Str/)

                    word_arr = word.split('')
                    word_arr_index_0 = word_arr.delete_at(0)
                    word_arr_index_1 = word_arr.delete_at(0)
                    word_arr_index_2 = word_arr.delete_at(0)
                    word_arr << word_arr_index_0
                    word_arr << word_arr_index_1
                    word_arr << word_arr_index_2
                    new_word = word_arr.join
                    text_PL << "#{new_word}ay"
                else
                    word_arr = word.split('')
                    word_arr_index_0 = word_arr.delete_at(0)
                    word_arr_index_1 = word_arr.delete_at(0)
                    word_arr << word_arr_index_0
                    word_arr << word_arr_index_1
                    new_word = word_arr.join
                    text_PL << "#{new_word}ay"
                end
            elsif word.match?(/^[zxcvbnmsdfghjklpytrwq]|^[QWRTYPLKJHGFDSZXCVBNM]/)
                word_arr = word.split('')
                word_arr_index_0 = word_arr.delete_at(0)
                word_arr << word_arr_index_0
                new_word = word_arr.join
                text_PL << "#{new_word}ay"
            end
        end
        text_PL.join(' ')
    end

    def consonant_cluster?
        self.match?(/^st|^sm|^sp|^sk|^sn|^sl|^sf|^th|^str/)
    end

    def two_letter_cluster?
        self.match?(/^st|^sm|^sp|^sk|^sn|^sl|^sf|^th/)
    end
end
