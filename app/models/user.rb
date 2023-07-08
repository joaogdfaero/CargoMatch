class User < ApplicationRecord
    has_many :trips
    validates :name, :cpf, presence: true
    validate :cpf_is_valid?

    private
    def cpf_is_valid?
        errors.add(:cpf, "CPF inválido! Por favor, verificar os dados.") unless CPF.valid?(cpf)
    end
end
