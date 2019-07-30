module Lolipop
  module Mc
    module Starter
      module CheckList
        require 'lolipop/mc/starter/check_item/base'
        require 'lolipop/mc/starter/check_item/git'
        require 'lolipop/mc/starter/check_item/ruby'
        require 'lolipop/mc/starter/check_item/rails_dir'
        require 'lolipop/mc/starter/check_item/ssh'
        require 'lolipop/mc/starter/check_item/rails'
        require 'lolipop/mc/starter/check_item/git_log'

        LIST = [
          Lolipop::Mc::Starter::CheckItem::Git,
          Lolipop::Mc::Starter::CheckItem::Ruby,
          Lolipop::Mc::Starter::CheckItem::RailsDir,
          Lolipop::Mc::Starter::CheckItem::SSH,
          Lolipop::Mc::Starter::CheckItem::Rails,
          Lolipop::Mc::Starter::CheckItem::GitLog
        ]

        def self.check_all
          LIST.each do |item|
            i = item.new
            begin
              puts '✅ ' + Paint[i.check, :green].to_s
            rescue => e
              puts '❌ ' + Paint[e.message, :red]
              puts ''
              puts '[ヒント]'
              i.hint
              break
            end
          end
        end
      end
    end
  end
end