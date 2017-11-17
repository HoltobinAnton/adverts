module AdvertsHelper
  def get_desc(desc, value = '')
    desc.truncate_words(12).split(' ').each do |word|
      word.size > 25 ? break : value += "#{word} "
    end
    value
  end
end
