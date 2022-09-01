-- sqlite
SELECT 
	g.membership_id, 
	m.person_id, 
	m.name, 
	p.license_id
FROM 
	get_fit_now_check_in g 
	INNER JOIN get_fit_now_member m
		ON g.membership_id = m.id
	INNER JOIN person p
		ON p.id = m.person_id
WHERE 
	g.check_in_date = 20180109 
	AND g.membership_id IN (
	    SELECT id
		FROM get_fit_now_member 
		WHERE membership_status = "gold" AND id LIKE '48Z%' 
	)
	AND p.license_id IN (
		SELECT id 
		FROM drivers_license 
		WHERE plate_number LIKE '%H42W%' AND gender = 'male'
	)
