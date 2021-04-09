class Reservation < ApplicationRecord

  validates :details, presence: true, length: { maximum: 1000 }
  validates :date, presence: true, uniqueness: { case_sensitive: true }
  
  validate :current_week

  def current_week
    if Time.now.beginning_of_week(start_day = :sunday) > date
      errors.add :date, 'Não é possível registrar agendamentos em semanas passadas'
    end
  end

  def check_if_is_current_user(current_user_id)
    if (user_id != current_user_id)
      errors.add :user_id, 'Não é possível editar agendamentos que pertençam a outro usuário'
    end
  end
  
  belongs_to :user
end
