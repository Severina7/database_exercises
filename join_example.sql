# Example Exercise for JOIN

# JOIN roles ON users.roles_id = roles.id
# INNER JOIN has a greater potential to leave out data.
# Prefer LEFT JOIN to it and only use when I have a better grasp of the potential result of my work.
# INNER JOIN is the most restrictive
# 
# SELECT users.*, roles.name 
# Difference between USING and ON, doesn't affect NULL