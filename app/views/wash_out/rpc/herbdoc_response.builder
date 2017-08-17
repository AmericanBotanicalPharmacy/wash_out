xml.instruct!
xml.tag! 'SOAP-ENV:Envelope',
         'xmlns:SOAP-ENV' => 'http://schemas.xmlsoap.org/soap/envelope/',
         'xmlns:xsd' => 'http://www.w3.org/2001/XMLSchema',
         'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance',
         'xmlns:SOAP-ENC' => 'http://schemas.xmlsoap.org/soap/encoding/',
         'SOAP-ENV:encodingStyle' => 'http://schemas.xmlsoap.org/soap/encoding/',
         'xmlns:ns1' => @namespace do
  if !header.nil?
    xml.tag! "SOAP-ENV:Header" do
      xml.tag! "ns1:#{@action_spec[:response_tag].camelize(:lower)}" do
        wsdl_data xml, header
      end
    end
  end
  xml.tag! "SOAP-ENV:Body" do
    xml.tag! "ns1:#{@action_spec[:response_tag].camelize(:lower)}" do
      xml.target! << result['value']
    end
  end
end
