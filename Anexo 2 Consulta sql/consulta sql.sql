SELECT c.id AS client_id,
       h.id AS servicio_id,
       p.name AS nombre_servicio,
       h.regdate,
       ROUND(DATEDIFF(h.nextduedate, h.regdate) / 30) AS meses_activo,
       h.domainstatus,
       h.paymentmethod,
       h.billingcycle,
       h.amount AS total,
       c.state
FROM tblusers_clients cu
JOIN tblclients c ON cu.client_id  = c.id
JOIN tblusers u ON cu.auth_user_id = u.id
JOIN tblhosting h ON c.id = h.userid
LEFT JOIN tblinvoices i ON h.id = i.userid
LEFT JOIN tblproducts p ON h.packageid = p.id;