#
#  tscrollbar widget
#                               by Hidetoshi NAGAI (nagai@ai.kyutech.ac.jp)
#
require 'tk'
require 'tkextlib/tile.rb'

module Tk
  module Tile
    class TScrollbar < TkScrollbar
    end
    Scrollbar = TScrollbar
  end
end

class Tk::Tile::TScrollbar < TkScrollbar
  include Tk::Tile::TileWidget

  if Tk::Tile::USE_TTK_NAMESPACE
    TkCommandNames = ['::ttk::scrollbar'.freeze].freeze
  else
    TkCommandNames = ['::tscrollbar'.freeze].freeze
  end
  WidgetClassName = 'TScrollbar'.freeze
  WidgetClassNames[WidgetClassName] = self

  def self.style(*args)
    [self::WidgetClassName, *(args.map!{|a| _get_eval_string(a)})].join('.')
  end
end

class Tk::Tile::XScrollbar < Tk::Tile::TScrollbar
  def create_self(keys)
    keys = {} unless keys
    keys['orient'] = 'horizontal'
    super(keys)
  end
  private :create_self
end

class Tk::Tile::YScrollbar < Tk::Tile::TScrollbar
  def create_self(keys)
    keys = {} unless keys
    keys['orient'] = 'vertical'
    super(keys)
  end
  private :create_self
end

