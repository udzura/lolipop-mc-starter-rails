module Lolipop
  module Mc
    module Starter
      module Rails
        module CheckItem
          class Base
            NOCHECK = '-'.freeze
            SKIPCHECK = 'skip'.freeze

            def initialize
              @item_name = item_name
            end

            def item_name
              inflector = Dry::Inflector.new
              inflector.underscore(self.class.to_s.split('::').last)
            end

            def desc
              "call #{@item_name} desc"
            end

            def check
              "call #{@item_name} check"
            end

            def hint
              puts "まだ #{@item_name} のヒントが書かれていません"
            end

            def load_config
              config_path = "#{Dir.pwd}/.mc-rails.yml"
              unless File.exist?(config_path)
                f = File.open(config_path, 'w')
                YAML.dump({'git' => NOCHECK, 'ruby' => NOCHECK, 'rails' => NOCHECK, 'ssh' => NOCHECK}, f)
                f.close
              end
              YAML.load_file(config_path)
            end

            def dump_config(obj)
              config_path = "#{Dir.pwd}/.mc-rails.yml"
              f = File.open(config_path, 'w')
              YAML.dump(obj, f)
              f.close
            end
          end
        end
      end
    end
  end
end
