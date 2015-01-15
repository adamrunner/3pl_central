module ThreePLCentral
  class Parser
    include CoreExtensions
    class << self
      def hash_from_xml(xml_string)
        document = ::Nokogiri::XML(xml_string)

        xml_node_to_hash(document.root)
      end

      def xml_node_to_hash(node)
        if node.element?
          result_hash = {}
          if node.children.size > 0
            node.children.each do |child|
              result = xml_node_to_hash(child)
              if child.name == "text"
                unless child.next_sibling || child.previous_sibling
                  return result
                end
              elsif result_hash[child.name.downcase.to_sym]
                if result_hash[child.name.downcase.to_sym].is_a?(Object::Array)
                  result_hash[child.name.downcase.to_sym] << result
                else
                  result_hash[child.name.downcase.to_sym] = [result_hash[child.name.downcase.to_sym]] << result
                end
              else
                result_hash[child.name.downcase.to_sym] = result
              end
            end
            return result_hash
          else
            return result_hash
          end
        else
          return node.content.to_s
        end
      end
    end
  end
end