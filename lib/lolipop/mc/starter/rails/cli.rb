require 'thor'
require 'lolipop/mc/starter/rails/check_list'

module Lolipop
  module Mc
    module Starter
      module Rails
        class CLI < Thor
          desc 'check', 'Check your Rails project'
          def check
            Lolipop::Mc::Starter::Rails::CheckList.check_all
          end

          option :version, type: :boolean, aliases: :v
          def help(version = nil)
            if version
              puts Lolipop::Mc::Starter::Rails::VERSION
            else
              super
            end
          end
        end
      end
    end
  end
end
