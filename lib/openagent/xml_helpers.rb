require 'nokogiri'

module OpenAgent
  module XMLHelpers
    PP_XSLT = File.read(File.join(File.dirname(__FILE__), 'pretty_print.xslt'))
    PP_XSL = Nokogiri::XSLT(PP_XSLT)

    def xml_and_doc(xml)
      [xml, Nokogiri::XML(xml)]
    end

    def formatted_xml(xml, prettyprint=@prettyprint)
      prettyprint ? parse_well_formed_xml(xml) : xml_and_doc(xml)
    end

    def pretty_xml(doc)
      PP_XSL.apply_to(doc).to_s
    end

    # If XML is well-formed, reformat it as a pretty XML document.
    def parse_well_formed_xml(xml)
      doc = Nokogiri::XML(xml){ |c| c.strict }
      [pretty_xml(doc), doc]
    rescue Nokogiri::XML::SyntaxError
      xml_and_doc(xml)
    end
  end
end
