# frozen_string_literal: true

require_relative "action_text_to_whatsapp_markdown/version"

module ActionTextToWhatsappMarkdown
  def parse(action_text_content)
    formatted_content = action_text_content.to_s

    replacements = {
      '<div class="trix-content">' => '',
      '<strong><em><del> </del></em></strong>' => ' ',
      '<em> </em>' => ' ',
      '<del> </del>' => ' ',
      '<strong> </strong>' => ' ',
      '<em></em>' => ' ',
      '<del></del>' => ' ',
      '<strong></strong>' => ' ',
      '<em><br></em>' => '<br>',
      '<em><br></em>' => '<br>',
      '<em><br><br></em>' => '<br><br>',
      '<del><br></del>' => '<br>',
      '<em> <br></em>' => '<br>',
      '<del><br><br></del>' => '<br><br>',
      '<strong><br></strong>' => '<br>',
      '<strong> <br></strong>' => '<br>',
      '<strong><br><br></strong>' => '<br><br>',
      '<br></del>' => '</del><br>',
      '<br></em>' => '</em><br>',
      '<br></strong>' => '</strong><br>',
      '<br><br></del>' => '</del><br><br>',
      '<br><br></em>' => '</em><br><br>',
      '<br><br></strong>' => '</strong><br><br>',
      '<br></strong>'=> '</strong><br>',
      '&nbsp;</strong>' => '*&nbsp;',
      '<strong>*</strong>' => '',
      ' </strong>' => '* ',
      '<strong> ' => '*',
      '<strong>' => '*',
      '</strong>' => '*',
      '<em> ' => '_',
      ' </em>' => '_ ',
      '&nbsp;</em>' => '_&nbsp;',
      '<em>' => '_',
      '</em>' => '_',
      '<del> ' => '~',
      ' </del>' => '~ ',
      '&nbsp;</del>' => '~&nbsp;',
      '<del>' => '~',
      '</del>' => '~',
      '<br>' => "\n",
      '&amp;' => '&',
      '&lt;' => '<',
      '&gt;' => '>',
      '<div>' => '',
      '</div>' => '',
      '&nbsp;' => ' '
    }
    
    replacements.each do |tag, markdown|
      formatted_content.gsub!(tag, markdown)
    end

    formatted_content.strip
  end
end
