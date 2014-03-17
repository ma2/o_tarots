module TarotOwner
  extend ActiveSupport::Concern

  def your_tarot?(tarot)
    return unless cookies[:authorized_tarot]
    cookies[:authorized_tarot].split('_').include?(tarot.id.to_s)
  end

  def set_tarot_auth(tarot, pw)
    id = tarot.id.to_s
    return unless tarot.pw == pw
    unless cookies[:authorized_tarot]
      cookies[:authorized_tarot] = id
      return
    end
    ids = cookies[:authorized_tarot].split('_')
    ids << id
    cookies[:authorized_tarot] = ids.sort.uniq.join('_')
  end
end