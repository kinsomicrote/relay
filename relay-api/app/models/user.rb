class User < ApplicationRecord
    after_initialize :set_default_role, :if => :new_record?

    def set_default_role
        self.role ||= 'staff'
    end
end
