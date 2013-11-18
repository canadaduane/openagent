require "nokogiri"

module OpenAgent
  module XMLHelpers
    PP_XSLT = File.read(File.join(File.dirname(__FILE__), 'pretty_print.xslt'))
    PP_XSL = Nokogiri::XSLT(PP_XSLT)

    def formatted_xml(xml, pretty_print=true)
      pretty_print ? parse_well_formed_xml(xml) : xml
    end

    def pretty_xml(doc)
      PP_XSL.apply_to(doc).to_s
    end

    # If XML is well-formed, reformat it as a pretty XML document.
    def parse_well_formed_xml(xml)
      doc = Nokogiri::XML(xml){ |c| c.strict }
      pretty_xml(doc)
    rescue Nokogiri::XML::SyntaxError
      xml
    end
  end
end
