require Rails.root.to_s+'/features/support/admin_helper'
require Rails.root.to_s+'/features/support/general_helper'

World(AdminHelper)
World(GeneralHelper)
