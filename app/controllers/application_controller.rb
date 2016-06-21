class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper
  include ActionView::Helpers::TextHelper

  before_action :load_game, :load_messages_count

  def to_timeline(data, style = nil)
    output = []
    data.keys.each do |key|
      output << { date: key, style: style, count: data[key].length }
    end
    output
  end

  def enable_auto_reload
    @auto_reload = false
  end

  def load_game
    @game = Game.instance
    raise ActiveRecord::RecordNotFound unless @game
    unless current_user.nil?
      now = Time.zone.now
      if now < @game.start
        flash.now[:info] = "The game will open <strong><span id=\"major-tom\"></span> on
        #{@game.start.strftime('%b %e %y, %R %Z')}</strong>.".html_safe
      elsif now < @game.stop && now > @game.stop - 1.hour
        flash.now[:info] = "The game will stop accepting submissions
        <strong><span id=\"major-tom\"></span> on #{@game.stop.strftime('%b %e %y, %R %Z')}
        </strong>."
      else
        flash.now[:info] = I18n.t('game.closed') unless @game.open?
      end
    end
  end

  def load_messages_count
    unless current_user.nil?
      time = current_user.messages_stamp
      @messages_count = if time.nil?
                          @game.messages.count
                        else
                          @game.messages.where('updated_at >= :time', time: time.utc).count
                        end
    end
  end

  def enforce_access
    deny_access unless current_user
  end

  def after_sign_in_path_for(_user)
    root_path
  end
end
